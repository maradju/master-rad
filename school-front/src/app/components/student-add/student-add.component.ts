import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Student } from 'src/app/common/student';
import { StudentService } from 'src/app/services/student.service';

@Component({
  selector: 'student-add',
  templateUrl: './student-add.component.html',
  styleUrls: ['./student-add.component.css']
})
export class StudentAddComponent implements OnInit {

  student: Student = new Student;
  checkoutFormGroup!: FormGroup ;

  constructor(private formBuilder: FormBuilder,
              private router: Router,
              private studentService: StudentService) { }

  ngOnInit(): void {
    this.checkoutFormGroup = this.formBuilder.group({
      name: new FormControl('', 
                            [Validators.required, 
                             Validators.minLength(2)]),
      email: new FormControl('', 
                            [Validators.required, 
                            Validators.minLength(2)]),
      jmbg: new FormControl('', 
                            [Validators.required, 
                            Validators.minLength(2)])
    });
  }

  onSubmit() {
    console.log("Handling the submit button");
    this.student.name = this.checkoutFormGroup.controls['name'].value;
    this.student.email = this.checkoutFormGroup.controls['email'].value;
    this.student.jmbg = this.checkoutFormGroup.controls['jmbg'].value;

    this.studentService.save(this.student).subscribe({

    })
  }

  
  // get name() { return this.checkoutFormGroup.get('customer.firstName'); }
  // get email() { return this.checkoutFormGroup.get('customer.lastName'); }
  // get jmbg() { return this.checkoutFormGroup.get('customer.email'); }

}
