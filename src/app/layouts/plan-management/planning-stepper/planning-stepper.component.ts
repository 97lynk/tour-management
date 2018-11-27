import {Component, Input, OnInit, ViewChild} from '@angular/core';
import {Tour} from '../../../model/tour';
import {TourService} from '../../../service/tour.service';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import {Place} from '../../../model/place';
import {PlanService} from '../../../service/plan.service';
import {Plan} from '../../../model/plan';
import {Observable} from 'rxjs';
import {COMMA, ENTER} from '@angular/cdk/keycodes';
import {MatPaginator} from '@angular/material';
import {Page} from '../../../model/response-resource';
import {map, startWith, switchMap} from 'rxjs/operators';

@Component({
  selector: 'planning-stepper',
  templateUrl: './planning-stepper.component.html',
  styleUrls: ['./planning-stepper.component.scss']
})
export class PlanningStepperComponent implements OnInit {

  @Input('plan') plan: Plan;
  @Input('provinces') provinces: Place[];

  @ViewChild('tourPaginator') paginator: MatPaginator;
  page: Page;

  firstFormGroup: FormGroup;
  secondFormGroup: FormGroup;

  tours: Tour[];

  choosedTour: Tour;

  notExistTour: boolean;

  constructor(private tourService: TourService,
              private formBuilder: FormBuilder) {

    this.notExistTour = false;
    this.page = {size: 10, totalElements: 0, totalPages: 0, number: 0};
  }

  ngOnInit() {
    this.firstFormGroup = this.formBuilder.group({
      firstCtrl: ['', Validators.required]
    });
    this.secondFormGroup = this.formBuilder.group({
      secondCtrl: ['', Validators.required]
    });

    this.choosedTour = new Tour();
    this.choosedTour.id = this.plan.tourId;
    this.paginator.page
      .pipe(
        startWith({}),
        switchMap(() => {
          console.log(`load Tours page=${this.paginator.pageIndex} size=${this.paginator.pageSize}`);
          // this.isLoadingResults = true;
          return this.tourService.getTours(this.paginator.pageIndex, this.paginator.pageSize);
        }), map((tour: Tour) => {
          // this.isLoadingResults = false;
          this.page = tour.page;
          return tour.content;
        }))
      .subscribe((tours: Tour[]) => {
        console.log(`load Tours complete ${JSON.stringify(tours.map((t: Tour) => t.id))}`);
        this.tours = tours;
        tours.forEach(t => {
          if (t.id == this.plan.tourId) this.choosedTour = t;
        })
      });
  }


  // TODO valid tour id
  checkExistTour(tourId: number | string) {
    this.tourService.getTourById(tourId)
      .subscribe((tour: Tour) => this.notExistTour = false, error => {
        this.notExistTour = true;
        console.log(this.notExistTour);
      });
  }

}
