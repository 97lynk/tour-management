import { Component, OnInit, ViewChild, Output, EventEmitter } from '@angular/core';
import { Observable, from } from 'rxjs';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { MatPaginator, MatTableDataSource, MatDialog, MatSnackBar } from '@angular/material';
import { debounceTime, distinctUntilChanged, filter, map, groupBy, mergeMap, toArray } from 'rxjs/operators';
import { Tour } from 'app/model/tour';
import { Plan } from 'app/model/plan';
import { Place } from 'app/model/place';
import { PlaceService } from 'app/service/place.service';
import { PlanService } from 'app/service/plan.service';
import { TourService } from 'app/service/tour.service';
import { PlanningDialogComponent } from './dialog/planning-modal.component';

declare var $: any;

const SERVER = 'http://localhost:4000';


@Component({
  selector: 'app-plan-management',
  templateUrl: './plan-management.component.html',
  styleUrls: ['./plan-management.component.scss'],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0', display: 'none' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ],
  providers: [PlaceService, PlanService, TourService]
})
export class PlanManagementComponent implements OnInit {

  columnsToDisplay = ['id', 'name', 'noDN', 'action'];
  expandedElement: {
    tour: Tour,
    plans: any[],
  };

  tourPlans = new MatTableDataSource<any>([]);

  @ViewChild(MatPaginator) paginator: MatPaginator;

  provinces: Place[] = [];

  placesOfPlans = [];

  // startDate: NgbDateStruct;
  // startTime: NgbTimeStruct;

  // places when planning

  inputSearch = ''

  constructor(
    private placeService: PlaceService,
    private planService: PlanService,
    private tourService: TourService,
    private dialog: MatDialog,
    private snackBar: MatSnackBar) {
    // private modalService: NgbModal,
    // private calendar: NgbCalendar, {
    // // init startDate 
    // this.startDate = this.calendar.getToday();
    // // init startTime
    // this.startTime = {
    //   hour: (new Date).getHours(),
    //   minute: (new Date).getMinutes(),
    //   second: (new Date).getSeconds()
    // };
  }

  ngOnInit() {
    this.getAllTour();
    this.getAllProvince();
  }

  // /**
  //  * methods exchange data with api
  //  */

  getAllProvince = () => this.placeService.getPlaces(0, 100)
    .subscribe((data: Place[]) => this.provinces = data);

  getAllTour = () => {
    this.tourService.getToursAndPlans(0, 1000)
      .subscribe((data: any[]) => {
        // clear all data
        this.tourPlans.data = data;
        this.tourPlans.paginator = this.paginator;
      });
  }

  /**
   * methods handle events
   */

  // for add new plan
  openDialogAddPlan = (tour: any) => {
    // init value on form
    let insertPlan = new Plan(0, tour.name, this.encodingVietNamese(tour.name),
      Date.now(), 30, 0, 3000000, 2000000, tour.id);
    let insertPlaces = [];

    // open the dialog and pass data
    const dialogRef = this.dialog.open(PlanningDialogComponent, {
      data: {
        title: `Add new plan for tour#${tour.id}`,
        places: this.provinces,
        plan: insertPlan,
        choosedPlaces: insertPlaces
      }
    });

    // handle when close dialog
    dialogRef.afterClosed().subscribe(result => {
      if (result === true) {
        console.log(`saving plan...\n ${JSON.stringify(insertPlan, null, 3)}`);

        // save a plan
        this.planService.addNewPlan(insertPlan).subscribe((plan: Plan) => {

          // save places of the plan
          insertPlaces.forEach(place =>
            this.placeService.addPlacesForPlan({ planId: plan.id, placeId: place.id }).subscribe()
          );

          // show success notification
          this.showNotification('date_range', 'success', 'Planning', 'Oh yeah. You were succesful!', `/plans/${plan.id}`, '_blank');

        }, error => {
          // log error
          console.log(`error for saving plan: \n${JSON.stringify(error, null, 2)}`);
          // show success notification
          this.showNotification('date_range', 'danger', 'Planning', 'Oh no. Something went wrong.', `/report`, '_blank')
        });

        // refresh data
        this.getAllTour();
      }
    });
  }
  // for update plan
  openDialogUpdatePlan = (updatePlan: any) => {
    this.placeService.getPlacesForPlan(updatePlan.id)
      .subscribe((data: any[]) => {

        let updatePlaces = data.map(pp => pp.place);

        // open the dialog and pass data
        const dialogRef = this.dialog.open(PlanningDialogComponent, {
          data: {
            title: `Change a plan#${updatePlan.id}`,
            places: this.provinces,
            plan: updatePlan,
            choosedPlaces: updatePlaces
          }
        });

        // handle when close dialog
        dialogRef.afterClosed().subscribe(result => {
          if (result === true) {
            console.log(`changing plan...\n ${JSON.stringify(updatePlan, null, 3)}`);

            // save a plan
            this.planService.updatePlan(updatePlan).subscribe((plan: Plan) => {

              // // save places of the plan
              // this.insertedPlaces.forEach(place =>
              //   this.placeService.addPlacesForPlan({ planId: plan.id, placeId: place.id }).subscribe()
              // );

              // // clear array
              // this.insertedPlaces = [];
              // // show success notification
              this.showNotification('date_range', 'success', 'Planning', 'Oh yeah. You were succesful!', `/plans/${plan.id}`, '_blank');

            }, error => {
              // log error
              console.log(`error for change plan: \n${JSON.stringify(error, null, 2)}`);
              // show success notification
              this.showNotification('date_range', 'danger', 'Planning', 'Oh no. Something went wrong.', `/report`, '_blank')
            });

            // refresh data
            this.getAllTour();
          }
        });
      });

  }

  deletePlan = (plan: any) => {
    let plans: [] = this.tourPlans.data.find(t => t.id == plan.tourId).plans;
    const index = plans.findIndex(p => plan.id);
    let deletePlan = plans.splice(index, 1)[0];
    console.log(deletePlan);
    let snackBarRef = this.snackBar.open('Delete a plan success', 'Undo', { duration: 2000 });

    let action = false;
    snackBarRef.onAction().subscribe(() => {
      action = true;
    });

    snackBarRef.afterDismissed().subscribe(() => {
      if (action == false)
        this.planService.deletePlan(plan.id).subscribe();
      else
      this.tourPlans.data.find(t => t.id == plan.tourId).plans.splice(index, 0, deletePlan);


    });

    // this.getAllTour();
    // });
  }

  /**
   * extra methods
   */
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

  viewData = () => alert(this.inputSearch);
}

