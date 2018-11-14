import { Component, OnInit } from '@angular/core';
import { Tour } from 'app/model/tour';
import { TourService } from 'app/service/tour.service';
import { trigger, state, style, transition, animate } from '@angular/animations';
import { MatTableDataSource } from '@angular/material';

@Component({
  selector: 'app-tour-management',
  templateUrl: './tour-management.component.html',
  styleUrls: ['./tour-management.component.scss'],
  providers: [TourService],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0', display: 'none' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),
  ]
})
export class TourManagementComponent implements OnInit {

  tours = new MatTableDataSource<Tour>([]);

  displayedColumns = ['id', 'name'];

  expandedTour: Tour;

  insertTour: Tour = new Tour(0, '', '', '', '', '', '', 3, 2, new Date().getTime(), 'admin');
  constructor(private tourService: TourService) {

  }

  ngOnInit() {
    this.tourService.getTours(0, 100).subscribe((data: Tour[]) => {
      this.tours.data = data;
    });
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

}
