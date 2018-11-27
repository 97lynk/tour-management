import {Component, OnInit, ViewChild} from '@angular/core';
import {animate, state, style, transition, trigger} from '@angular/animations';
import {MatDialog, MatFormFieldControl, MatPaginator, MatSnackBar, MatTableDataSource} from '@angular/material';
import {Plan} from 'app/model/plan';
import {Place} from 'app/model/place';
import {PlaceService} from 'app/service/place.service';
import {PlanService} from 'app/service/plan.service';
import {TourService} from 'app/service/tour.service';
import {Page} from '../../model/response-resource';
import {map, startWith, switchMap} from 'rxjs/operators';
import {Tour} from '../../model/tour';
import {FormBuilder, FormGroup, Validators} from '@angular/forms';

declare var $: any;


@Component({
  selector: 'app-plan-management',
  templateUrl: './plan-management.component.1.html',
  styleUrls: ['./plan-management.component.scss'],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({height: '0px', minHeight: '0', display: 'none'})),
      state('expanded', style({height: '*'})),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
  providers: [PlaceService, PlanService, TourService]
})
export class PlanManagementComponent implements OnInit {

  @ViewChild('planPaginator') paginator: MatPaginator;

  page: Page;


  plans: Plan[];

  tourExpanded: Tour;

  placeNames: string;



  provinces: Place[];

  //
  editPlan: Plan;

  showPlanStepper: boolean;

  constructor(
    private placeService: PlaceService,
    private tourService: TourService,
    private planService: PlanService) {
    this.page = {size: 10, totalElements: 0, totalPages: 0, number: 0};
    this.provinces = [];
    this.placeNames = '';
    this.showPlanStepper = false;
  }

  ngOnInit() {
    this.paginator.page
      .pipe(
        startWith({}),
        switchMap(() => {
          console.log(`load Tours page=${this.paginator.pageIndex} size=${this.paginator.pageSize}`);
          // this.isLoadingResults = true;
          return this.planService.getPlans(this.paginator.pageIndex, this.paginator.pageSize);
        }), map((plans: Plan) => {
          // this.isLoadingResults = false;
          this.page = plans.page;
          return plans.content;
        }))
      .subscribe((plans: Plan[]) => {
        this.plans = plans;
      });

    this.getAllProvince();
  }


  loadTour = (plan: Plan) => {
    this.tourService.getTourById(plan.tourId)
      .subscribe((tour: Tour) => {
          this.tourExpanded = tour;
      });

    this.placeService.getPlacesByPlanId(plan.id)
      .subscribe((places: Place) => this.placeNames = places.content.map(p=>p.name).join(', '))
  }

  /**
   * methods exchange data with api
   */

  getAllProvince = () => this.placeService.getPlaces()
    .subscribe((places: Place) => this.provinces = places.content);

  /**
   * methods handle events
   */

