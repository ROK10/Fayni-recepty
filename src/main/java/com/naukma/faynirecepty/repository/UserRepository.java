package com.naukma.faynirecepty.repository;

import com.naukma.faynirecepty.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository("usertRepository")
public interface UserRepository extends JpaRepository<User, Long> {

    List<User> findAll();

    Optional<User> findById(Long id);

    Optional<User> findByUsername(String username);

}
