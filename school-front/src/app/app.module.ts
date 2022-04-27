import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { Routes, RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { StudentService } from './services/student.service';
import { StudentListComponent } from './student-list/student-list.component';

const routes: Routes = [
  {path: 'students', component: StudentListComponent},
];
@NgModule({
  declarations: [
    AppComponent,
    StudentListComponent
  ],
  imports: [
    RouterModule.forRoot(routes),
    BrowserModule,
    HttpClientModule
  ],
  providers: [StudentService],
  bootstrap: [AppComponent]
})
export class AppModule { }
