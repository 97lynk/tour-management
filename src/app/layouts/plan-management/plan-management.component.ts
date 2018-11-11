import { Component, OnInit, ViewChild, Output, EventEmitter } from '@angular/core';
import { Observable } from 'rxjs';
import { animate, state, style, transition, trigger } from '@angular/animations';
import { MatPaginator, MatTableDataSource, MatDialog } from '@angular/material';
import { debounceTime, distinctUntilChanged, filter, map } from 'rxjs/operators';
import { Tour } from 'app/model/tour';
import { Plan } from 'app/model/plan';
import { Place } from 'app/model/place';
import { PlaceService } from 'app/service/place.service';
import { PlanService } from 'app/service/plan.service';
import { TourService } from 'app/service/tour.service';
import { PlanningDialogComponent } from './dialog/planning-modal.component';

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
    showPlans: boolean,
    plans: Plan[],
  };


  // @ViewChild('instance') instance: NgbTypeahead;
  // focus$ = new Subject<string>();
  // click$ = new Subject<string>();

  tourPlans = new MatTableDataSource<{
    tour: Tour,
    showPlans: boolean,
    plans: Plan[],
  }>([]);
  @ViewChild(MatPaginator) paginator: MatPaginator;


  abc: Tour[] = [];

  provinces: Place[] = [];

  insertPlan = new Plan(0, '', '', (new Date()).toLocaleString(), 0, 30, 2000000.0, 1000000.0, 0);
  placesOfPlans = [];

  // startDate: NgbDateStruct;
  // startTime: NgbTimeStruct;

  // places when planning

  inputSearch = ''

  constructor(
    private placeService: PlaceService,
    private planService: PlanService,
    private tourService: TourService,
    private dialog: MatDialog) {
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
    this.getPlaceOfPlan();
  }

  // // format text show in dropdown items
  // formatter = (p: Place) => p.name;

  // /**
  //  * methods exchange data with api
  //  */

  getAllProvince = () => this.placeService.getPlaces(0, 100)
    .subscribe((data: Place[]) => this.provinces = data);

  getPlaceOfPlan = () => this.placeService.getPlansWithPlaces()
    .subscribe((data: []) => this.placesOfPlans = data);

  getAllTour = () => {
    this.tourService.getTours(0, 1000)
      .subscribe((data: Tour[]) => {
        // clear all data
        this.abc = data;
        this.tourPlans.data = [];



        data.forEach(t => {
          // push data from response
          this.tourPlans.data.push({
            tour: t,
            showPlans: true,
            plans: []
          });
          this.tourPlans.paginator = this.paginator;

          // get plans for each tour
          this.planService.getPlansByTourId(t.id)
            .subscribe((plans: Plan[]) => {
              let index = this.tourPlans.data.findIndex(tp => tp.tour.id == t.id);
              if (index >= 0) this.tourPlans.data[index].plans = plans;
            });
        })
      });
  }

  /**
   * methods handle events
   */

  openDialogPlanning = (tour: Tour) => {
    // init value on form
    this.insertPlan.name = tour.name;
    this.insertPlan.url = this.encodingVietNamese(tour.name);
    this.insertPlan.tourId = tour.id;
    this.insertPlan.numberOfSlot = 30;
    this.insertPlan.numberOfReservedSlot = 0;
    const dialogRef = this.dialog.open(PlanningDialogComponent, {
      data: {
        places: this.provinces,
        insertPlan: this.insertPlan
      }
    });

    dialogRef.afterClosed().subscribe(result => {
      if(result === true){
         //       // save date time
  //       this.insertPlan.startTime = new Date(
  //         this.startDate.year, this.startDate.month - 1, this.startDate.day,
  //         this.startTime.hour, this.startTime.minute, this.startTime.second)
  //         .toLocaleString();


  //       console.log(`saving plan... ${JSON.stringify(this.insertPlan, null, 2)}`);

  //       // save a plan
  //       this.planService.addNewPlan(this.insertPlan).subscribe((plan: Plan) => {
  //         // save places of the plan
  //         this.insertedPlaces.forEach(place =>
  //           this.placeService.addPlacesForPlan({ planId: plan.id, placeId: place.id }).subscribe()
  //         );
  //       });

  //       // refresh data
  //       this.getAllProvince();
  //       this.getPlaceOfPlan();
  //       this.getAllTour();
      }
      console.log(`Dialog result: ${result}`);
    });
  }

  // handle click planning button to show modal
  // open = (content: any, event: Event, tour: any) => {
  //   console.log(`planning for tour ${JSON.stringify(tour)}`);

  //   // init value on form
  //   this.insertPlan.name = tour.name;
  //   this.insertPlan.url = this.encodingVietNamese(tour.name);
  //   this.insertPlan.tourId = tour.id;
  //   this.insertPlan.numberOfSlot = 30;
  //   this.insertPlan.numberOfReservedSlot = 0;

  //   // handle modal event
  //   this.modalService.open(content, { ariaLabelledBy: 'modal-basic-title', size: 'lg' })
  //     // click save button
  //     .result.then((result) => {
  //       // save date time
  //       this.insertPlan.startTime = new Date(
  //         this.startDate.year, this.startDate.month - 1, this.startDate.day,
  //         this.startTime.hour, this.startTime.minute, this.startTime.second)
  //         .toLocaleString();


  //       console.log(`saving plan... ${JSON.stringify(this.insertPlan, null, 2)}`);

  //       // save a plan
  //       this.planService.addNewPlan(this.insertPlan).subscribe((plan: Plan) => {
  //         // save places of the plan
  //         this.insertedPlaces.forEach(place =>
  //           this.placeService.addPlacesForPlan({ planId: plan.id, placeId: place.id }).subscribe()
  //         );
  //       });

  //       // refresh data
  //       this.getAllProvince();
  //       this.getPlaceOfPlan();
  //       this.getAllTour();
  //     }, (reason) => { // closing modal
  //       // this.getAllProvince();
  //     });

  // }

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

  getProvinceNames = (planId: number): string => {
    let places = this.placesOfPlans.filter(pp => pp.planId === planId);
    if (places != undefined && places.length >= 0) {
      return places.map(p => p.place.name).reduce((a, b) => a + b + ', ', ' ');
    }
    return '';
  }

  viewData = () => alert(this.inputSearch);
}