  // // for add new plan
  // openDialogAddPlan = (tour: any) => {
  //   // init value on form
  //   let insertPlan = new Plan(0, tour.name, this.encodingVietNamese(tour.name),
  //     Date.now(), 30, 0, 3000000, 2000000, tour.id);
  //   let insertPlaces = [];
  //
  //   // open the dialog and pass data
  //   const dialogRef = this.dialog.open(PlanningDialogComponent, {
  //     data: {
  //       title: `Add new plan for tour#${tour.id}`,
  //       places: this.provinces,
  //       plan: insertPlan,
  //       choosedPlaces: insertPlaces
  //     }
  //   });
  //
  //   // handle when close dialog
  //   dialogRef.afterClosed().subscribe(result => {
  //     if (result === true) {
  //       console.log(`saving plan...\n ${JSON.stringify(insertPlan, null, 3)}`);
  //
  //       // save a plan
  //       this.planService.addNewPlan(insertPlan).subscribe((plan: Plan) => {
  //
  //         // save places of the plan
  //         insertPlaces.forEach(place =>
  //           this.placeService.addPlacesForPlan({ planId: plan.id, placeId: place.id }).subscribe()
  //         );
  //
  //         // show success notification
  //         this.showNotification('date_range', 'success', 'Planning', 'Oh yeah. You were succesful!', `/plans/${plan.id}`, '_blank');
  //
  //       }, error => {
  //         // log error
  //         console.log(`error for saving plan: \n${JSON.stringify(error, null, 2)}`);
  //         // show success notification
  //         this.showNotification('date_range', 'danger', 'Planning', 'Oh no. Something went wrong.', `/report`, '_blank')
  //       });
  //
  //       // refresh data
  //       this.getAllTour();
  //     }
  //   });
  // }
  // // for update plan
  // openDialogUpdatePlan = (updatePlan: any) => {
  //   this.placeService.getPlacesForPlan(updatePlan.id)
  //     .subscribe((data: any[]) => {
  //
  //       let updatePlaces = data.map(pp => pp.place);
  //
  //       // open the dialog and pass data
  //       const dialogRef = this.dialog.open(PlanningDialogComponent, {
  //         data: {
  //           title: `Change a plan#${updatePlan.id}`,
  //           places: this.provinces,
  //           plan: updatePlan,
  //           choosedPlaces: updatePlaces
  //         }
  //       });
  //
  //       // handle when close dialog
  //       dialogRef.afterClosed().subscribe(result => {
  //         if (result === true) {
  //           console.log(`changing plan...\n ${JSON.stringify(updatePlan, null, 3)}`);
  //
  //           // save a plan
  //           this.planService.updatePlan(updatePlan).subscribe((plan: Plan) => {
  //
  //             // // save places of the plan
  //             // this.insertedPlaces.forEach(place =>
  //             //   this.placeService.addPlacesForPlan({ planId: plan.id, placeId: place.id }).subscribe()
  //             // );
  //
  //             // // clear array
  //             // this.insertedPlaces = [];
  //             // // show success notification
  //             this.showNotification('date_range', 'success', 'Planning', 'Oh yeah. You were succesful!', `/plans/${plan.id}`, '_blank');
  //
  //           }, error => {
  //             // log error
  //             console.log(`error for change plan: \n${JSON.stringify(error, null, 2)}`);
  //             // show success notification
  //             this.showNotification('date_range', 'danger', 'Planning', 'Oh no. Something went wrong.', `/report`, '_blank')
  //           });
  //
  //           // refresh data
  //           this.getAllTour();
  //         }
  //       });
  //     });
  //
  // }
  //
  // deletePlan = (plan: any) => {
  //   let plans: any[] = this.tourPlans.data.find(t => t.id == plan.tourId).plans;
  //   const index = plans.findIndex(p => plan.id);
  //   let deletePlan = plans.splice(index, 1)[0];
  //   console.log(deletePlan);
  //   let snackBarRef = this.snackBar.open('Delete a plan success', 'Undo', { duration: 2000 });
  //
  //   let action = false;
  //   snackBarRef.onAction().subscribe(() => {
  //     action = true;
  //   });
  //
  //   snackBarRef.afterDismissed().subscribe(() => {
  //     if (action == false)
  //       this.planService.deletePlan(plan.id).subscribe();
  //     else
  //     this.tourPlans.data.find(t => t.id == plan.tourId).plans.splice(index, 0, deletePlan);
  //
  //
  //   });
  //
  //   // this.getAllTour();
  //   // });
  // }

  /**
   * extra methods
   */

  showNotification = (_matIcon: string, _type: string, _title: string,
                      _message: string, _url: string, _target: string) => {
    $.notify({
      title: _title,
      message: _message,
      url: _url,
      target: _target
    }, {
      type: _type,
      timer: 3000,
      placement: {
        from: 'bottom',
        align: 'right'
      },
      template: `<div data-notify="container" class="col-xl-4 col-lg-4 col-11 col-sm-4 col-md-4 alert alert-{0} alert-with-icon" role="alert">
          <button mat-button type="button" aria-hidden="true" class="close mat-button" data-notify="dismiss"> <i class="material-icons">close</i></button>
          <i class="material-icons" data-notify="icon">${_matIcon}</i>
          <h4 data-notify="title">{1}</h4>
          <p data-notify="message">{2}</p>
          <div class="progress" data-notify="progressbar">
              <div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                  style="width: 0%;"></div>
          </div>
          <a href="{3}" target="{4}" data-notify="url"></a>
        </div>`
    });
  }

}

