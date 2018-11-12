package org.ht.service;

import org.ht.pojo.User;

public interface UserService {
    Integer registerUser(User user);

    User findByUsername(String username);

    User userLogin(String username, String password);
}
