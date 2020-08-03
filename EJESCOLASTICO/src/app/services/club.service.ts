import { Injectable } from '@angular/core';
import {  HttpClient , HttpHeaders} from '@angular/common/http';
import {Observable } from 'rxjs';
import { retry } from 'rxjs/operators';
import { Club } from '../models/club';

@Injectable({
  providedIn: 'root'
})
export class ClubService {
  url:string="https://localhost:44398/api/Clubs";

  httpOptions={
    headers:new HttpHeaders({
      'Content-type':'application/json',
     'Accept':'application/json'
    })
  };
  constructor(private http:HttpClient) { }
  save(a:Club) : Observable<any> {
    let ClubBody = JSON.stringify(a);
    if(a.id === undefined){
      return this.http.post<any>(this.url, ClubBody, this.httpOptions);
    }
    return this.http.put<any>(this.url, ClubBody, this.httpOptions);
  }

  retrieve(id:number): Observable<Club> {
    return this.http.get<Club>(this.url + "/" + id, this.httpOptions)
      .pipe(
        retry(1)
      );
  }

  delete(a: Club) : Observable<any> {
    return this.http.delete<any>(this.url + '/' + a.id,
      this.httpOptions);
  }

  list(): Observable<Club[]> {
    return this.http.get<Club[]>(this.url, this.httpOptions)
      .pipe(
        retry(1)
      );
  }

  search(criterio:string): Observable<Club[]> {
    return this.http.get<Club[]>(this.url.concat("?criteria=").concat(criterio), this.httpOptions)
      .pipe(
        retry(1)
      );
  }
}
