import { Component, Inject, ViewChild, ElementRef } from '@angular/core';
import { MAT_DIALOG_DATA, MatAutocomplete, MatChipInputEvent, MatAutocompleteSelectedEvent } from '@angular/material';
import { COMMA, ENTER } from '@angular/cdk/keycodes';
import { Plan } from 'app/model/plan';
import { Place } from 'app/model/place';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { FormControl } from '@angular/forms';

@Component({
  selector: 'planning-dialog',
  templateUrl: './planning-dialog.component.html'
})

export class PlanningDialogComponent {

  insertPlan = new Plan(0, '', '', (new Date()).toLocaleString(), 0, 30, 2000000.0, 1000000.0, 0);

  startDate = new Date();

  provinces: Place[] = [];

  inputPlace = new FormControl();

  filteredProvinces: Observable<Place[]>;

  insertedPlaces: Place[] = [];

  separatorKeysCodes: number[] = [ENTER, COMMA];

  @ViewChild('placeInput') placeInput: ElementRef<HTMLInputElement>;
  @ViewChild('auto') matAutocomplete: MatAutocomplete;


  constructor(@Inject(MAT_DIALOG_DATA) public data: {
    places: Place[],
    insertPlan: Plan
  }) {
    this.provinces = data.places;
    this.insertPlan = data.insertPlan;
    
    this.filteredProvinces = this.inputPlace.valueChanges
      .pipe(
        startWith(''),
        map((input: string | Place | null) => input ? this._filterStates(input) : this.provinces.slice())
      );
  }

  // add(event: MatChipInputEvent): void {
  //   // Add place only when MatAutocomplete is not open
  //   // To make sure this does not conflict with OptionSelected Event
  //   if (!this.matAutocomplete.isOpen) {
  //     const input = event.input;
  //     const value = event.value;

  //     // Add our place
  //     if ((value || '').trim()) {
  //       const index = 
  //       this.insertedPlaces.push();
  //     }

  //     this.inputPlace.setValue(null);
  //   }
  // }

  remove = (p: Place) => {
    // move province from insertPlaces array to provinces array
    this.provinces.push(p);
    const index = this.insertedPlaces.indexOf(p);
    if (index >= 0) {
      this.insertedPlaces.splice(index, 1);
    }
  }

  selected = (event: MatAutocompleteSelectedEvent) => {
    // move province from provinces array to insertPlaces array
    this.insertedPlaces.push(event.option.value);
    const index = this.provinces.indexOf(event.option.value);
    if (index >= 0) {
      this.provinces.splice(index, 1);
    }

    // reset input
    this.placeInput.nativeElement.value = '';
    this.inputPlace.setValue(null);
  }

  private _filterStates = (value: string | Place): Place[] => {
    if (typeof value === 'string') {
      // optimize search
      const searchValue = this.encodingVietNamese(value);
      return this.provinces.filter(p => this.encodingVietNamese(p.name).includes(searchValue));

    } else
      return this.provinces.filter(p => p.id === value.id);
  }

  encodingVietNamese = (str) => {
    str = str.toLowerCase();
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, 'a');
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, 'e');
    str = str.replace(/ì|í|ị|ỉ|ĩ/g, 'i');
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, 'o');
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, 'u');
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, 'y');
    str = str.replace(/đ/g, 'd');
    str = str.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'|\"|\&|\#|\[|\]|~|\$|_|`|-|{|}|\||\\/g, ' ');
    str = str.replace(/ + /g, '-');
    str = str.trim();
    str = str.replace(/\s+/g, '-')
    str = str.toLowerCase();
    return str;
  }

}