import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {Place} from '../model/place';

@Injectable({
  providedIn: 'root'
})
export class PlaceService {

  SERVER = '/api/v1/places';

  constructor(private http: HttpClient) { }

  getPlaces = (): Observable<Place> =>
    this.http.get<Place>(this.SERVER);

  getPlacesByPlanId = (planId: number|string): Observable<Place> =>
    this.http.get<Place>(`/api/v1/plans/${planId}/places`);

  getPlansWithPlaces = () =>
    this.http.get(`${this.SERVER}/plans_places?_expand=place`);

  addPlacesForPlan = (planPlace: { planId, placeId }) =>
    this.http.post(`${this.SERVER}/plans_places`, planPlace);

  getPlacesForPlan = (planId: number | string) =>
    this.http.get(`${this.SERVER}/plans_places?planId=${planId}&_expand=place`);
}
