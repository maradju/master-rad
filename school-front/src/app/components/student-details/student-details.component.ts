import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Student } from 'src/app/common/student';
import { StudentService } from 'src/app/services/student.service';
import { FormGroup, FormBuilder, FormControl, Validators } from '@angular/forms';


@Component({
  selector: 'app-student-details',
  templateUrl: './student-details.component.html',
  styleUrls: ['./student-details.component.css']
})
export class StudentDetailsComponent implements OnInit {

  student: Student = new Student;
  status: String = new String;
  isViewMode: boolean = true;
  theStudentId!: number;

  checkoutFormGroup: FormGroup = this.formBuilder.group({
    name: new FormControl('', 
                          [Validators.required, 
                           Validators.minLength(2)]),
    email: new FormControl('', 
                          [Validators.required, 
                          Validators.minLength(2)]),
    jmbg: new FormControl('', 
                          [Validators.required, 
                          Validators.minLength(2)])
  });;

  constructor(private formBuilder: FormBuilder,
              private route: ActivatedRoute,
              private studentService: StudentService) { }

  ngOnInit(): void {
    // get the "id" param string. convert string to a number using the "+" symbol
    this.theStudentId = +this.route.snapshot.paramMap.get('id')!;

    this.route.paramMap.subscribe(() => {
      this.handleStudentDetails();
    })


  }

  handleStudentDetails() {
    this.studentService.getStudent(this.theStudentId).subscribe(
      data => {
        this.student = data;
      }
    )
  }

  onDelete(){
    this.studentService.deleteStudent(this.theStudentId).subscribe(
     () => this.status = 'Delete successful'  
    )
  }

  changeToAddMode(){
     this.isViewMode = false;
     this.checkoutFormGroup.controls['name'].setValue(this.student.name);
     this.checkoutFormGroup.controls['email'].setValue(this.student.email);
     this.checkoutFormGroup.controls['jmbg'].setValue(this.student.jmbg);
  }

  saveAndChangeToViewMode(){

    this.student.name = this.checkoutFormGroup.controls['name'].value;
    this.student.email = this.checkoutFormGroup.controls['email'].value;
    this.student.jmbg = this.checkoutFormGroup.controls['jmbg'].value;

    this.studentService.updateStudent(this.theStudentId, this.student).subscribe(data => {
      console.log(data);
      this.student = new Student();
    }, error => console.log(error));

    this.isViewMode = true;
    this.handleStudentDetails();
  }

  get name() { return this.checkoutFormGroup.get('student.firstName'); }
  get email() { return this.checkoutFormGroup.get('student.lastName'); }
  get jmbg() { return this.checkoutFormGroup.get('student.email'); }
}
