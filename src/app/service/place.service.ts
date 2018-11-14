import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Place } from '../model/place';
import { ThrowStmt } from '@angular/compiler';

@Injectable({
  providedIn: 'root'
})
export class PlaceService {

  SERVER = 'http://localhost:4000';

  constructor(private http: HttpClient) { }

  getPlaces = (page: number = 0, size: number = 10): Observable<Place[]> =>
    this.http.get<Place[]>(`${this.SERVER}/places?page=${page}&_limit=${size}`);

  getPlansWithPlaces = () =>
    this.http.get(`${this.SERVER}/plans_places?_expand=place`);

  addPlacesForPlan = (planPlace: { planId, placeId }) =>
    this.http.post(`${this.SERVER}/plans_places`, planPlace);

  getPlacesForPlan = (planId: number | string) =>
    this.http.get(`${this.SERVER}/plans_places?planId=${planId}&_expand=place`);
}
