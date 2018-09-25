CREATE DATABASE /*!32312 IF NOT EXISTS*/`credit`;
USE `credit`;

/*Table structure for table `users` */
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `unickname` varchar(50) DEFAULT NULL COMMENT '用户名',
  `uname` varchar(10) DEFAULT NULL COMMENT '用户真实姓名',
  `umailbox` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `uphonenumber` varchar(12) DEFAULT NULL COMMENT '手机号',
  `uregisterdate` datetime DEFAULT NULL COMMENT '注册时间',
  `uflip` varchar(20) DEFAULT NULL COMMENT '最后登录ip',
  `ufldate` datetime DEFAULT NULL COMMENT '最后登录时间',
  `upassword` varchar(255) DEFAULT NULL COMMENT '密码',
  `ucardid` varchar(255) DEFAULT NULL COMMENT '身份证',
  `uhead` varchar(255) DEFAULT '' COMMENT '头像',
  `upwd_zd` varchar(255) DEFAULT NULL COMMENT '支付密码',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge` (
  `rID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID编号',
  `uID` int(11) NOT NULL COMMENT '用户id',
  `uname` varchar(32) DEFAULT NULL COMMENT '用户名',
  `czlx` varchar(32) DEFAULT NULL COMMENT '充值类型',       //ctype
  `lsh` varchar(32) DEFAULT NULL COMMENT '流水号',          
  `czmoney` varchar(32) DEFAULT NULL COMMENT '充值金额',    //金额
  `fl` varchar(32) DEFAULT NULL COMMENT '费率',             //手续费           
  `dzmoney` varchar(32) DEFAULT NULL COMMENT '到账金额',    //到账金额
  `cztime` datetime DEFAULT NULL COMMENT '充值时间',        //充值时间
  `statu` varchar(32) DEFAULT NULL COMMENT '状态',         //
  `zname` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  PRIMARY KEY (`rID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='充值记录表';

/*Data for the table `recharge` */

insert  into `recharge`(`rID`,`uID`,`uname`,`czlx`,`lsh`,`czmoney`,`fl`,`dzmoney`,`cztime`,`statu`,`zname`) values 
	(1,1,'michael','BTC','ab123456','500','0.0','500','2017-02-21 19:17:10','succ','michael'),
	(2,1,'michael','ETH','ab123457','600','0.0','600','2017-02-23 19:18:05','fail','michael');


/*Table structure for table `biao` */

DROP TABLE IF EXISTS `biao`;

CREATE TABLE `biao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bname` varchar(255) DEFAULT NULL COMMENT '标的名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `biao` */
insert  into `biao`(`id`,`bname`) values (6,'BTC'),(7,'ETH'),(8,'USDT');


/*Table structure for table `borrowmoney` */

DROP TABLE IF EXISTS `borrowmoney`;
CREATE TABLE `borrowmoney` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bserial` varchar(255) DEFAULT NULL COMMENT '//(还款方式:1,一次性还清,2,先本后息3,等额本息)',
  `busername` varchar(255) DEFAULT NULL COMMENT '用户id',
  `brelname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `bpass` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `btype` varchar(255) DEFAULT NULL COMMENT '标ID(发布标ID)',
  `btitle` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `bmoney` varchar(255) DEFAULT NULL COMMENT '借款金额 ',
  `brate` varchar(255) DEFAULT NULL COMMENT '利率',
  `btimelimit` varchar(255) DEFAULT NULL COMMENT '期限',
  `blimit` varchar(255) DEFAULT NULL COMMENT '筹标期限',
  `bstate` varchar(255) DEFAULT NULL COMMENT '状态(0:提交申请未处理;1,后台审核通过(未还款);2审核失败;3.已还款)',
  `brecommend` varchar(255) DEFAULT NULL COMMENT '所在区域',
  `bleixing` varchar(255) DEFAULT NULL COMMENT '类型(0车贷,1房贷)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `borrowmoney` */

insert  into `borrowmoney`(`id`,`bserial`,`busername`,`brelname`,`bpass`,`btype`,`btitle`,`bmoney`,`brate`,`btimelimit`,`blimit`,`bstate`,`brecommend`,`bleixing`,`beizhu1`,`beizhu2`) values 
	(1,'4','423','423','432','2','4',NULL,'4','4','4','2','4','0',NULL,NULL),
	(17,'2','1','周旗1','1312321','1','宏图','12312',NULL,NULL,NULL,'1','赣州','0','12312','12312'),
	(24,NULL,NULL,'周旗7','1322312',NULL,'南昌HT','10000',NULL,NULL,NULL,'1',NULL,'1','222','11');


/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pmoney` bigint(20) DEFAULT NULL COMMENT '已募集总金额',
  `pincome` varchar(255) DEFAULT NULL COMMENT '预期年化收益',
  `ptime` datetime DEFAULT NULL COMMENT '项目期限',
  `ptype` int(255) DEFAULT NULL COMMENT '类型',
  `pway` varchar(255) DEFAULT NULL COMMENT '还款方式 到期还本付息 按月付息,到期还本 等额本息',
  `pcount` datetime DEFAULT NULL COMMENT '还款截止期限',
  `progress` varchar(255) DEFAULT NULL COMMENT '投资进度',
  `psaveway` varchar(255) DEFAULT NULL COMMENT '保障方式',
  `prateben` varchar(255) DEFAULT NULL COMMENT '需还本息',

  `ppublishtime` datetime DEFAULT NULL COMMENT '发布时间',
  `pname` varchar(255) DEFAULT NULL COMMENT '产品名称',
  `ptotalmoney` bigint(255) DEFAULT NULL COMMENT '募集资金',
  `prange` varchar(255) DEFAULT NULL COMMENT '投资范围',
  `puse` varchar(255) DEFAULT NULL COMMENT '资金用途',
  `pstate` varchar(255) DEFAULT NULL COMMENT '状态 1筹资中 2筹资完 3失效,4项目完成',
  `picture` varchar(255) DEFAULT NULL COMMENT '封面',
  `pproduce` int(255) DEFAULT NULL COMMENT '标主id',
  `pdesc` varchar(255) DEFAULT NULL COMMENT '项目描述',
  `psafe` varchar(255) DEFAULT NULL COMMENT '保障措施',
  `did` int(11) DEFAULT '1' COMMENT 'details表的主键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) COMMENT '主键',
  KEY `pid` (`did`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`did`) REFERENCES `details` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`pmoney`,`pincome`,`ptime`,`ptype`,`pway`,`pcount`,`progress`,`psaveway`,`prateben`,`ppublishtime`,`pname`,`ptotalmoney`,`prange`,`puse`,`pstate`,`picture`,`pproduce`,`pdesc`,`psafe`,`did`) values 
	(1,30000,'70','2017-03-13 00:00:00',6,'按月付息,到期还本','2017-03-13 00:00:00','75.00','100%本息垫付','2000','2017-02-28 13:06:30','唐先生宝马318汽车质押贷...',40000,'50元~ 不限','临时周转','2','/p2p/cover/1.jpg',1,'','',NULL),
