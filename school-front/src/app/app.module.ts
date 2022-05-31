import { HttpClientModule } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { Routes, RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { StudentService } from './services/student.service';
import { StudentListComponent } from './components/student-list/student-list.component';
import { SearchComponent } from './components/search/search.component';
import { StudentDetailsComponent } from './components/student-details/student-details.component';
import { StudentAddComponent } from './components/student-add/student-add.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
const routes: Routes = [ 
  {path: 'students/add', component: StudentAddComponent},
  {path: 'students/:id', component: StudentDetailsComponent},
  {path: 'search/:keyword', component: StudentListComponent},
  {path: 'students', component: StudentListComponent},
  {path: ' ', redirectTo: '/students'},
  {path: '**',  redirectTo: '/students'}

];
@NgModule({
  declarations: [
    AppComponent,
    StudentListComponent,
    SearchComponent,
    StudentDetailsComponent,
    StudentAddComponent
  ],
  imports: [
    RouterModule.forRoot(routes),
    BrowserModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule
  ],
  providers: [StudentService],
  bootstrap: [AppComponent]
})
export class AppModule { }
