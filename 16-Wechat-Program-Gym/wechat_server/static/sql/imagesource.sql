SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `login_image` (
  `id` int(32) NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `imageurl` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'https://fengdushuo.top/admin/public/images/default.png' COMMENT '用户头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) COMMENT '唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
