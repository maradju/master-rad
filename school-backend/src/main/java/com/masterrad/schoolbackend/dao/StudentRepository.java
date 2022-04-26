package com.masterrad.schoolbackend.dao;

import com.masterrad.schoolbackend.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin("http://localhost:4401")
public interface StudentRepository extends JpaRepository<Student, Long> {

}
