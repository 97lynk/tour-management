import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Tour} from '../model/tour';

@Injectable({
  providedIn: 'root'
})
export class TourService {

  SERVER = '/api/v1';

  constructor(private http: HttpClient) {
  }

  getTours = (page: number = 0, size: number = 10): Observable<Tour> =>
    this.http.get<Tour>(`${this.SERVER}/tours?page=${page}&size=${size}`);

  addNewTour = (tour: Tour): Observable<Tour> =>
    this.http.post<Tour>(`${this.SERVER}/tours`, tour);

  updateTourById = (tourId: number | string, tour: Tour) =>
    this.http.put(`${this.SERVER}/tours/${tourId}`, tour);

  deleteTourById = (tourId: number | string) =>
    this.http.delete(`${this.SERVER}/tours/${tourId}`);


  getToursAndPlans = (page: number = 0, size: number = 10): Observable<any[]> =>
    this.http.get<any[]>(`${this.SERVER}/tours?_embed=plans&page=${page}&_limit=${size}`);


  loadContentPostOfTour = (url: string): Observable<string> =>
    this.http.get(`/data/contents/${url}`, {responseType: 'text'});

  uploadContentPostOfTour = (file: File): Observable<any> => {
    const formData = new FormData();
    formData.append('data', file, );
    return this.http.post<any>(`${this.SERVER}/tours/file`, formData);
  }

}
