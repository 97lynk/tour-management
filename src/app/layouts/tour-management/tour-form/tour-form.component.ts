import {Component, EventEmitter, OnInit, Output} from '@angular/core';
import {Tour} from '../../../model/tour';

const CKEditorConfig = {
  extraPlugins: 'divarea',
  htmlEncodeOutput: false,
  entities: false,
  height: '100%',
  width: '100%'
};

@Component({
  selector: 'tour-form',
  templateUrl: './tour-form.component.html',
  styleUrls: ['./tour-form.component.scss']
})
export class TourFormComponent implements OnInit {

  @Output('clickSaveAddTour') clickAddTour = new EventEmitter<Tour>();

  @Output('clickSaveEditTour') clickEditTour = new EventEmitter<Tour>();

  tour: Tour;

  contentHTML: string;

  insertMode;

  CKEditorConfig = CKEditorConfig;

  CKEditorId = '';

  constructor() {
    this.CKEditorId = `editContentTour-${Math.round(Math.random()*100)}`;
    this.refreshPage();
  }

  ngOnInit() {
  }

  refreshPage = () => {
    this.insertMode = true;
    this.contentHTML = '';
    this.tour = {
      id: -1,
      name: '',
      url: '',
      title: '',
      imageUrl: '',
      fileContentUrl: '',
      description: '',
      numberOfDate: 2,
      numberOfNight: 1,
      createAt: 'Admin',
      createBy: (new Date()).toLocaleString(),
      content: null,
      links: null,
      page: null
    };
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
    str = str.trim();
    str = str.replace(/ + /g, '-');
    str = str.replace(/\s+/g, '-')
    str = str.toLowerCase();
    return str;
  }
}
