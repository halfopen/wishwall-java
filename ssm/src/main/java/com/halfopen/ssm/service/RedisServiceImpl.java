package com.halfopen.ssm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.ShardedJedis;
import redis.clients.jedis.ShardedJedisPool;

@Component
@Transactional(readOnly = true)
public class RedisServiceImpl implements RedisService {

    @Autowired
    private ShardedJedisPool shardedJedisPool;

    public void setValue(String key, String val) {
        ShardedJedis jedis = null;
        try{
            jedis = shardedJedisPool.getResource();
            jedis.set(key, val);
        } catch (Exception e){
            e.printStackTrace();
        } finally{
            if(jedis != null) {

            }
        }
    }

    public String getValue(String key) {
        ShardedJedis jedis = null;

        jedis = shardedJedisPool.getResource();
        return jedis.get(key);
    }
}
