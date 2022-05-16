package com.naukma.faynirecepty.service;

import com.naukma.faynirecepty.model.entity.Role;
import com.naukma.faynirecepty.model.entity.User;
import com.naukma.faynirecepty.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service("userService")
public class UserService {

    @Autowired
    UserRepository userRepository;

    @Transactional
    public User getUserByUsername(String username){
        return userRepository.findByUsername(username).orElse(null);
    }

    @Transactional
    public User createUser(String username, String hexedPsw){

        return userRepository.save(User.builder()
                .username(username)
                .password(hexedPsw)
                .role(Role.builder().name("user").build())
                .build());
    }

    @Transactional
    public void save(User user){
        userRepository.save(user);
    }

    @Transactional
    public User getUserById(Long id){
        return userRepository.findById(id).orElse(null);
    }

    @Transactional
    public List<User> getAll(){
        return userRepository.findAll();
    }

}
