import {Component, EventEmitter, OnInit, Output, ViewChild} from '@angular/core';
import {Tour} from '../../../model/tour';
import {MatPaginator, MatPaginatorIntl, MatTableDataSource} from '@angular/material';
import {TourService} from '../../../service/tour.service';
import {animate, state, style, transition, trigger} from '@angular/animations';
import {map, startWith, switchMap} from 'rxjs/operators';
import {Page} from '../../../model/response-resource';
import {ShortendTextPipe} from '../../../pipe/shortend-text.pipe';

@Component({
  selector: 'tour-list',
  templateUrl: './tour-list.component.html',
  styleUrls: ['./tour-list.component.scss'],
  providers: [TourService],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({height: '0px', minHeight: '0', display: 'none'})),
      state('expanded', style({height: '*'})),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ]
})
export class TourListComponent implements OnInit {

  @ViewChild(MatPaginator) paginator: MatPaginator;

  @Output('clickEditButton') clickEdit = new EventEmitter<Tour>();

  tours = new MatTableDataSource<Tour>([]);

  page: Page;

  displayedColumns = ['id', 'name', 'action'];

  expandedTour: Tour;

  isLoadingResults = true;

  constructor(private tourService: TourService) {
    this.page = {size: 10, totalElements: 0, totalPages: 0, number: 0};
  }

  ngOnInit() {
    this.changePageIndexAndLoadTour()
  }

  editTour = (event: Event, tour: Tour) => {
    event.stopPropagation();
    this.clickEdit.emit(tour);
  }

  deleteTour = (event: Event, tour: Tour) => {
    event.stopPropagation();
    this.tourService.deleteTourById(tour.id).subscribe(data => {
      console.log(`delete success Tour#${tour.id}`);
      const currentIndex = this.paginator.pageIndex;
      this.paginator._changePageSize(currentIndex);
    });
  }

  changePageIndexAndLoadTour = () => {
    this.paginator.page
      .pipe(
        startWith({}),
        switchMap(() => {
          console.log(`load Tours page=${this.paginator.pageIndex} size=${this.paginator.pageSize}`);
          this.isLoadingResults = true;
          return this.tourService.getTours(this.paginator.pageIndex, this.paginator.pageSize);
        }), map((tour: Tour) => {
          this.isLoadingResults = false;
          this.page = tour.page;
          return tour.content;
        }))
      .subscribe((tours: Tour[]) => {
        console.log(`load Tours complete ${JSON.stringify(tours.map((t: Tour) => t.id))}`);
        this.tours.data = tours;
      });

  }
}
