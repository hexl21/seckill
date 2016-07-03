package org.seckill.exception;

/**
 * Created by Jiwei.Wang on 2016/7/3.
 */
public class SeckillException extends RuntimeException {
    public SeckillException(String message, Throwable cause) {
        super(message, cause);
    }

    public SeckillException(String message) {

        super(message);
    }
}
