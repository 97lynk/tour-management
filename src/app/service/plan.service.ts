import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Plan } from '../model/plan';

@Injectable({
  providedIn: 'root'
})
export class PlanService {

  SERVER = 'http://localhost:4000';

  constructor(private http: HttpClient) { }

  getPlansByTourId = (tourId: number): Observable<Plan[]> =>
    this.http.get<Plan[]>(`${this.SERVER}/plans?tourId=${tourId}`);

  addNewPlan = (plan: Plan): Observable<Plan> =>
    this.http.post<Plan>(`${this.SERVER}/plans`, plan);

  updatePlan = (plan: Plan): Observable<Plan> =>
    this.http.put<Plan>(`${this.SERVER}/plans/${plan.id}`, plan);

  deletePlan = (planId: number | string) =>
    this.http.delete<Plan>(`${this.SERVER}/plans/${planId}`);
}
