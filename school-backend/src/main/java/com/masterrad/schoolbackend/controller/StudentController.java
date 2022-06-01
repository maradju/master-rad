package com.masterrad.schoolbackend.controller;

import com.masterrad.schoolbackend.dao.StudentRepository;
import com.masterrad.schoolbackend.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@CrossOrigin(origins = "http://localhost:4401")
@RestController
@RequestMapping("/")
public class StudentController {

    @Autowired
    private StudentRepository studentRepository;

    @PostMapping("/students")
    public Student createStudent(@Valid @RequestBody Student student) {
        return studentRepository.save(student);
    }

    @GetMapping("/students")
    public List<Student> returnStudents(@Valid @RequestBody Student student) {
        return studentRepository.findAll();
    }

    @DeleteMapping("/students/{studentId}")
    public void deleteStudent(@PathVariable("studentId") Long studentId) {
        studentRepository.deleteById(studentId);
    }

    @PutMapping("/students/{studentId}")
    public ResponseEntity<Student> updateStudent(@PathVariable(value = "studentId") Long studentId, @Valid @RequestBody Student studentDetails) throws ResourceNotFoundException {

        Student student = studentRepository.findById(studentId)
                .orElseThrow(() -> new ResourceNotFoundException( "Student not found for this id:" + studentId));

        student.setName(studentDetails.getName());
        student.setEmail(studentDetails.getEmail());
        student.setJmbg(studentDetails.getJmbg());

        final Student updatedStudent = studentRepository.save(student);
        return ResponseEntity.ok(updatedStudent);
    }
}
