CREATE TABLE `customer` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `openID` varchar(100) NOT NUll UNIQUE,
  `nickname` varchar(100) NOT NULL,
  `avatarUrl` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `lostinf` (

  `lost_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
	`time` DATETIME NOT NULL ,
	`location` varchar(100) NOT NULL,
	`category` varchar(50) NOT NULL,	
	`describe` varchar(300) ,
	`picture` varchar(100),
	`user_id` int(11),	
    PRIMARY KEY (`lost_id`) ,
    FOREIGN KEY (`user_id`) REFERENCES `customer` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comment` (
	`comment_id` int(11) NOT NULL AUTO_INCREMENT,
    `date` datetime NOT NULL,
    `lost_id` int(11) NOT NULL,
	`contents` varchar(300) NOT NULL,
	`user_id` int(11) NOT null,
    PRIMARY KEY (`comment_id`),
	FOREIGN KEY (`user_id`) REFERENCES `customer` (`user_id`),
	FOREIGN KEY (`lost_id`) REFERENCES `lostinf` (`lost_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
//drop table lostinf;
alter table customer modify column openID varchar(100) NOT NUll UNIQUE;
INSERT INTO customer(openID,nickname,avatarUrl,city) VALUES ('oB4nYjnoHhuWrPVi2pYLuPjnCaU0', '小马', 'H:\1-image\customer1.jpg', '合肥');
INSERT INTO customer(openID,nickname,avatarUrl,city) VALUES ('xB4nYjnoHhuWrPVi2pYLuPjnCaU0', '小杨', 'H:\1-image\customer2.jpg', '马鞍山');
INSERT INTO customer(openID,nickname,avatarUrl,city) VALUES ('hB4nYjnoHhuWrPVi2pYLuPjnCaU0', '小刘', 'H:\\1-image\customer2.jpg', '马鞍山');

update customer set avatarUrl='/images/customer1.jpg' where user_id=1;
update customer set avatarUrl='/images/customer2.jpg' where user_id=2;
update customer set avatarUrl='/images/customer4.jpg' where user_id=3;
select * from customer;
INSERT INTO lostinf(type,time,location,category,`describe`,picture,user_id) VALUES ('失物', '2020-10-8', '六食堂', '卡','我在六食堂二楼丢了一张银行卡，正面如下图','/images/picture1.jpg','1');
INSERT INTO lostinf(type,time,location,category,`describe`,picture,user_id) VALUES ('拾物', '2020-10-21', '八食堂', '钥匙','今天我在八食堂捡到一串钥匙，如图所示','/images/2picture1.jpg','2');
update lostinf set picture='/images/picture1.jpg' where user_id='1';
update lostinf set picture='/images/2picture1.jpg' where user_id='2';
select * from lostinf;
select * from comment;

INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-1', '1', '顶上去', '1');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-1', '1', '支持', '1');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-1', '1', '顶上去', '1');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-1', '1', '顶上去', '1');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-1', '1', '顶上去', '1');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-1', '3', '顶上去', '1');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-1', '3', '支持', '1');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-1', '3', '顶上去', '1');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-1', '3', '顶上去', '1');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-1', '3', '顶上去', '1');
select * from comment;
select customer.nickname,customer.avatarUrl,lostinf.type,lostinf.time,lostinf.location,lostinf.category,lostinf.`describe`,count(lostinf.lost_id) as commentsize, lostinf.picture from customer,lostinf,comment where customer.user_id=lostinf.user_id and comment.lost_id=lostinf.lost_id group by lostinf.lost_id;
/*------------------------*/
INSERT INTO customer(openID,nickname,avatarUrl,city) VALUES ('yG4nYjnoHhuWrjmi2pYLuPjnptl3', '月光下的摩天轮', '/images/customer3.jpg', '合肥');
INSERT INTO lostinf(type,time,location,category,`describe`,picture,user_id) VALUES ('失物', '2020-11-8', '六食堂', '卡','我在六食堂二楼丢了一张学生卡，希望捡到的同学联系我，电话18855525326，卡的正面如下图','/images/picture2.jpg','4');
INSERT INTO lostinf(type,time,location,category,`describe`,picture,user_id) VALUES ('拾物', '2020-11-21', '九食堂', '钥匙','今天我在九食堂二楼捡到一把钥匙，丢失的同学可以打电话联系我，电话号码1885552536，钥匙如下图所示','/images/2picture2.jpg','4');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-9', '4', '顶上去', '1');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-10', '4', '支持', '2');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-10', '4', '顶上去', '2');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-11', '4', '顶上去', '3');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-21', '5', '顶上去', '4');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-22', '5', '顶上去', '2');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-23', '5', '支持', '2');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-23', '5', '顶上去', '3');
INSERT INTO comment(date,lost_id,contents,user_id) VALUES ('2020-11-24', '5', '顶上去', '1');
select customer.nickname,customer.avatarUrl,lostinf.type,lostinf.time,lostinf.location,lostinf.category,lostinf.`describe`,count(lostinf.lost_id)as commentsize, lostinf.picture from customer,lostinf,comment where customer.user_id=lostinf.user_id and comment.lost_id=lostinf.lost_id and customer.openID='yG4nYjnoHhuWrjmi2pYLuPjnptl3'group by lostinf.lost_id;
select customer.avatarUrl,customer.nickname,`comment`.date,`comment`.contents from customer,`comment`,lostinf where lostinf.lost_id=1 and `comment`.lost_id=lostinf.lost_id and `comment`.user_id=customer.user_id;
update lostinf set `describe`='我在六食堂二楼丢了一张银行卡，正面如下图' where user_id=1;
select * from lostinf;
INSERT INTO lostinf(type,time,location,category,`describe`,picture,user_id) VALUES ('失物', '2020-10-8', '六食堂', '卡','我在六食堂二楼丢了一张银行卡，正面如下图','/images/picture1.jpg','1');
delete from lostinf where lost_id=8;
update lostinf set `describe`='我在六食堂' where lost_id=9;
select customer.nickname,customer.avatarUrl,lostinf.type,lostinf.time,lostinf.location,lostinf.category,lostinf.`describe`,count(lostinf.lost_id) as commentsize, lostinf.picture from customer,lostinf,comment where (customer.user_id=lostinf.user_id and comment.lost_id=lostinf.lost_id) or isnull(lostinf.lost_id=(select lostinf.lost_id from lostinf,comment where comment.lost_id=lostinf.lost_id) )group by lostinf.lost_id;
/////////////////
select customer.nickname,customer.avatarUrl,lostinf.type,lostinf.time,lostinf.location,lostinf.category,lostinf.`describe`,count(lostinf.lost_id) as commentsize, lostinf.picture from customer,lostinf,comment where customer.user_id=lostinf.user_id and comment.lost_id=lostinf.lost_id group by lostinf.lost_id;