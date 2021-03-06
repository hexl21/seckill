CREATE DATABASE seckill;

USE seckill;

CREATE TABLE seckill (
  seckill_id  BIGINT       NOT NULL AUTO_INCREMENT
  COMMENT '商品库存ID',
  name        VARCHAR(120) NOT NULL
  COMMENT '商品名称',
  number      INT          NOT NULL
  COMMENT '库存数量',
  start_time  TIMESTAMP    NOT NULL
  COMMENT '秒杀开始时间',
  end_time    TIMESTAMP    NOT NULL
  COMMENT '秒杀结束时间',
  create_time TIMESTAMP    NOT NULL DEFAULT current_timestamp
  COMMENT '创建时间',
  PRIMARY KEY (seckill_id),
  KEY idx_start_time(start_time),
  KEY idx_end_time(end_time),
  KEY idx_create_time(create_time)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = utf8
  COMMENT = '秒杀库存表';

INSERT INTO seckill (name, number, start_time, end_time)
VALUES ('1元秒杀iPhone6s', 10, '2016-7-2', '2016-7-3');
INSERT INTO seckill (name, number, start_time, end_time)
VALUES ('10元秒杀macbook-pro', 10, '2016-7-2', '2016-7-3');
INSERT INTO seckill (name, number, start_time, end_time)
VALUES ('6元秒杀小米5', 10, '2016-7-2', '2016-7-3');
INSERT INTO seckill (name, number, start_time, end_time)
VALUES ('8元秒杀华为P9', 10, '2016-7-2', '2016-7-3');

CREATE TABLE success_killed (
  seckill_id  BIGINT    NOT NULL
  COMMENT '商品库存ID',
  user_phone  BIGINT    NOT NULL
  COMMENT '用户手机号',
  state       TINYINT   NOT NULL DEFAULT -1
  COMMENT '状态表示 -1：无效 0:成功 1: 已付款 2：已发货',
  create_time TIMESTAMP NOT NULL DEFAULT current_timestamp
  COMMENT '创建时间',
  PRIMARY KEY (seckill_id, user_phone),
  KEY idx_create_time(create_time)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COMMENT = '秒杀成功明细表';
