import { Injectable } from '@angular/core';
import { Student } from '../common/student';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class StudentService {

  private baseUrl = 'http://localhost:8088/api/students';

  constructor(private httpClient: HttpClient) { }

  getStudentList(): Observable<Student[]> {

    return this.httpClient.get<GetResponse>(this.baseUrl).pipe(
      map(response => response._embedded.students)
    );

  }

  searchStudents(theKeyword: string): Observable<Student[]> {
    console.log(`searchStudents service`);

    // need to build URL based on category id 
    const searchUrl = `${this.baseUrl}/search/findByNameContaining?name=${theKeyword}`;

    return this.httpClient.get<GetResponse>(searchUrl).pipe(
      map(response => response._embedded.students)
    );
    
  }
}

  interface GetResponse {
   _embedded: {
     students: Student[];
    }
  }


