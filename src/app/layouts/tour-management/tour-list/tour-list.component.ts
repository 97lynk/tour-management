import {Component, OnInit} from '@angular/core';
import {Tour} from '../../../model/tour';
import {MatTableDataSource} from '@angular/material';
import {TourService} from '../../../service/tour.service';
import {trigger, state, style, transition, animate} from '@angular/animations';
import {MatTableDataSource} from '@angular/material';

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

  tours = new MatTableDataSource<Tour>([]);

  displayedColumns = ['id', 'name'];

  expandedTour: Tour;

  constructor(private tourService: TourService) {
  }

  ngOnInit() {
    this.loadTours();
  }

  loadTours = () => {
    console.log(`load tours`);
    this.tourService.getTours(0, 100).subscribe((tours: Tour) => {
      this.tours.data = tours.content;
      console.log(`load tours success ${tours.content.length}`);
    });
  }
}
