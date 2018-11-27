import {Component, ElementRef, Input, OnInit, ViewChild} from '@angular/core';
import {Plan} from '../../../../model/plan';
import {MatAutocomplete, MatAutocompleteSelectedEvent} from '@angular/material';
import {Place} from '../../../../model/place';
import {FormControl} from '@angular/forms';
import {Observable} from 'rxjs';
import {COMMA, ENTER} from '@angular/cdk/keycodes';
import {map, startWith} from 'rxjs/operators';
import {VTextEncodePipe} from '../../../../pipe/vtext-encode.pipe';

@Component({
  selector: 'plan-form',
  templateUrl: './plan-form.component.html',
  styleUrls: ['./plan-form.component.scss'],
  providers: [VTextEncodePipe]
})
export class PlanFormComponent implements OnInit {

  @Input('plan') plan: Plan;

  @Input('provinces') provinces: Place[];

  @ViewChild('placeInput') placeInput: ElementRef<HTMLInputElement>;
  @ViewChild('auto') matAutocomplete: MatAutocomplete;



  title = '';

  startDateTime = new Date();

  inputPlace = new FormControl();

  filteredProvinces: Observable<Place[]>;

  choosedPlaces: Place[] = [];

  separatorKeysCodes: number[] = [ENTER, COMMA];

  constructor(
    private vtextPipe: VTextEncodePipe
  ) {

    this.choosedPlaces = [];

    this.filteredProvinces = this.inputPlace.valueChanges
      .pipe(
        startWith(''),
        map((input: string | Place | null) => input ? this._filterStates(input) : this.provinces.slice())
      );
  }

  ngOnInit() {
    this.startDateTime = new Date(this.plan.startTime);
    const placesOfPlan = this.provinces.filter((p, index) => this.plan.placeIds.includes(p.id));
    placesOfPlan.forEach(p => this.add(p));
  }

  changeTime(event: any) {
    if (event.target.value.length === 5) {
      const times = String(event.target.value).split(':');
      this.startDateTime.setHours(Number(times[0]));
      this.startDateTime.setMinutes(Number(times[1]));

      // this.plan.startTime = this.startDateTime.getTime();
    }
  }

  remove = (p: Place) => {
    // move province from insertPlaces array to provinces array
    this.provinces.push(p);
    const index = this.choosedPlaces.indexOf(p);
    if (index >= 0) {
      this.choosedPlaces.splice(index, 1);
    }
  }

  add = (p: Place) => {
    // move province from provinces array to insertPlaces array
    this.choosedPlaces.push(p);
    const index = this.provinces.indexOf(p);
    if (index >= 0) {
      this.provinces.splice(index, 1);
    }
  }

  selected = (event: MatAutocompleteSelectedEvent) => {
    this.add(event.option.value);

    // reset input
    this.placeInput.nativeElement.value = '';
    this.inputPlace.setValue(null);
  }

  private _filterStates = (value: string | Place): Place[] => {
    if (typeof value === 'string') {
      // optimize search
      const searchValue = this.vtextPipe.transform(value);
      return this.provinces.filter(p => this.vtextPipe.transform(p.name).includes(searchValue));

    } else
      return this.provinces.filter(p => p.id === value.id);
  }

  encodingVietNamese = (text: string):string => this.vtextPipe.transform(text);
}
