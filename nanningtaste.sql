/*
Navicat MySQL Data Transfer

Source Server         : localhost_3307
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : nanningtaste

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2021-12-15 09:30:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_collection
-- ----------------------------
DROP TABLE IF EXISTS `tb_collection`;
CREATE TABLE `tb_collection` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏id',
  `u_id` int(11) NOT NULL COMMENT '用户id',
  `storeName` varchar(255) NOT NULL COMMENT '店铺名',
  PRIMARY KEY (`c_id`),
  KEY `c_storeName` (`storeName`),
  CONSTRAINT `c_storeName` FOREIGN KEY (`storeName`) REFERENCES `tb_store` (`storename`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_collection
-- ----------------------------
INSERT INTO `tb_collection` VALUES ('1', '101', '原一日式拉面');
INSERT INTO `tb_collection` VALUES ('2', '103', '小门老黄烧烤');
INSERT INTO `tb_collection` VALUES ('3', '102', '蜀大侠火锅（西乡塘店）');
INSERT INTO `tb_collection` VALUES ('4', '104', '洛ROJO西班牙餐吧');
INSERT INTO `tb_collection` VALUES ('5', '104', '街头隆江猪脚饭');
INSERT INTO `tb_collection` VALUES ('6', '101', '五条友烧烤');

-- ----------------------------
-- Table structure for tb_dynamic
-- ----------------------------
DROP TABLE IF EXISTS `tb_dynamic`;
CREATE TABLE `tb_dynamic` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动态id',
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `d_tag` varchar(255) NOT NULL COMMENT '美食类型标签',
  `d_details` varchar(255) DEFAULT NULL COMMENT '动态详情',
  `d_status` varchar(255) NOT NULL COMMENT '审核状态',
  `d_img` varchar(255) DEFAULT NULL,
  `d_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`d_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `tb_dynamic_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `tb_user` (`u_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_dynamic
-- ----------------------------
INSERT INTO `tb_dynamic` VALUES ('1', '101', '披萨', '非常的好吃推荐这家店铺，味道很正宗！', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_1.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('2', '102', '奶茶', '便宜平价分量足，很大一杯，喝的很饱很饱，这家的芒果很香。', '未通过', 'shenzhen.aliyuncs.com/store/f_26.jpg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('3', '102', '火锅', '去吃过好几次了，菜品是还行挺好吃的，就是服务态:度一如既往的差，这次还发现了.上菜速度不是一-般的慢,锅底都要干了菜才上上来，而且菜品不是一般的少两个女生吃都根本不够，还另加了三个菜外加自己买的零食，就是不知道可以改善\r\n\r\n去吃过好几次了，菜品是还行挺好吃的，就是服务态:度一如既往的差，这次还发现了.上菜速度不是一-般的慢,锅底都要干了菜才上上来，而且菜品不是一般的少两个女生吃都根本不够，还另加了三个菜外加自己买的零食，就是不知道可以改善\r\n', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_24.jpg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('4', '103', '拉面', '猪排炸的挺嫩的，拉面很Q弹顺滑，总体来说还是不错的。', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_18.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('5', '104', '西餐', '环境不错很适合拍照，牛排味道很正，服务态度也好。位置停车方便，交通方便。', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_3.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('6', '103', '烧烤', '烤的很好吃，非常的入味！', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_5.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('7', '102', '烧烤', '推荐，味道比较正宗。', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/b1.jpg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('8', '101', '奶茶', '奶香浓郁茶底醇香。', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_26.jpg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('9', '101', '甜品', '很好喝，甜度刚刚好，夏天喝一碗心情都好起来了。', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_35.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('10', '104', '街头食品', '麻辣味很足，吃的很爽，分量也不错', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/s_4.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('11', '101', '奶茶', '冰鲜冰鲜的很好喝！便宜又大腕。', '未通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_11.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('12', '101', '奶茶', '清香凤梨与蜜桃香气融合，入口层层果香，如同夏日里的甜美滋味，久久不能平复。', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_26.jpg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('13', '102', '拉面', '汤汁浓郁，拉面爽滑。', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_9.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('14', '103', '拉面', '汤汁浓郁，拉面爽滑，推荐这家店铺', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_19.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('15', '103', '火锅', '肉类比较新鲜，没有异味。锅底也比较浓郁！', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/h4.jpg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('16', '102', '烧烤', ' 这家餐厅环境很好，非常干净整洁，食物不仅外形美观，重要的是味道非常棒，色味俱佳。做法保留了食材原有的味道，清新爽口。而且菜品选择非常多，价格也不高，适合带着家人一起去。', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_15.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('17', '102', '烧烤', '经常点这家，味道很好！', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_30.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('18', '103', '烧烤', '很喜欢，强烈推荐！', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_31.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('19', '103', '甜品', '奶油细腻，吃起来不会腻，水果很新鲜！', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_12.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('20', '104', '西餐', '对这场浪漫的烛光晚餐充满了期待！\r\n店面低调 按门铃进入 二楼设有三桌\r\n靠窗位置氛围感十足 适合约会也可以聊天', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_56.jpeg', '2021-12-10');
INSERT INTO `tb_dynamic` VALUES ('21', '104', '街头美食', '这家店还是比较正宗的，味道很够！', '已通过', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_39.jpeg', '2021-12-10');

-- ----------------------------
-- Table structure for tb_food
-- ----------------------------
DROP TABLE IF EXISTS `tb_food`;
CREATE TABLE `tb_food` (
  `f_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '美食id',
  `s_id` int(11) DEFAULT NULL COMMENT '店铺id',
  `foodName` varchar(255) NOT NULL COMMENT '菜名',
  `foodTag` varchar(255) NOT NULL COMMENT '美食类型标签',
  `f_price` decimal(10,2) NOT NULL COMMENT '价格',
  `f_img` varchar(255) DEFAULT NULL,
  `f_details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  KEY `s_id` (`s_id`),
  CONSTRAINT `s_id` FOREIGN KEY (`s_id`) REFERENCES `tb_store` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_food
-- ----------------------------
INSERT INTO `tb_food` VALUES ('1', '1', '黑椒肉粒披萨', '披萨', '19.90', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_2.jpeg', ' 尺寸8英寸，主材料有：脆皮烤肠，芝士、鸡肉粒。口感蓬松，黑椒味。');
INSERT INTO `tb_food` VALUES ('2', '1', '泰国金枕榴莲披萨', '披萨', '26.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_1.jpeg', ' 尺寸8英寸，主材料为金枕榴莲、芝士。口感蓬松，甜味。');
INSERT INTO `tb_food` VALUES ('3', '2', '番茄海鲜意面+烤肉肠+柠檬红茶', '西餐', '23.50', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_3.jpeg', '约550克，主要材料为鱿鱼、虾仁、番茄，口味酸甜。');
INSERT INTO `tb_food` VALUES ('4', '3', '浪漫二人餐', '火锅', '95.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_4.jpeg', '锅底三选一：全菌汤锅、反鸳鸯锅中锅、全三鲜番茄锅。荤菜：包心蟹仔丸、精品五花肉、相间牛肉、精品千层肚、草原羔羊肉卷。素菜：莴笋块、香菇、生腐竹、油麦菜。精美小吃：红糖糍粑。');
INSERT INTO `tb_food` VALUES ('5', '4', '羊肉串', '烧烤', '3.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_5.jpeg', '无');
INSERT INTO `tb_food` VALUES ('6', '4', '肥牛串', '烧烤', '3.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/b1.jpg', '无');
INSERT INTO `tb_food` VALUES ('7', '4', '火腿肠', '烧烤', '2.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_7.jpeg', '无');
INSERT INTO `tb_food` VALUES ('8', '5', '猪扒拉面套餐（猪扒拉面+大福+日式海藻）', '拉面', '46.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_8.jpeg', '主料：猪扒+海藻');
INSERT INTO `tb_food` VALUES ('9', '5', '[单人套餐]豚骨叉烧拉面+章鱼小丸子', '拉面', '28.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_9.jpeg', '主料：豚骨叉烧拉面+章鱼小丸子');
INSERT INTO `tb_food` VALUES ('10', '6', '香锅3-4人餐', '街头食品', '136.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_10.jpeg', '主打锅2选1：招牌虾锅、翅中锅。配菜：豆腐皮、金针菇、鲜蘑，小花卷、土豆条、油麦菜、菜花等。凉菜：凉菜拼盘。');
INSERT INTO `tb_food` VALUES ('11', '7', '生打椰椰芒Plus杯', '奶茶', '12.88', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_11.jpeg', '现切当季新鲜芒果捣碎打底，搭配爽滑椰冻，加上香浓椰子乳，限冷饮喔！');
INSERT INTO `tb_food` VALUES ('12', '8', '网红小熊蛋糕', '甜品', '17.08', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_12.jpeg', '主料：蛋糕胚，辅料：高级奶油。');
INSERT INTO `tb_food` VALUES ('14', '8', '水果便当蛋糕', '甜品', '9.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_13.jpeg', '主料：蛋糕胚，铺料：高级奶油+随机水果');
INSERT INTO `tb_food` VALUES ('15', '9', '西餐肉', '西餐', '68.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_56.jpeg', '有一点点肥的牛肉吃起来口感才更好！');
INSERT INTO `tb_food` VALUES ('16', '10', '芝加哥披萨', '披萨', '80.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_48.jpeg', '浓浓的芝士加上厚厚的软饼，上面淋的是意大利肉酱，一定要趁热吃喔！');
INSERT INTO `tb_food` VALUES ('17', '11', '明星2人A套餐', '火锅', '248.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/d_1.jpg', '肉类：上脑牛肉 川味：毛肚 蔬菜:油麦菜 海鲜类：鲍鱼 茶饮3选2（不可重复）：冰大红袍珍珠奶茶，热大红袍珍珠奶茶，白玉普洱奶茶 锅底7选2：番茄牛膝骨鸳鸯锅，珍鲜菌菇鸳鸯锅，台式麻辣鸳鸯锅，红颜花椒鸡鸳鸯锅，胡椒猪肚鸡鸳鸯锅，老四川风味麻辣鸳鸯锅，酸菜白肉鸳鸯锅 滑类：猫瓜虾滑');
INSERT INTO `tb_food` VALUES ('18', '11', '16元单人餐', '火锅', '16.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/d_2.jpg', '茉莉奶绿');
INSERT INTO `tb_food` VALUES ('19', '12', '舔手指捞拌花甲螺', '烧烤', '19.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_15.jpeg', '无');
INSERT INTO `tb_food` VALUES ('20', '12', '2-3人餐', '烧烤', '118.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_31.jpeg', '菜品：一米和牛烤串 主食2选1：老友炒粉虫，炒螺蛳粉 素菜有拍黄瓜，甜品：爆珠豆花');
INSERT INTO `tb_food` VALUES ('21', '10', '榴莲披萨', '披萨', '68.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_24.jpg', '无');
INSERT INTO `tb_food` VALUES ('22', '2', '双人牛排套餐', '西餐', '98.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_56.jpeg', '牛排5选2， 沙拉：蔬菜沙拉 小吃7选1，饮品6选2');
INSERT INTO `tb_food` VALUES ('23', '13', '牛肉拉面', '拉面', '13.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_18.jpeg', '吃最牛的肉，喝最牛的汤。');
INSERT INTO `tb_food` VALUES ('24', '13', '羊肉泡馍', '拉面', '22.54', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_19.jpeg', '主料：饼，羊肉。铺料：蒜苗，香菜，粉丝，黑木耳。');
INSERT INTO `tb_food` VALUES ('25', '14', '大浓骨汤软骨拉面', '拉面', '18.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_20.jpeg', '汤汁浓郁，拉面爽滑。');
INSERT INTO `tb_food` VALUES ('26', '14', '骨汤番茄肥牛拉面', '拉面', '20.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_21.jpeg', '汤汁浓郁，拉面爽滑。');
INSERT INTO `tb_food` VALUES ('27', '15', '单人简餐', '西餐', '29.90', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_58.jpeg', '饮品2选1：蜜桃茉莉茶，金桔气泡乐 主食3选1：二师弟，番茄鲜虾仁意大利面，蟹子虾仁肉松炒饭');
INSERT INTO `tb_food` VALUES ('28', '15', '台式香肠鸡油拌饭', '西餐', '6.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_22.jpg', '无');
INSERT INTO `tb_food` VALUES ('29', '16', '双人餐', '火锅', '198.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/d_1.jpg', '无');
INSERT INTO `tb_food` VALUES ('30', '16', '四人餐', '火锅', '318.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_24.jpg', '无');
INSERT INTO `tb_food` VALUES ('31', '17', '招牌芋圆奶茶', '奶茶', '14.90', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_26.jpg', '奶香浓郁茶底醇香。');
INSERT INTO `tb_food` VALUES ('32', '18', '恋恋水蜜桃', '奶茶', '12.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_27.jpg', '无');
INSERT INTO `tb_food` VALUES ('33', '19', '冰鲜柠檬水', '奶茶', '5.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_28.jpeg', '大片柠檬看得见，现切现捣超新鲜【杯型:大杯】');
INSERT INTO `tb_food` VALUES ('34', '19', '蜜桃四季春', '奶茶', '7.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_29.jpeg', '蜜桃四季春，四季桃花运。桃香四溢，脆甜脆甜，搭配Q弹滑爽玫果冻。');
INSERT INTO `tb_food` VALUES ('35', '20', '西瓜啵啵', '奶茶', '11.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_30.jpeg', '新鲜现榨西瓜汁配上寒天');
INSERT INTO `tb_food` VALUES ('36', '20', '招牌金凤梨', '奶茶', '11.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_31.jpg', '清香凤梨与蜜桃香气融合，入口层层果香，如同夏日里的甜美滋味，久久不能平复。');
INSERT INTO `tb_food` VALUES ('37', '21', '鲜鱿鱼串', '烧烤', '2.68', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_33.jpeg', '碳烤深海鲜鱿鱼，烧烤酱与现鱿鱼的无缝搭配，想想都馋嘴。');
INSERT INTO `tb_food` VALUES ('38', '21', '蜜汁豆腐皮', '烧烤', '1.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_34.jpeg', '精选豆腐皮加上上等的碳烤料合适的烘烤，让你回味无穷。');
INSERT INTO `tb_food` VALUES ('39', '21', '碳烤掌中宝', '烧烤', '1.98', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_31.jpeg', '鸡脆骨');
INSERT INTO `tb_food` VALUES ('40', '21', '羊肉串', '烧烤', '3.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_6.jpeg', '无');
INSERT INTO `tb_food` VALUES ('41', '21', '肥牛串', '烧烤', '3.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_5.jpeg', '无');
INSERT INTO `tb_food` VALUES ('42', '21', '火腿肠', '烧烤', '2.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_7.jpeg', '淀粉火腿肠的快乐！');
INSERT INTO `tb_food` VALUES ('43', '21', '田螺鸭脚煲', '烧烤', '25.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_30.jpeg', '鸭脚3个，鹌鹑蛋3个，还有黄花，油果，腐竹芋头等。');
INSERT INTO `tb_food` VALUES ('44', '4', '田螺鸭脚煲', '烧烤', '25.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_30.jpeg', '鸭脚3个，鹌鹑蛋3个，还有黄花，油果，腐竹芋头等。');
INSERT INTO `tb_food` VALUES ('45', '22', '椰奶芋圆甜品', '甜品', '6.50', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_35.jpeg', '3选1：椰奶红豆芋圆，椰奶西米芋圆，椰奶红薯芋圆');
INSERT INTO `tb_food` VALUES ('46', '22', '原味木薯羹', '甜品', '5.20', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_36.jpeg', '原味木薯羹');
INSERT INTO `tb_food` VALUES ('47', '23', '姜汁红糖水', '甜品', '6.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_37.jpeg', '热饮');
INSERT INTO `tb_food` VALUES ('48', '23', '芒果豆腐花', '甜品', '10.74', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_38.jpeg', '无');
INSERT INTO `tb_food` VALUES ('49', '9', '二人牛排海鲜饭甄选餐', '西餐', '228.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_44.jpg', '很好吃的喔！');
INSERT INTO `tb_food` VALUES ('50', '24', '猪蹄饭', '街头食品', '18.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/s_4.jpeg', '肉香四溢！');
INSERT INTO `tb_food` VALUES ('51', '24', '卤猪耳朵饭', '街头食品', '15.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_39.jpeg', '香香脆脆很好吃！');
INSERT INTO `tb_food` VALUES ('52', '25', '原汤螺蛳粉', '街头食品', '10.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_40.jpeg', '汤鲜味美！');
INSERT INTO `tb_food` VALUES ('53', '25', '炒螺蛳粉', '街头食品', '13.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_41.jpeg', '这个价格很划算！');
INSERT INTO `tb_food` VALUES ('54', '26', '老友猪杂粉', '街头食品', '8.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_43.jpeg', '无');
INSERT INTO `tb_food` VALUES ('55', '26', '老友猪肉粉', '街头食品', '9.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_42.jpeg', '无');
INSERT INTO `tb_food` VALUES ('56', '2', '双人牛排套餐', '西餐', '98.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_78.jpeg', '原切牛排5选2，沙拉，小吃7选1，饮品6选2');
INSERT INTO `tb_food` VALUES ('57', '9', '塔帕斯', '西餐', '32.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_45.jpeg', '西班牙饮食的精髓。');
INSERT INTO `tb_food` VALUES ('58', '27', '水果奶酪披萨', '披萨', '29.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_53.jpeg', '9寸，甜香味。');
INSERT INTO `tb_food` VALUES ('59', '27', '黄桃脆鸡披萨', '披萨', '17.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_47.jpeg', '无');
INSERT INTO `tb_food` VALUES ('60', '28', '10英寸田园蔬菜披萨', '披萨', '39.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_50.jpeg', '口感：香酥 主料：青红椒、黑橄榄、黄玉米、菠萝、蘑菇、巧克力');
INSERT INTO `tb_food` VALUES ('61', '28', '10英寸海鲜披萨', '披萨', '39.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_49.jpeg', '清淡口味，主料:蟹柳、鲜虾、鱿鱼、菠萝');
INSERT INTO `tb_food` VALUES ('62', '28', '10英寸五香牛肉披萨', '披萨', '39.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_50.jpeg', '主料:奶酪、面粉、火腿、牛肉、洋葱');
INSERT INTO `tb_food` VALUES ('63', '29', '10寸紫薯比萨', '披萨', '39.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_51.jpegs', '无');
INSERT INTO `tb_food` VALUES ('64', '29', '奥尔良拼水果比萨', '披萨', '42.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_53.jpeg', '主料：芝士、鸡腿、菠萝、木瓜、椰果、鸡肉、培根');
INSERT INTO `tb_food` VALUES ('65', '29', '10寸吞拿鱼比萨两人份', '披萨', '36.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_54.jpeg', '主料：吞拿鱼、火腿、洋葱、黄玉米、青椒');
INSERT INTO `tb_food` VALUES ('66', '30', '7寸奥尔良披萨烤鸡肉披萨单人份', '披萨', '15.60', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_54.jpeg', '无');
INSERT INTO `tb_food` VALUES ('67', '30', '10寸金枕榴莲披萨', '披萨', '39.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_2.jpeg', '无');
INSERT INTO `tb_food` VALUES ('68', '31', '七寸纯肉肠披萨', '披萨', '19.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_48.jpeg', '主料：香肠');
INSERT INTO `tb_food` VALUES ('69', '31', '七寸香辣至尊披萨', '披萨', '19.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_48.jpeg', '辣味披萨');
INSERT INTO `tb_food` VALUES ('70', '32', '榴莲忘返9英寸苏丹王榴莲披萨', '披萨', '32.97', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_46.jpg', '主料：榴莲');
INSERT INTO `tb_food` VALUES ('71', '32', '新奥尔良烤鸡披萨（9英寸）', '披萨', '25.72', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_52.jpeg', '主料：鸡');
INSERT INTO `tb_food` VALUES ('72', '32', '火腿肉松披萨（9英寸）', '披萨', '27.97', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_55.jpeg', '主料：肉松、火腿');
INSERT INTO `tb_food` VALUES ('73', '32', '奶香紫薯披萨（9英寸）', '披萨', '26.97', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_51.jpegs', '主料：紫薯');
INSERT INTO `tb_food` VALUES ('74', '33', '芝士肉酱炒烩意面粉', '西餐', '22.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_58.jpeg', '原料：面条、猪肉');
INSERT INTO `tb_food` VALUES ('75', '33', '黑椒雪花牛扒', '西餐', '38.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_56.jpeg', '原料：牛排');
INSERT INTO `tb_food` VALUES ('76', '33', '法式香鸡鸡扒', '西餐', '28.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_57.jpeg', '原料：鸡肉');
INSERT INTO `tb_food` VALUES ('77', '33', '荤素搭配低脂轻食沙拉', '西餐', '35.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_44.jpg', '原料：牛肉、蔬菜');
INSERT INTO `tb_food` VALUES ('78', '33', '郊外田园蔬菜沙拉', '西餐', '18.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_59.jpeg', '原料：风味沙拉酱、蔬菜');
INSERT INTO `tb_food` VALUES ('79', '34', '澳洲牛排（只有牛排）', '西餐', '24.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/2.jpeg', '原料：牛排');
INSERT INTO `tb_food` VALUES ('80', '34', 'T骨猪排（只有猪排）', '西餐', '14.90', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_62.jpeg', '原料：猪肉');
INSERT INTO `tb_food` VALUES ('82', '34', '菲力牛排（牛排+鸡蛋+意面+配菜）', '西餐', '39.90', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_61.jpeg', '原料：牛排');
INSERT INTO `tb_food` VALUES ('83', '34', '意大利面（只有面）', '西餐', '6.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_58.jpeg', '原料：意大利面');
INSERT INTO `tb_food` VALUES ('84', '35', '法国红酒鹅肝100克', '西餐', '90.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_63.jpeg', '现切现做，新鲜实惠！ ');
INSERT INTO `tb_food` VALUES ('85', '35', '三文鱼净肉', '西餐', '96.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_64.jpeg', '原料：三文鱼');
INSERT INTO `tb_food` VALUES ('86', '35', '北极贝刺身（10片）', '西餐', '46.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_65.jpeg', '原料：鲜贝');
INSERT INTO `tb_food` VALUES ('87', '36', '法式猪扒+煎蛋+意面', '西餐', '26.90', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_61.jpeg', '原料：猪大排');
INSERT INTO `tb_food` VALUES ('88', '36', '上脑雪花牛排|无主食|配时蔬', '西餐', '49.90', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_44.jpg', '原料：牛肉、牛排');
INSERT INTO `tb_food` VALUES ('89', '36', '美式|加州鸡肉玉米浓汤', '西餐', '12.90', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_66.jpeg', '原料：玉米、鸡肉');
INSERT INTO `tb_food` VALUES ('92', '36', '俄式|罗宋牛肉蔬菜汤', '西餐', '12.90', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_67.jpeg', '原料：牛肉、蔬菜');
INSERT INTO `tb_food` VALUES ('93', '37', '美式咖啡', '西餐', '16.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_71.jpeg', '原料：咖啡、其他');
INSERT INTO `tb_food` VALUES ('94', '37', '焦糖玛奇朵咖啡', '西餐', '22.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_70.jpeg', '原料：咖啡、焦糖、其他');
INSERT INTO `tb_food` VALUES ('95', '37', '罗勒松仁青酱意面', '西餐', '22.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_69.jpeg', '原料：面条、罗勒、松子');
INSERT INTO `tb_food` VALUES ('96', '37', '经典黑椒牛柳意面', '西餐', '23.80', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_72.JPEG', '原料：意大利面、牛肉、黑椒');
INSERT INTO `tb_food` VALUES ('97', '38', '牛百叶香锅煲', '火锅', '19.98', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_75.jpeg', '商品描述：含牛肉，牛腩，牛百叶，蔬菜，米饭一盒。');
INSERT INTO `tb_food` VALUES ('98', '38', '香菇肥牛+小酥肉（含丰富配菜，米饭1盒）', '火锅', '16.98', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_73.jpeg', '原料：鸡肉，大米');
INSERT INTO `tb_food` VALUES ('99', '38', '水煮三国', '火锅', '16.98', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_76.jpeg', '原料：鸡肉，鱿鱼  制作方式：煮  分量：1200克');
INSERT INTO `tb_food` VALUES ('100', '38', '川式香辣火锅肥牛拼猪肚（含米饭，配菜）', '火锅', '18.98', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_74.jpeg', '原料：大米，猪肉，其他鱼类');
INSERT INTO `tb_food` VALUES ('106', '1', '芝加哥披萨', '披萨', '68.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_48.jpeg', '浓浓的芝士加上厚厚的软饼，上面淋的是意大利肉酱，一定要趁热吃喔！');
INSERT INTO `tb_food` VALUES ('107', '1', '10英寸海鲜披萨', '披萨', '39.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_49.jpeg', '清淡口味，主料:蟹柳、鲜虾、鱿鱼、菠萝');
INSERT INTO `tb_food` VALUES ('108', '1', '10英寸田园蔬菜披萨', '披萨', '39.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_50.jpeg', '口感：香酥 主料：青红椒、黑橄榄、黄玉米、菠萝、蘑菇、巧克力39');
INSERT INTO `tb_food` VALUES ('109', '1', '10寸紫薯比萨', '披萨', '39.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/food/f_51.jpeg', '主料：紫薯');
INSERT INTO `tb_food` VALUES ('110', '33', '西餐肉', '西餐', '68.00', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_56.jpeg', '有一点点肥的牛肉吃起来口感才更好！');

-- ----------------------------
-- Table structure for tb_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_record`;
CREATE TABLE `tb_record` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `u_id` int(11) NOT NULL COMMENT '用户id',
  `storeName` varchar(255) NOT NULL COMMENT '店铺名',
  `r_status` varchar(255) NOT NULL COMMENT '收藏状态，1为已收藏，0为未收藏',
  `r_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`r_id`),
  KEY `storeName` (`storeName`),
  CONSTRAINT `storeName` FOREIGN KEY (`storeName`) REFERENCES `tb_store` (`storename`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_record
-- ----------------------------
INSERT INTO `tb_record` VALUES ('2', '102', '贡茶（西乡塘店）', '0', '2021-12-9');
INSERT INTO `tb_record` VALUES ('3', '103', '原一日式拉面', '1', '2021-12-9');
INSERT INTO `tb_record` VALUES ('4', '103', '小门老黄烧烤', '0', '2021-12-9');
INSERT INTO `tb_record` VALUES ('5', '101', '茶百道（西乡塘店）', '0', '2021-12-9');
INSERT INTO `tb_record` VALUES ('6', '101', '芋娘糖水店', '0', '2021-12-9');
INSERT INTO `tb_record` VALUES ('7', '102', '蜀大侠火锅', '1', '2021-12-9');
INSERT INTO `tb_record` VALUES ('8', '102', '贡茶（西乡塘店）', '0', '2021-12-9');
INSERT INTO `tb_record` VALUES ('9', '104', '洛ROJO西班牙餐吧', '1', '2021-12-9');
INSERT INTO `tb_record` VALUES ('10', '104', '街头食号麻辣香锅', '0', '2021-12-15');
INSERT INTO `tb_record` VALUES ('11', '104', '街头隆江猪脚饭', '1', '2021-12-15');
INSERT INTO `tb_record` VALUES ('12', '102', '贡茶（西乡塘店）', '0', '2021-12-15');

-- ----------------------------
-- Table structure for tb_store
-- ----------------------------
DROP TABLE IF EXISTS `tb_store`;
CREATE TABLE `tb_store` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺id',
  `storeName` varchar(255) NOT NULL COMMENT '店铺名',
  `storeTag` varchar(255) NOT NULL COMMENT '店铺标签',
  `s_location` varchar(255) NOT NULL COMMENT '店铺地址',
  `s_img` varchar(255) NOT NULL,
  `s_price` decimal(10,2) DEFAULT NULL COMMENT '店铺人均价格',
  PRIMARY KEY (`s_id`),
  KEY `storeName` (`storeName`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_store
-- ----------------------------
INSERT INTO `tb_store` VALUES ('1', '吉康披萨店', '披萨', '夏均坡6号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_2.jpeg', '15.00');
INSERT INTO `tb_store` VALUES ('2', '意面叔叔pasta uncle', '西餐', '相思湖商贸城第1层1008号商铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_3.jpeg', '43.00');
INSERT INTO `tb_store` VALUES ('3', '蜀大侠火锅（西乡塘店）', '火锅', '西乡塘大学东路93号相思湖商贸城第2层第2011、2012号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_4.jpeg', '72.00');
INSERT INTO `tb_store` VALUES ('4', '小门老黄烧烤', '烧烤', '广西民族大学东校区四坡小门', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_5.jpeg', '30.00');
INSERT INTO `tb_store` VALUES ('5', '原一日式拉面', '拉面', '西乡塘区科园大道43号盛天府B37号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_20.jpeg', '20.00');
INSERT INTO `tb_store` VALUES ('6', '街头食号麻辣香锅', '街头食品', '青秀区自由路师范大学北门西100米', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_10.jpeg', '39.00');
INSERT INTO `tb_store` VALUES ('7', '贡茶（西乡塘店）', '奶茶', '西乡塘区思均路3号盛邦珑庭3号楼一层116号店铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_28.jpeg', '8.00');
INSERT INTO `tb_store` VALUES ('8', '珈珈米苏蛋糕', '甜品', '鹏飞路罗文农贸综合市场', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_12.jpeg', null);
INSERT INTO `tb_store` VALUES ('9', '洛ROJO西班牙餐吧', '西餐', '青秀区中泰路7号东盟商务区服务中心一层（舌站烧烤酒馆背后）', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/w1.jpg', '131.00');
INSERT INTO `tb_store` VALUES ('10', '可利亚披萨', '披萨', '青秀区朱槿路5号东盟商务区韩国园区首尔街14号楼110-A号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/2.jpg', '43.00');
INSERT INTO `tb_store` VALUES ('11', '湊湊火锅', '火锅', '青秀区民族大道136号华润万象城L4层L463铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/h1.jpg', '125.00');
INSERT INTO `tb_store` VALUES ('12', '五条友烧烤', '烧烤', '江南区星光大道44号（地铁2号线，福建园G出口）', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/b1.jpg', '99.00');
INSERT INTO `tb_store` VALUES ('13', '中国兰州拉面', '拉面', '南宁市高新区新苑路17号华成都商业广场H栋一层009号商铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_19.jpeg', '15.00');
INSERT INTO `tb_store` VALUES ('14', '味千拉面（航洋国际广场店）', '拉面', '青秀区民族大道131号航洋国际购物中心4层', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_9.jpeg', '50.00');
INSERT INTO `tb_store` VALUES ('15', '驿逅', '西餐', '兴宁区北宁路83号后进店铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/2.jpeg', '49.00');
INSERT INTO `tb_store` VALUES ('16', '重庆德庄火锅', '火锅', '兴宁区朝阳路29号西南商都第五层5F-14号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/h4.jpg', '81.00');
INSERT INTO `tb_store` VALUES ('17', '茶百道（西乡塘店）', '奶茶', '西乡塘区华成都市', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_26.jpg', '15.00');
INSERT INTO `tb_store` VALUES ('18', 'CoCo都可（西乡塘店）', '奶茶', '西乡塘客运站地铁商业街B16，B17，B18商铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/s_1.jpg', '13.00');
INSERT INTO `tb_store` VALUES ('19', '蜜雪冰城（西乡塘店）', '奶茶', '南宁市高新区新苑路17号“华艺坊”25号铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/s_2.jpeg', '10.00');
INSERT INTO `tb_store` VALUES ('20', '梁小糖（西乡塘店）', '奶茶', '西乡塘区大学东路174号农职院旁农科农贸市场内蜜雪冰城旁边铺面', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/s_3.jpg', '9.00');
INSERT INTO `tb_store` VALUES ('21', '舌尖上的南铁烧烤', '烧烤', '西乡塘区大岭村六冬坡村口旁左侧第15减', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/b3.jpg', '30.00');
INSERT INTO `tb_store` VALUES ('22', '芋娘糖水店', '甜品', '西乡塘区农园路1号一加一商业街B区2号店铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_35.jpeg', '8.00');
INSERT INTO `tb_store` VALUES ('23', '甜品铺子', '甜品', '高新区新苑路17号华成都商业广场一层L005号商铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_36.jpeg', '8.00');
INSERT INTO `tb_store` VALUES ('24', '街头隆江猪脚饭', '街头食品', '西乡塘区大学东路新村村口A栋一楼10号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/s_4.jpeg', '18.00');
INSERT INTO `tb_store` VALUES ('25', '柳忆街头螺蛳粉', '街头食品', '青秀区葛村路一巷27号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_41.jpeg', '10.00');
INSERT INTO `tb_store` VALUES ('26', '泉姐老友', '街头食品', '兴宁区人民路北一里530号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_42.jpeg', '12.00');
INSERT INTO `tb_store` VALUES ('27', '欢乐颂披萨', '披萨', '西乡塘区罗文大道四联村林屋坡33号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_1.jpeg', '20.00');
INSERT INTO `tb_store` VALUES ('28', '悦尊披萨（莱茵鹭湖店）', '披萨', '西乡塘区高新大道150号人和·莱茵鹭湖地下室地下一层B1076号商铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_46.jpg', '39.00');
INSERT INTO `tb_store` VALUES ('29', '飞萨比萨店', '披萨', '南宁市新阳南路49号永和小区11栋底层18号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_47.jpeg', '45.00');
INSERT INTO `tb_store` VALUES ('30', '芝到披萨', '披萨', '江南区沙井大道56号南宁华南一期物流区江南上城BC栋一层1059号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_48.jpeg', '25.00');
INSERT INTO `tb_store` VALUES ('31', '柠檬子烘焙（披萨）', '披萨', '西乡塘区四联村可利坡四组47号一楼1号店铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_49.jpeg', '19.80');
INSERT INTO `tb_store` VALUES ('32', '马路施披萨', '披萨', '西乡塘区大岭村三冬坡四组86号一楼第2间铺面（陈统杰自建房）', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_50.jpeg', '22.00');
INSERT INTO `tb_store` VALUES ('33', '喜遇简餐·创意轻食·奶茶', '西餐', '南宁市高新大道150号莱茵鹭湖A栋11号、A112号商铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_57.jpeg', '30.00');
INSERT INTO `tb_store` VALUES ('34', '朕想吃牛排（西乡塘市场店）', '西餐', '南宁市大学东路174号内A号楼一层11号铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_56.jpeg', '30.00');
INSERT INTO `tb_store` VALUES ('35', '鲜本尚·挪威三文鱼（大学路店）', '西餐', '南宁市西乡塘区陈东村谷塘东15号一楼第5号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_65.jpeg', '50.00');
INSERT INTO `tb_store` VALUES ('36', '三尺巷牛排（东盟店）', '西餐', '南宁市青秀区桂雅路96号老挝园区东盟国际第1街商业7栋2-06号商铺', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_44.jpg', '50.00');
INSERT INTO `tb_store` VALUES ('37', 'CFLifecoffee(碧湖店)', '西餐', '南宁市青秀区碧湖元碧云阁1层BSP-3号商场', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_45.jpeg', '30.00');
INSERT INTO `tb_store` VALUES ('38', '大红冒·火锅融合菜（建院店）', '火锅', '南宁市区四联村夏均坡129号B楼7号', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/store/f_77.jpeg', '20.00');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `userName` varchar(255) NOT NULL COMMENT '用户名',
  `userPwd` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `userLocation` varchar(255) NOT NULL COMMENT '用户地址',
  `userAvatar` varchar(255) DEFAULT NULL,
  `userActor` varchar(255) NOT NULL COMMENT '用户角色',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('101', '张三', '123456', '广西民族大学', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/user/u_1.jpeg', '管理员');
INSERT INTO `tb_user` VALUES ('102', '李四', null, '相思湖购物公园', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/user/u_2.jpeg', '用户');
INSERT INTO `tb_user` VALUES ('103', '王五', null, '广西大学', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/user/u_3.jpeg', '用户');
INSERT INTO `tb_user` VALUES ('104', '刘飒', '123456', '广西民族大学', 'https://nanning-taste.oss-cn-shenzhen.aliyuncs.com/user/u_4.jpeg', '管理员');
