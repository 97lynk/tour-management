import {Component, EventEmitter, OnInit, Output, ViewChild} from '@angular/core';
import {Tour} from '../../../model/tour';
import {MatPaginator, MatPaginatorIntl, MatTableDataSource} from '@angular/material';
import {TourService} from '../../../service/tour.service';
import {trigger, state, style, transition, animate} from '@angular/animations';
import {map, startWith, switchMap} from 'rxjs/operators';
import {Page} from '../../../model/response-resource';

@Component({
  selector: 'tour-list',
  templateUrl: './tour-list.component.html',
  styleUrls: ['./tour-list.component.scss'],
  providers: [TourService, {
    provide: MatPaginatorIntl, useClass: () => {
      const paginatorLabels = new MatPaginatorIntl();
      paginatorLabels.itemsPerPageLabel = 'Số tour mỗi trang';
      paginatorLabels.nextPageLabel = 'Trang kế';
      paginatorLabels.previousPageLabel = 'Trang trước';
      paginatorLabels.firstPageLabel = 'Trang đầu';
      paginatorLabels.lastPageLabel = 'Trang cuối';
      paginatorLabels.getRangeLabel= (page: number, pageSize: number, length: number) => {
        if (length === 0 || pageSize === 0) {
          return '0 od ' + length;
        }
        length = Math.max(length, 0);
        const startIndex = page * pageSize;
        // If the start index exceeds the list length, do not try and fix the end index to the end.
        const endIndex = startIndex < length ?
          Math.min(startIndex + pageSize, length) :
          startIndex + pageSize;
        return startIndex + 1 + ' - ' + endIndex + ' của ' + length;
      };
      return paginatorLabels;
    }
  }],
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
