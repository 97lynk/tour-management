import {Component, EventEmitter, OnInit, Output} from '@angular/core';
import {Tour} from '../../../model/tour';
import {VTextEncodePipe} from '../../../pipe/vtext-encode.pipe';

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
  styleUrls: ['./tour-form.component.scss'],
  providers: [VTextEncodePipe]
})
export class TourFormComponent implements OnInit {

  @Output('clickSaveAddTour') clickAddTour = new EventEmitter<Tour>();

  @Output('clickSaveEditTour') clickEditTour = new EventEmitter<Tour>();

  tour: Tour;

  contentHTML: string;

  insertMode;

  CKEditorConfig = CKEditorConfig;

  CKEditorId = '';

  constructor(private vtextedcode: VTextEncodePipe) {
    this.CKEditorId = `editContentTour-${Math.round(Math.random() * 100)}`;
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
  encodingVietNamese = (text: string): string => this.vtextedcode.transform(text);
}
