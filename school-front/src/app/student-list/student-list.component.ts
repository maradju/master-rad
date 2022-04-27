import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Student } from 'src/app/common/student';
import { StudentService } from 'src/app/services/student.service';

@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.css']
})
export class StudentListComponent implements OnInit {

  students:  Student[] = [];
  
  constructor(private studentService: StudentService,
    private route: ActivatedRoute) { }

  ngOnInit() {
    this.route.paramMap.subscribe(() => {
      this.listStudents();
    });
  }

  listStudents() {
    // now get the products for the given category id
    this.studentService.getStudentList().subscribe(
      data => {
        this.students = data;
      }
    )
  }
}
