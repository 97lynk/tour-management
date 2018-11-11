import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs";
import { Tour } from "../model/tour";

@Injectable({
    providedIn: 'root'
})
export class TourService {

    SERVER = 'http://localhost:4000';

    constructor(private http: HttpClient) {
    }

    addNewTour = (tour: Tour): Observable<Tour> =>
        this.http.post<Tour>(`${this.SERVER}/tours`, tour);

    updateTourById = (tourId: number | string, tour: Tour) =>
        this.http.put(`${this.SERVER}/tours/${tourId}`, tour);

    getTourById = (id: number | string): Observable<Tour> =>
        this.http.get<Tour>(`${this.SERVER}/tours/${id}`);


    getTours = (page: number = 0, size: number = 10): Observable<Tour[]> =>
        this.http.get<Tour[]>(`${this.SERVER}/tours?page=${page}&_limit=${size}`);


    getDiscountTour = (isExpandTour: boolean = false): Observable<Tour[]> => {
        let expandTour = '';
        if (isExpandTour) expandTour = '?_expand=tour';
        return this.http.get<Tour[]>(`${this.SERVER}/discounts${expandTour}`);
    }

    loadContentPostOfTour = (url: string): Observable<string> =>
        this.http.get(url, { responseType: 'text' });


}
