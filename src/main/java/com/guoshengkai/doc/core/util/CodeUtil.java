package com.guoshengkai.doc.core.util;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: 郭胜凯
 * @Date: 2020/10/28 11:40
 * @Email 719348277@qq.com
 * @Description: 号码相关工具类
 */
public class CodeUtil {

    /**
     * 取一定范围内的随机数
     * @param min
     *      最小数
     * @param max
     *      最大数
     * @return
     */
    public static int rand(int min, int max){
        return (int) (Math.random()*(max-min)+min);
    }

    private static final Map<String, String> FMT_MAP = new HashMap<>();
    private static final Map<String, String> DE_FMT_MAP = new HashMap<>();

    static {
        String tempStr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!@#$%^&*()_+`-=[]{}|;':,.<>?/";
        String[] tempArr = tempStr.split("");
        for (int i = 0; i < tempArr.length; i++) {
            FMT_MAP.put(tempArr[i], tempArr[tempArr.length - i - 1]);
            DE_FMT_MAP.put(tempArr[tempArr.length - i - 1], tempArr[i]);
        }
    }

    public static String fmtMyCode(String text){
        StringBuilder sb = new StringBuilder();
        String[] tempArr = text.split("");
        for (String s : tempArr) {
            sb.append(FMT_MAP.getOrDefault(s, s));
        }
        return sb.toString();
    }

    public static String deFmtMyCode(String text){
        StringBuilder sb = new StringBuilder();
        String[] tempArr = text.split("");
        for (String s : tempArr) {
            sb.append(DE_FMT_MAP.getOrDefault(s, s));
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(fmtMyCode("/api/v1/gpt/message"));
        System.out.println(fmtMyCode("Request-Token"));
        System.out.println(fmtMyCode("?sign="));
    }
}
