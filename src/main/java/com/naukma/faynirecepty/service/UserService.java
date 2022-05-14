package com.naukma.faynirecepty.service;

import com.naukma.faynirecepty.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service("userService")
@AllArgsConstructor
public class UserService {

    private UserRepository userRepository;

}
