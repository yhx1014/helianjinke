package org.ht.util;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    private int code;
    private String message;
    private Map<String, Object> map = new HashMap<>();

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public static Msg success() {
        Msg result = new Msg();
        result.setCode(100);
        result.setMessage("信息处理成功");
        return result;
    }

    public Msg add(String key, Object value) {
        this.map.put(key, value);
        return this;
    }
}
