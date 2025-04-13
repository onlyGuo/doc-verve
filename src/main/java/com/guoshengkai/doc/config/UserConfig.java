package com.guoshengkai.doc.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 管理员信息配置
 */
@Getter
@Setter
@Component
@ConfigurationProperties(prefix = "user")
public class UserConfig {

    /**
     * 管理员昵称
     */
    private String nickname;

    /**
     * 管理员用户名
     */
    private String username;

    /**
     * 管理员密码
     */
    private String password;
}
