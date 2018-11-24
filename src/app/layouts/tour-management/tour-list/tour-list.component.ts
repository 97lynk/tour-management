import {Component, OnInit, ViewChild} from '@angular/core';
import {Tour} from '../../../model/tour';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import {TourService} from '../../../service/tour.service';
import {trigger, state, style, transition, animate} from '@angular/animations';
import {MatTableDataSource} from '@angular/material';
import {of} from 'rxjs';
import {map, startWith, switchMap} from 'rxjs/operators';
import {switchMapTo} from 'rxjs-compat/operator/switchMapTo';
import {Page} from '../../../model/response-resource';

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

  tours = new MatTableDataSource<Tour>([]);

  page: Page;

  displayedColumns = ['id', 'name'];

  expandedTour: Tour;

  isLoadingResults = true;

  constructor(private tourService: TourService) {
    this.page = { size: 10, totalElements: 0, totalPages: 0, number: 0};
  }

  ngOnInit() {
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
