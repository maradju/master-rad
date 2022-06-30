package com.masterrad.schoolbackend.dao;

import com.masterrad.schoolbackend.entity.Enrollment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin(origins = "http://localhost:4401")
public interface EnrollmentRepository extends JpaRepository<Enrollment, Long> {

}
