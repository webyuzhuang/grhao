package com.fz.service.Impl;

import com.fz.mapper.UserDoMapper;
import com.fz.model.UserDo;
import com.fz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhuang on 2017-09-27.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDoMapper usice;

    @Override
    public List<UserDo> queryall() {
        return usice.selectAll();
    }

    @Override
    public int querycount(UserDo userdo) {
        return usice.selectCount(userdo);
    }

    @Override
    public int save(UserDo udo) {
        return usice.insert(udo);
    }
}
