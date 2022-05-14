package com.naukma.faynirecepty.repository;

import com.naukma.faynirecepty.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findById(Long id);

    Optional<User> findUserByUsername(String username);

}
