package com.halfopen.ssm.service;

public interface RedisService {
    void setValue(String key, String val);
    String getValue(String key);
}
