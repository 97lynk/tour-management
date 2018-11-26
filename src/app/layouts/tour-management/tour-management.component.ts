import {Component, OnInit, ViewChild} from '@angular/core';
import {Tour} from 'app/model/tour';
import {TourService} from 'app/service/tour.service';
import {TourListComponent} from './tour-list/tour-list.component';
import {TourFormComponent} from './tour-form/tour-form.component';
import {Router} from '@angular/router';

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

  submitNewTour = (insertTour: Tour, scrollTarget: any) => {
    if (this.tourForm.insertMode) {
      this.tourService.addNewTour(insertTour)
        .subscribe((tour: Tour) => {
          console.log(`Add new tour success Tour#${tour.id} - ${tour.links[0].href}`);

          // prepare file html
          const fileHTML = new File([this.tourForm.contentHTML], `${tour.url}-${tour.id}.html`,
            { type: 'text/html'});
          this.tourService.uploadContentPostOfTour(fileHTML)
            .subscribe((fileUrl: any) => console.log(`store file complete at ${fileUrl}`));

          // change to last page
          this.tableTours.paginator.lastPage();
          // clear form
          this.tourForm.refreshPage();
          // scroll to
          scrollTarget.scrollIntoView(true);
        });
    }
  }

  submitEditTour = (editTour: Tour, scrollTarget: any) => {
    if (!this.tourForm.insertMode && editTour.id !== -1) {
      this.tourService.updateTourById(editTour.id, editTour)
        .subscribe((tour: Tour) => {
          console.log(`Edit tour success Tour#${tour.id} - ${tour.links[0].href}`);

          // prepare file html
          const fileHTML = new File([this.tourForm.contentHTML], `${tour.url}-${tour.id}.html`,
            { type: 'text/html'});
          this.tourService.uploadContentPostOfTour(fileHTML)
            .subscribe((fileUrl: any) => console.log(`store file complete at ${fileUrl}`));

          // change to first page
          this.tableTours.paginator.firstPage();
          // clear form
          this.tourForm.refreshPage();
          // scroll to
          scrollTarget.scrollIntoView(true);
        });
    }
  }

  clickEditTour = (tour: Tour, scrollTarget: any) => {
    scrollTarget.scrollIntoView(true);

    // change data of form
    this.tourForm.insertMode = false;
    this.tourForm.tour = tour;
    this.tourService.loadContentPostOfTour(tour.fileContentUrl)
      .subscribe((html: string) => this.tourForm.contentHTML = html);
  }
}