export interface PeriodicElement {
  name: string;
  position: number;
  weight: number;
  symbol: string;
  description: string;
}

const ELEMENT_DATA: PeriodicElement[] = [
  {
    position: 1,
    name: 'Hydrogen',
    weight: 1.0079,
    symbol: 'H',
    description: `Hydrogen is a chemical element with symbol H and atomic number 1. With a standard
        atomic weight of 1.008, hydrogen is the lightest element on the periodic table.`
  }, {
    position: 2,
    name: 'Helium',
    weight: 4.0026,
    symbol: 'He',
    description: `Helium is a chemical element with symbol He and atomic number 2. It is a
        colorless, odorless, tasteless, non-toxic, inert, monatomic gas, the first in the noble gas
        group in the periodic table. Its boiling point is the lowest among all the elements.`
  }, {
    position: 3,
    name: 'Lithium',
    weight: 6.941,
    symbol: 'Li',
    description: `Lithium is a chemical element with symbol Li and atomic number 3. It is a soft,
        silvery-white alkali metal. Under standard conditions, it is the lightest metal and the
        lightest solid element.`
  }, {
    position: 4,
    name: 'Beryllium',
    weight: 9.0122,
    symbol: 'Be',
    description: `Beryllium is a chemical element with symbol Be and atomic number 4. It is a
        relatively rare element in the universe, usually occurring as a product of the spallation of
        larger atomic nuclei that have collided with cosmic rays.`
  }, {
    position: 5,
    name: 'Boron',
    weight: 10.811,
    symbol: 'B',
    description: `Boron is a chemical element with symbol B and atomic number 5. Produced entirely
        by cosmic ray spallation and supernovae and not by stellar nucleosynthesis, it is a
        low-abundance element in the Solar system and in the Earth's crust.`
  }, {
    position: 6,
    name: 'Carbon',
    weight: 12.0107,
    symbol: 'C',
    description: `Carbon is a chemical element with symbol C and atomic number 6. It is nonmetallic
        and tetravalent—making four electrons available to form covalent chemical bonds. It belongs
        to group 14 of the periodic table.`
  }, {
    position: 7,
    name: 'Nitrogen',
    weight: 14.0067,
    symbol: 'N',
    description: `Nitrogen is a chemical element with symbol N and atomic number 7. It was first
        discovered and isolated by Scottish physician Daniel Rutherford in 1772.`
  }, {
    position: 8,
    name: 'Oxygen',
    weight: 15.9994,
    symbol: 'O',
    description: `Oxygen is a chemical element with symbol O and atomic number 8. It is a member of
         the chalcogen group on the periodic table, a highly reactive nonmetal, and an oxidizing
         agent that readily forms oxides with most elements as well as with other compounds.`
  }, {
    position: 9,
    name: 'Fluorine',
    weight: 18.9984,
    symbol: 'F',
    description: `Fluorine is a chemical element with symbol F and atomic number 9. It is the
        lightest halogen and exists as a highly toxic pale yellow diatomic gas at standard
        conditions.`
  }, {
    position: 10,
    name: 'Neon',
    weight: 20.1797,
    symbol: 'Ne',
    description: `Neon is a chemical element with symbol Ne and atomic number 10. It is a noble gas.
        Neon is a colorless, odorless, inert monatomic gas under standard conditions, with about
        two-thirds the density of air.`
  },
];