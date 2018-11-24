import {Component, OnInit, ViewChild} from '@angular/core';
import {Tour} from 'app/model/tour';
import {TourService} from 'app/service/tour.service';
import {TourListComponent} from './tour-list/tour-list.component';

@Component({
  selector: 'app-tour-management',
  templateUrl: './tour-management.component.html',
  styleUrls: ['./tour-management.component.scss'],
  providers: [TourService],

})
export class TourManagementComponent implements OnInit {

  @ViewChild('tableTours') tableTours: TourListComponent;

  insertTour: Tour;

  constructor(private tourService: TourService) {
    this.insertTour = {
      id: -1,
      name: '',
      url: '',
      title: '',
      imageUrl: '',
      fileContentUrl: '',
      description: '',
      numberOfDate: 1,
      numberOfNight: 2,
      createAt: 'Admin',
      createBy: (new Date()).toLocaleString(),
      content: null,
      links: null
    };
  }

  ngOnInit() {
  }

  submitNewTour = () => {
    this.tourService.addNewTour(this.insertTour)
      .subscribe((tour: Tour) => {
        console.log(`Add new tour success Tour#${tour.id} - ${tour.links[0].href}`);
        this.tableTours.loadTours();
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
