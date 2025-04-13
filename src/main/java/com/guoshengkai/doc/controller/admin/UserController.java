package com.guoshengkai.doc.controller.admin;

import com.guoshengkai.doc.config.UserConfig;
import com.guoshengkai.doc.core.auth.NoLogin;
import com.guoshengkai.doc.core.exception.ValidationException;
import com.guoshengkai.doc.core.util.MD5;
import com.guoshengkai.doc.entitys.User;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("api/v1/user")
public class UserController {

    @Resource
    private UserConfig userConfig;

    /**
     * 登录
     * @return
     *      token等信息
     */
    @PostMapping("login")
    @NoLogin
    public Map<String, Object> login(@RequestBody User user) {
        if (userConfig.getUsername().equals(user.getUsername()) && userConfig.getPassword().equals(user.getPassword())) {
            Map<String, Object> map = new HashMap<>();
            map.put("username", user.getUsername());
            map.put("nickname", user.getNickname());
            String md5 = MD5.getMd5(user.getUsername() + "." + user.getPassword());
            map.put("token", Base64.getEncoder().encodeToString(
                    (md5 + "." + System.currentTimeMillis()).getBytes(StandardCharsets.UTF_8)
            ));
            return map;
        }
        throw new ValidationException("用户名或密码错误");
    }

}
