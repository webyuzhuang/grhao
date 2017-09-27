package com.fz.service;

import com.fz.model.UserDo;

import java.util.List;

/**
 * Created by zhuang on 2017-09-27.
 */
public interface UserService {

    public List<UserDo> queryall();

    public int querycount(UserDo userdo);

    public int save(UserDo udo);
}
