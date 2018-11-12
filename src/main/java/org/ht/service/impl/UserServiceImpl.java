package org.ht.service.impl;

import org.ht.dao.UserMapper;
import org.ht.pojo.User;
import org.ht.service.UserService;
import org.ht.util.UserIDGenerate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public Integer registerUser(User user) {
        user.setUid(UserIDGenerate.generateID("10"));
        return userMapper.insertSelective(user);
    }

    @Override
    public User findByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public User userLogin(String username, String password) {
        User resultUser = userMapper.selectByUsername(username);
        if (resultUser != null)
            if (resultUser.getPassword().equals(password)) {
                return resultUser;
            } else {
                return null;
            }
        return null;
    }
}
