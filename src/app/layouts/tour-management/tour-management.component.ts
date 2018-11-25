import {Component, ElementRef, HostListener, OnInit, ViewChild} from '@angular/core';
import {Tour} from 'app/model/tour';
import {TourService} from 'app/service/tour.service';
import {TourListComponent} from './tour-list/tour-list.component';
import {TourFormComponent} from './tour-form/tour-form.component';
import {NavigationEnd, Router} from '@angular/router';

@Component({
  selector: 'app-tour-management',
  templateUrl: './tour-management.component.html',
  styleUrls: ['./tour-management.component.scss'],
  providers: [TourService],

})
export class TourManagementComponent implements OnInit {

  @ViewChild(TourListComponent) tableTours: TourListComponent;
  @ViewChild(TourFormComponent) tourForm: TourFormComponent;

  constructor(private tourService: TourService,
              private router: Router) {
  }

  ngOnInit() {
  }

  submitNewTour = (insertTour: Tour) => {
    if (this.tourForm.insertMode)
      this.tourService.addNewTour(insertTour)
        .subscribe((tour: Tour) => {
          console.log(`Add new tour success Tour#${tour.id} - ${tour.links[0].href}`);

          // change to last page
          this.tableTours.paginator.lastPage();
          // clear form
          this.tourForm.refreshPage();
        });
  }

  submitEditTour = (editTour: Tour) => {
    if (!this.tourForm.insertMode && editTour.id != -1)
      this.tourService.updateTourById(editTour.id, editTour)
        .subscribe((tour: Tour) => {
          console.log(`Edit tour success Tour#${tour.id} - ${tour.links[0].href}`);

          // change to first page
          this.tableTours.paginator.firstPage();
          // clear form
          this.tourForm.refreshPage();
        });
  }

  clickEditTour = (tour: Tour, tourForm: any) => {
    tourForm.scrollIntoView(true);

    // change data of form
    this.tourForm.insertMode = false;
    this.tourForm.tour = tour;
    this.tourService.loadContentPostOfTour(tour.fileContentUrl)
      .subscribe((html: string) => this.tourForm.contentHTML = html);
  }
}
