package com.guoshengkai.doc.config;

import com.guoshengkai.doc.core.SpringBootApplicationUtil;
import com.guoshengkai.doc.core.auth.NoLogin;
import com.guoshengkai.doc.core.exception.AccessOAuthException;
import com.guoshengkai.doc.core.util.MD5;
import com.guoshengkai.doc.core.util.ThreadUtil;
import com.guoshengkai.doc.entitys.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.util.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import java.nio.charset.StandardCharsets;
import java.util.*;

/**
 * Copyright (c) 2021 HEBEI CLOUD IOT FACTORY BIGDATA CO.,LTD.
 * Legal liability shall be investigated for unauthorized use
 *
 * @Author: Guo Shengkai
 * @Date: Create in 2021/04/08 9:46
 */
public class RequestThreadFilterConf implements HandlerInterceptor {


    protected Logger logger = LoggerFactory.getLogger(RequestThreadFilterConf.class);

    Map<String, List<Date>> requestMap = new HashMap<>();

    UserConfig userConfig = SpringBootApplicationUtil.getBean(UserConfig.class);
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        String reqHeader = request.getHeader("Access-Control-Request-Headers");
        response.setStatus(HttpStatus.OK.value());
        if (reqHeader != null){
            response.setHeader("Access-Control-Allow-Headers", reqHeader);
        }
        if ("OPTIONS".equalsIgnoreCase(request.getMethod())){
            response.setStatus(204);
            return false;
        }

        String token = getRequestToken(request);
        User user = null;
        // 解析token
        if (!StringUtils.isEmpty(token)){
            try {
                String[] md5 = new String(Base64.getDecoder().decode(token), StandardCharsets.UTF_8).split("\\.");
                if (md5[0].equals(MD5.getMd5(userConfig.getUsername() + "." + userConfig.getPassword()))){
                    if (System.currentTimeMillis() - Long.parseLong(md5[1]) < 60 * 60 * 1000 * 24 * 7){
                        user = new User();
                        user.setUsername(userConfig.getUsername());
                        user.setPassword(userConfig.getPassword());
                        user.setNickname(userConfig.getNickname());
                        ThreadUtil.setToken(token);
                        ThreadUtil.setUserEntity(user);
                    }
                }

            }catch (Exception ignored){}
            if (user != null){
                ThreadUtil.setUserId(1);
            }
        }
        if (handler instanceof HandlerMethod method) {
            NoLogin methodAnnotation = method.getMethodAnnotation(NoLogin.class);
            if (null == methodAnnotation){
                if (null == token){
                    throw new AccessOAuthException("请先登录");
                }
                if (null == user){
                    throw new AccessOAuthException("登录信息已过期，请重新登录");
                }
            }
        }

        // 初始化上下文
        return true;
    }


    /**
     * 获取请求信息中的Token
     * @param request
     *      请求信息
     * @return
     */
    private String getRequestToken(HttpServletRequest request){
        String token = request.getHeader("token");

        if (StringUtils.isEmpty(token)){
            token = request.getHeader("access_token");
        }
        if (StringUtils.isEmpty(token)){
            token = request.getHeader("access-token");
        }
        if (StringUtils.isEmpty(token)){
            token = request.getHeader("authorization");
        }

        if (StringUtils.isEmpty(token)){
            token = request.getParameter("token");
        }
        if (StringUtils.isEmpty(token)){
            token = request.getParameter("access_token");
        }
        if (StringUtils.isEmpty(token)){
            token = request.getParameter("access-token");
        }

        if (!StringUtils.isEmpty(token) && token.startsWith("Bearer")){
            token = token.substring(7);
        }
        return token;
    }
}