/*Table structure for table `details` */

DROP TABLE IF EXISTS `details`;

CREATE TABLE `details` (
  `did` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `dname` varchar(255) DEFAULT NULL COMMENT '详情标题',
  `dcontent` varchar(255) DEFAULT NULL COMMENT '详情内容',
  `dtype` int(11) DEFAULT NULL COMMENT '详情类型:(0:借款人信息模块;1,风控步骤模块;2,图片信息模块)',
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `did` (`did`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `details` */

insert  into `details`(`did`,`dname`,`dcontent`,`dtype`,`pid`) values 
	(00000000001,'借款人信息介绍','借款人赵女士，1988年出生，大专学历。',0,2),
	(00000000002,'借款人工作情况','赵女士为成都某服装店老板，月收入2万元，收入居住稳定。',0,2);





/*Table structure for table `borrowcord` */
DROP TABLE IF EXISTS `borrowcord`;
CREATE TABLE `borrowcord` (
  `boid` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT NULL COMMENT '还款表id',
  `bdate` datetime DEFAULT NULL COMMENT '还款时间',
  `bstatue` int(11) DEFAULT NULL COMMENT '状态(0,未还款,1,已还款)',
  `bcs` int(11) DEFAULT NULL COMMENT '还款次数',
  PRIMARY KEY (`boid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='还款记录表';

/*Data for the table `borrowcord` */

insert  into `borrowcord`(`boid`,`bid`,`bdate`,`bstatue`,`bcs`,`bz1`,`bz2`) values 
	(1,19,'2017-03-01 09:15:45',1,1),
	(2,19,'2017-04-01 09:15:53',1,2),
	(3,19,'2017-05-01 09:16:00',1,3),
	(4,19,'2017-06-01 09:16:00',1,4),



/*Table structure for table `certification` */
DROP TABLE IF EXISTS `certification`;

CREATE TABLE `certification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cserial` varchar(255) DEFAULT NULL COMMENT '序号',
  `cusername` varchar(255) DEFAULT NULL COMMENT '用户名',
  `crealname` varchar(255) DEFAULT NULL COMMENT '真实姓名 ',
  `cbalance` varchar(255) DEFAULT NULL COMMENT '可用余额',
  `cfreeze` varchar(255) DEFAULT NULL COMMENT '冻结金额 ',
  `cdue` varchar(255) DEFAULT NULL COMMENT '待收金额 ',
  `cpaid` varchar(255) DEFAULT NULL COMMENT '待还金额',
  `ctotalmoney` varchar(255) DEFAULT NULL COMMENT '总金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


/*Data for the table `certification` */
insert  into `certification`(`id`,`cserial`,`cusername`,`crealname`,`cbalance`,`cfreeze`,`cdue`,`cpaid`,`ctotalmoney`) 
	values (1,'1','用户','段炳森','123161123','0','0','0','123161123'),
	(3,'3','用户3','','688111.1100000001','0','0','0','1111111.11'),
	(4,'34','1','1','1','0','0','0','0');

/*Table structure for table `investinfo` */

DROP TABLE IF EXISTS `investinfo`;

CREATE TABLE `investinfo` (
  `inid` int(11) NOT NULL AUTO_INCREMENT COMMENT '投资信息表主键',
  `userid` int(11) NOT NULL COMMENT '投资用户主键',
  `brrowid` int(11) DEFAULT NULL COMMENT '投标的主键',
  `inmoney` decimal(14,2) NOT NULL COMMENT '投资金额',
  `instatus` varchar(255) NOT NULL COMMENT '投资状态 0 收益中的投资  1已完成的投资',
  `instyle` varchar(255) DEFAULT NULL COMMENT '投资类型',
  `brrowstatus` varchar(255) DEFAULT NULL COMMENT '借贷状态是否凑资完',
  `interest` varchar(255) DEFAULT NULL COMMENT '投资利率',
  `profitmodel` varchar(255) DEFAULT NULL COMMENT '盈利方式 如等额本金',
  `profitmoney` decimal(14,2) NOT NULL COMMENT '盈利金额',
  `indate` datetime DEFAULT NULL COMMENT '投资时间，可为空',
  `replaydate` varchar(255) DEFAULT NULL COMMENT '还款期限单位天',
  `markstatus` int(11) NOT NULL COMMENT '投标状态 0默认投标中 1 投标通过（中标） 2投标未通过（失标）',
  PRIMARY KEY (`inid`),
  UNIQUE KEY `inid_UNIQUE` (`inid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 PACK_KEYS=1 ROW_FORMAT=DYNAMIC COMMENT='投资表';

/*Data for the table `investinfo` */

insert  into `investinfo`(`inid`,`userid`,`brrowid`,`inmoney`,`instatus`,`instyle`,`brrowstatus`,`interest`,`profitmodel`,`profitmoney`,`indate`,`replaydate`,`markstatus`) values 
	(3,3,6,'12313.00','0','BTC','筹集中','4','等额本金','0.00','2017-02-24 14:18:24','5',0),
	(4,3,6,'12121.00','0','ETH','筹集中','12.00%','等额本金','0.00','2017-02-25 16:26:47','无期限',0);




/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `laccount` varchar(255) DEFAULT NULL,
  `logtype` varchar(255) DEFAULT NULL,
  `lremark` varchar(255) DEFAULT NULL,
  `lprocesstime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert  into `log`(`id`,`laccount`,`logtype`,`lremark`,`lprocesstime`) values 
	(1,'用户1','进入系统','进入','2017-02-19 18:23:59'),
	(2,'用户2','退出系统','进入','2017-02-15 18:23:59'),
	(3,'用户1','进入系统','进入','2017-02-19 18:23:59'),
	(4,'用户2','退出系统','进入','2017-02-15 18:23:59'),
	(5,'1','用户1','进入系统','2017-03-02 09:01:45'),
	(6,'2','用户2','退出系统','2017-02-08 09:01:49'),
	(17,'6','44','444','2017-02-22 09:16:00');




/*Table structure for table `poundage` */

DROP TABLE IF EXISTS `poundage`;

CREATE TABLE `poundage` (
  `pID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID编号',
  `uID` int(11) NOT NULL COMMENT '用户id',
  `uname` varchar(32) DEFAULT NULL COMMENT '用户名',
  `zname` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `sxmoney` varchar(32) DEFAULT NULL COMMENT '手续费金额',
  `what` varchar(32) DEFAULT NULL COMMENT '什么手续',
  `sxtime` datetime DEFAULT NULL COMMENT '时间',
  `Localaccount` varchar(255) DEFAULT NULL COMMENT '本地账户',
  `bookaccount` varchar(255) DEFAULT NULL COMMENT '往来账户',
  `paytype` varchar(255) DEFAULT NULL COMMENT '交易方式',
  PRIMARY KEY (`pID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='手续费记录表';


/*Data for the table `poundage` */

insert  into `poundage`(`pID`,`uID`,`uname`,`zname`,`sxmoney`,`what`,`sxtime`,`Localaccount`,`bookaccount`,`paytype`) 
	values (1,1,'默默','黄默','500','转账','2017-02-02 08:26:34',NULL,NULL,NULL),
	(2,1,'默默','黄默','600','转账','2017-02-02 08:26:50',NULL,NULL,NULL),
	(3,1,'默默','黄默','700','提现','2017-03-02 08:27:02',NULL,NULL,NULL),
	(5,1,'默默','黄默','900','取款','2017-03-02 08:28:47',NULL,NULL,NULL),
	(6,1,'用户','段炳森','10000','充值','2017-03-06 16:19:27','2312212342124221234','1','快捷支付'),
	(13,1,'用户','段炳森','10000','充值','2017-03-13 14:12:07','2163712317329','1','快捷支付');


/*Table structure for table `tender` */

DROP TABLE IF EXISTS `tender`;

CREATE TABLE `tender` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `biaoid` varchar(255) DEFAULT NULL COMMENT '投标表的ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `ttime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*Table structure for table `trade` */

DROP TABLE IF EXISTS `trade`;

CREATE TABLE `trade` (
  `tID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID编号',
  `uID` int(11) NOT NULL COMMENT '用户id',
  `uname` varchar(32) DEFAULT NULL COMMENT '用户名',
  `zname` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `jymoney` varchar(32) DEFAULT NULL COMMENT '交易金额',
  `what` varchar(32) DEFAULT NULL COMMENT '什么交易',
  `jytime` datetime DEFAULT NULL COMMENT '时间',
  `other` varchar(32) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`tID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='交易记录表';


/*Data for the table `trade` */

insert  into `trade`(`tID`,`uID`,`uname`,`zname`,`jymoney`,`what`,`jytime`,`other`) values 
	(1,1,'默默','黄默','200','取款','2017-02-02 09:07:36','无'),
	(3,1,'默默','黄默','400','提现','2017-02-02 09:08:05','无'),
	(5,1,'默默','黄默','600','存款','2017-03-02 09:08:34','无'),
	(6,3,'用户3','','39000',NULL,'2017-03-06 10:29:55','要投资就要舍得花钱'),
	(27,3,'用户3','','+12321','唐先生宝马318汽车质押贷...标资金筹集未完成,退回本金.','2017-03-13 10:19:55',' '),
	(32,1,'用户','段炳森','8000','提现失败','2017-03-14 09:50:27','无'),
	(36,1,'用户','段炳森','5000','转账成功','2017-03-14 10:17:38','无');


/*Table structure for table `withdrawal` */

DROP TABLE IF EXISTS `withdrawal`;

CREATE TABLE `withdrawal` (
  `wID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID编号',
  `uID` int(11) NOT NULL COMMENT '用户id',
  `uname` varchar(32) DEFAULT NULL COMMENT '用户名',
  `zname` varchar(32) DEFAULT NULL COMMENT '真实姓名',
  `txnum` varchar(32) DEFAULT NULL COMMENT '提现账号',
  `txbank` varchar(32) DEFAULT NULL COMMENT '提现银行',
  `txmoney` varchar(32) DEFAULT NULL COMMENT '提现金额',
  `dzmoney` varchar(32) DEFAULT NULL COMMENT '到账金额',
  `sxf` varchar(32) DEFAULT NULL COMMENT '手续费',
  `txtime` datetime DEFAULT NULL COMMENT '提现时间',
  `zztime` datetime DEFAULT NULL COMMENT '转账时间',
  `statu` varchar(32) DEFAULT NULL COMMENT '状态（失败，已提现,转账中，审核中）',
  `shwho` varchar(32) DEFAULT NULL COMMENT '审核人',
  `shtime` datetime DEFAULT NULL COMMENT '审核时间',
  `nothing` varchar(32) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`wID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='提现管理表';

/*Data for the table `withdrawal` */

insert  into `withdrawal`(`wID`,`uID`,`uname`,`zname`,`txnum`,`txbank`,`txmoney`,`dzmoney`,`sxf`,`txtime`,`zztime`,`statu`,`shwho`,`shtime`,`nothing`) 
	values 
	(1,1,'用户','段炳森','6210984280005308827','中国邮政','3000','3000','0.0','2017-02-24 00:00:00','2017-02-24 00:00:00','0','admin','2017-02-23 14:38:04','无');

