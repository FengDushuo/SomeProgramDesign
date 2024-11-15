-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2018-02-04 11:29:49
-- 服务器版本： 5.6.37-log
-- PHP Version: 7.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hb_haoshu676_co`
--

-- --------------------------------------------------------

--
-- 表的结构 `hb_ad`
--

CREATE TABLE IF NOT EXISTS `hb_ad` (
  `ad_id` bigint(20) NOT NULL COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hb_asset`
--

CREATE TABLE IF NOT EXISTS `hb_asset` (
  `aid` bigint(20) NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_auth_access`
--

CREATE TABLE IF NOT EXISTS `hb_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

--
-- 转存表中的数据 `hb_auth_access`
--

INSERT INTO `hb_auth_access` (`role_id`, `rule_name`, `type`) VALUES
(6, 'statis/user/envelop_user', 'admin_url'),
(6, 'statis/user/get_usersummary', 'admin_url'),
(6, 'statis/user/index', 'admin_url'),
(6, 'statis/counts/index', 'admin_url'),
(6, 'admin/user/cancelban', 'admin_url'),
(6, 'admin/user/ban', 'admin_url'),
(6, 'admin/user/add_post', 'admin_url'),
(6, 'admin/user/add', 'admin_url'),
(6, 'admin/user/edit_post', 'admin_url'),
(6, 'admin/user/edit', 'admin_url'),
(6, 'admin/user/delete', 'admin_url'),
(6, 'admin/user/index', 'admin_url'),
(6, 'admin/rbac/roleadd_post', 'admin_url'),
(6, 'admin/rbac/roleadd', 'admin_url'),
(6, 'admin/rbac/roledelete', 'admin_url'),
(6, 'admin/rbac/roleedit_post', 'admin_url'),
(6, 'admin/rbac/roleedit', 'admin_url'),
(6, 'admin/rbac/authorize_post', 'admin_url'),
(6, 'admin/rbac/authorize', 'admin_url'),
(6, 'admin/rbac/member', 'admin_url'),
(6, 'admin/rbac/index', 'admin_url'),
(6, 'user/indexadmin/default3', 'admin_url'),
(6, 'user/oauthadmin/delete', 'admin_url'),
(6, 'user/oauthadmin/index', 'admin_url'),
(6, 'user/indexadmin/cancelban', 'admin_url'),
(6, 'user/indexadmin/ban', 'admin_url'),
(6, 'user/indexadmin/index', 'admin_url'),
(6, 'user/indexadmin/default1', 'admin_url'),
(6, 'user/indexadmin/default', 'admin_url'),
(6, 'statis/money/index', 'admin_url'),
(6, 'statis/money/get_sum', 'admin_url'),
(6, 'admin/customer/index', 'admin_url'),
(6, 'capital/capital/index', 'admin_url'),
(6, 'capital/capital/pay', 'admin_url'),
(6, 'capital/capital/withdrawals', 'admin_url'),
(6, 'capital/capital/receive', 'admin_url');

-- --------------------------------------------------------

--
-- 表的结构 `hb_auth_rule`
--

CREATE TABLE IF NOT EXISTS `hb_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

--
-- 转存表中的数据 `hb_auth_rule`
--

INSERT INTO `hb_auth_rule` (`id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition`) VALUES
(175, 'Statis', 'admin_url', 'statis/counts/index', NULL, '统计', 1, ''),
(176, 'Statis', 'admin_url', 'statis/user/index', NULL, '用户统计', 1, ''),
(177, 'Admin', 'admin_url', 'admin/basicconfig/index', NULL, '基本配置', 1, ''),
(178, 'Statis', 'admin_url', 'statis/user/get_usersummary', NULL, '公众号用户', 1, ''),
(179, 'Statis', 'admin_url', 'statis/user/envelop_user', NULL, '本地红包用户统计', 1, ''),
(180, 'Statis', 'admin_url', 'statis/money/index', NULL, '资金流动', 1, ''),
(181, 'Admin', 'admin_url', 'admin/customer/index', NULL, '用户信息', 1, ''),
(182, 'Statis', 'admin_url', 'statis/money/get_sum', NULL, '资金流动异步方法', 1, ''),
(183, 'Capital', 'admin_url', 'capital/capital/index', NULL, '资金明细', 1, ''),
(184, 'Capital', 'admin_url', 'capital/capital/pay', NULL, '支付明细', 1, ''),
(185, 'Capital', 'admin_url', 'capital/capital/withdrawals', NULL, '提现明细', 1, ''),
(186, 'Capital', 'admin_url', 'capital/capital/receive', NULL, '领取明细', 1, ''),
(187, 'Admin', 'admin_url', 'admin/enve/index', NULL, '红包管理', 1, ''),
(188, 'Admin', 'admin_url', 'admin/content/default', NULL, '内容管理', 1, ''),
(189, 'Api', 'admin_url', 'api/oauthadmin/setting', NULL, '第三方登陆', 1, ''),
(190, 'User', 'admin_url', 'user/oauthadmin/index', NULL, '第三方用户', 1, ''),
(191, 'Admin', 'admin_url', 'admin/slide/default', NULL, '广告', 1, ''),
(192, 'Admin', 'admin_url', 'admin/plugin/index', NULL, '插件管理', 1, ''),
(193, 'Admin', 'admin_url', 'admin/ad/index', NULL, '提示语', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `hb_comments`
--

CREATE TABLE IF NOT EXISTS `hb_comments` (
  `id` bigint(20) unsigned NOT NULL,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_common_action_log`
--

CREATE TABLE IF NOT EXISTS `hb_common_action_log` (
  `id` int(11) NOT NULL,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_enve`
--

CREATE TABLE IF NOT EXISTS `hb_enve` (
  `id` int(11) unsigned NOT NULL,
  `quest` varchar(150) NOT NULL DEFAULT '' COMMENT '口令或者问题',
  `quest_py` varchar(255) DEFAULT '' COMMENT '口令拼音',
  `answer` varchar(255) NOT NULL DEFAULT '' COMMENT '答案',
  `answer_py` varchar(255) DEFAULT '' COMMENT '答案拼音',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `openid` varchar(36) DEFAULT '' COMMENT '微信openid',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名/昵称',
  `pay_type` char(1) NOT NULL DEFAULT '0' COMMENT '支付类型 1微信支付 2 余额支付 3 部分微信部分余额支付',
  `show_amount` decimal(18,2) DEFAULT '0.00' COMMENT '显示金额',
  `amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `commission` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '佣金',
  `pay_status` char(50) NOT NULL DEFAULT '' COMMENT '支付状态 ok支付成功  cancel取消支付 fail支付失败',
  `nonce_str` varchar(50) DEFAULT '' COMMENT '本地随机生成的订单号',
  `out_trade_no` varchar(50) DEFAULT '' COMMENT '商户订单号',
  `transaction_id` varchar(32) DEFAULT '' COMMENT '微信支付订单号',
  `num` int(8) NOT NULL DEFAULT '0' COMMENT '个数',
  `form_id` varchar(64) NOT NULL DEFAULT '' COMMENT '小程序表单提交的formId',
  `prepay_id` varchar(64) NOT NULL DEFAULT '' COMMENT '支付产生的prepay_id',
  `receive_num` int(8) NOT NULL DEFAULT '0' COMMENT '已领取个数',
  `be_overdue` tinyint(1) NOT NULL DEFAULT '0' COMMENT '红包是否过期：0未过期，1过期',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `enve_type` tinyint(4) DEFAULT '0' COMMENT '红包类型0普通口令 1真心寄语 2你说我猜',
  `is_adv` tinyint(4) DEFAULT '0' COMMENT '0不是广告红包 1是广告红包',
  `adv_url` varchar(255) DEFAULT NULL COMMENT '广告文件',
  `voice_url` varchar(255) DEFAULT NULL COMMENT '你说我猜语音文件',
  `share2square` tinyint(4) DEFAULT '0' COMMENT '是否分享到广场',
  `voice_dura` int(11) DEFAULT NULL COMMENT '语音时长 毫秒数',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频广告地址',
  `adv_text` varchar(255) DEFAULT NULL COMMENT '广告语',
  `del` tinyint(1) unsigned DEFAULT '0' COMMENT '是否删除'
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `hb_enve`
--

INSERT INTO `hb_enve` (`id`, `quest`, `quest_py`, `answer`, `answer_py`, `user_id`, `openid`, `user_name`, `pay_type`, `show_amount`, `amount`, `commission`, `pay_status`, `nonce_str`, `out_trade_no`, `transaction_id`, `num`, `form_id`, `prepay_id`, `receive_num`, `be_overdue`, `add_time`, `update_time`, `enve_type`, `is_adv`, `adv_url`, `voice_url`, `share2square`, `voice_dura`, `video_url`, `adv_text`, `del`) VALUES
(2, '谢谢老板', 'xiexielaoban', '', '', 2, 'o6OJb5Ti9oJz7KD3-dpi2YQ1gxKs', 'M婷', '1', '0.01', '0.01', '0.00', '', '', 'H2018012422255015278442', '', 1, '1516803950491', 'wx20180124222550013a3dd70a0967556583', 0, 0, 1516803950, 0, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `hb_enve_receive`
--

CREATE TABLE IF NOT EXISTS `hb_enve_receive` (
  `id` int(11) unsigned NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT 'enve表id',
  `receive_answer` varchar(200) NOT NULL DEFAULT '' COMMENT '答案',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `nick_name` varchar(150) NOT NULL DEFAULT '' COMMENT '昵称',
  `head_img` varchar(150) NOT NULL DEFAULT '' COMMENT '头像',
  `receive_amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `receive_num` int(8) NOT NULL DEFAULT '0' COMMENT '领取个数',
  `voice_url` varchar(100) NOT NULL DEFAULT '' COMMENT '微信语音路径',
  `durat` varchar(11) NOT NULL DEFAULT '0' COMMENT '语音时长',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `best` tinyint(4) DEFAULT '0' COMMENT '是否最佳0 1'
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `hb_guestbook`
--

CREATE TABLE IF NOT EXISTS `hb_guestbook` (
  `id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_links`
--

CREATE TABLE IF NOT EXISTS `hb_links` (
  `link_id` bigint(20) unsigned NOT NULL,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_menu`
--

CREATE TABLE IF NOT EXISTS `hb_menu` (
  `id` smallint(6) unsigned NOT NULL,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID'
) ENGINE=MyISAM AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

--
-- 转存表中的数据 `hb_menu`
--

INSERT INTO `hb_menu` (`id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder`) VALUES
(1, 0, 'Admin', 'Content', 'default', '', 0, 0, '内容管理', 'th', '', 30),
(2, 1, 'Api', 'Guestbookadmin', 'index', '', 1, 1, '所有留言', '', '', 0),
(3, 2, 'Api', 'Guestbookadmin', 'delete', '', 1, 0, '删除网站留言', '', '', 0),
(4, 1, 'Comment', 'Commentadmin', 'index', '', 1, 1, '评论管理', '', '', 0),
(5, 4, 'Comment', 'Commentadmin', 'delete', '', 1, 0, '删除评论', '', '', 0),
(6, 4, 'Comment', 'Commentadmin', 'check', '', 1, 0, '评论审核', '', '', 0),
(7, 1, 'Portal', 'AdminPost', 'index', '', 1, 1, '文章管理', '', '', 1),
(8, 7, 'Portal', 'AdminPost', 'listorders', '', 1, 0, '文章排序', '', '', 0),
(9, 7, 'Portal', 'AdminPost', 'top', '', 1, 0, '文章置顶', '', '', 0),
(10, 7, 'Portal', 'AdminPost', 'recommend', '', 1, 0, '文章推荐', '', '', 0),
(11, 7, 'Portal', 'AdminPost', 'move', '', 1, 0, '批量移动', '', '', 1000),
(12, 7, 'Portal', 'AdminPost', 'check', '', 1, 0, '文章审核', '', '', 1000),
(13, 7, 'Portal', 'AdminPost', 'delete', '', 1, 0, '删除文章', '', '', 1000),
(14, 7, 'Portal', 'AdminPost', 'edit', '', 1, 0, '编辑文章', '', '', 1000),
(15, 14, 'Portal', 'AdminPost', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(16, 7, 'Portal', 'AdminPost', 'add', '', 1, 0, '添加文章', '', '', 1000),
(17, 16, 'Portal', 'AdminPost', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(18, 1, 'Portal', 'AdminTerm', 'index', '', 0, 1, '分类管理', '', '', 2),
(19, 18, 'Portal', 'AdminTerm', 'listorders', '', 1, 0, '文章分类排序', '', '', 0),
(20, 18, 'Portal', 'AdminTerm', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(21, 18, 'Portal', 'AdminTerm', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(22, 21, 'Portal', 'AdminTerm', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(23, 18, 'Portal', 'AdminTerm', 'add', '', 1, 0, '添加分类', '', '', 1000),
(24, 23, 'Portal', 'AdminTerm', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(25, 1, 'Portal', 'AdminPage', 'index', '', 1, 1, '页面管理', '', '', 3),
(26, 25, 'Portal', 'AdminPage', 'listorders', '', 1, 0, '页面排序', '', '', 0),
(27, 25, 'Portal', 'AdminPage', 'delete', '', 1, 0, '删除页面', '', '', 1000),
(28, 25, 'Portal', 'AdminPage', 'edit', '', 1, 0, '编辑页面', '', '', 1000),
(29, 28, 'Portal', 'AdminPage', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(30, 25, 'Portal', 'AdminPage', 'add', '', 1, 0, '添加页面', '', '', 1000),
(31, 30, 'Portal', 'AdminPage', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(32, 1, 'Admin', 'Recycle', 'default', '', 1, 1, '回收站', '', '', 4),
(33, 32, 'Portal', 'AdminPost', 'recyclebin', '', 1, 1, '文章回收', '', '', 0),
(34, 33, 'Portal', 'AdminPost', 'restore', '', 1, 0, '文章还原', '', '', 1000),
(35, 33, 'Portal', 'AdminPost', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(36, 32, 'Portal', 'AdminPage', 'recyclebin', '', 1, 1, '页面回收', '', '', 1),
(37, 36, 'Portal', 'AdminPage', 'clean', '', 1, 0, '彻底删除', '', '', 1000),
(38, 36, 'Portal', 'AdminPage', 'restore', '', 1, 0, '页面还原', '', '', 1000),
(39, 0, 'Admin', 'Extension', 'default', '', 0, 1, '扩展工具', 'cloud', '', 40),
(40, 39, 'Admin', 'Backup', 'default', '', 1, 0, '备份管理', '', '', 0),
(41, 40, 'Admin', 'Backup', 'restore', '', 1, 1, '数据还原', '', '', 0),
(42, 40, 'Admin', 'Backup', 'index', '', 1, 1, '数据备份', '', '', 0),
(43, 42, 'Admin', 'Backup', 'index_post', '', 1, 0, '提交数据备份', '', '', 0),
(44, 40, 'Admin', 'Backup', 'download', '', 1, 0, '下载备份', '', '', 1000),
(45, 40, 'Admin', 'Backup', 'del_backup', '', 1, 0, '删除备份', '', '', 1000),
(46, 40, 'Admin', 'Backup', 'import', '', 1, 0, '数据备份导入', '', '', 1000),
(47, 39, 'Admin', 'Plugin', 'index', '', 1, 0, '插件管理', '', '', 0),
(48, 47, 'Admin', 'Plugin', 'toggle', '', 1, 0, '插件启用切换', '', '', 0),
(49, 47, 'Admin', 'Plugin', 'setting', '', 1, 0, '插件设置', '', '', 0),
(50, 49, 'Admin', 'Plugin', 'setting_post', '', 1, 0, '插件设置提交', '', '', 0),
(51, 47, 'Admin', 'Plugin', 'install', '', 1, 0, '插件安装', '', '', 0),
(52, 47, 'Admin', 'Plugin', 'uninstall', '', 1, 0, '插件卸载', '', '', 0),
(53, 39, 'Admin', 'Slide', 'default', '', 1, 1, '广告', '', '', 1),
(54, 53, 'Admin', 'Slide', 'index', '', 1, 1, '幻灯片管理', '', '', 0),
(55, 54, 'Admin', 'Slide', 'listorders', '', 1, 0, '幻灯片排序', '', '', 0),
(56, 54, 'Admin', 'Slide', 'toggle', '', 1, 0, '幻灯片显示切换', '', '', 0),
(57, 54, 'Admin', 'Slide', 'delete', '', 1, 0, '删除幻灯片', '', '', 1000),
(58, 54, 'Admin', 'Slide', 'edit', '', 1, 0, '编辑幻灯片', '', '', 1000),
(59, 58, 'Admin', 'Slide', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(60, 54, 'Admin', 'Slide', 'add', '', 1, 0, '添加幻灯片', '', '', 1000),
(61, 60, 'Admin', 'Slide', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(62, 53, 'Admin', 'Slidecat', 'index', '', 1, 1, '幻灯片分类', '', '', 0),
(63, 62, 'Admin', 'Slidecat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(64, 62, 'Admin', 'Slidecat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(65, 64, 'Admin', 'Slidecat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(66, 62, 'Admin', 'Slidecat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(67, 66, 'Admin', 'Slidecat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(68, 39, 'Admin', 'Ad', 'index', '', 1, 1, '提示语', '', '', 2),
(69, 68, 'Admin', 'Ad', 'toggle', '', 1, 0, '广告显示切换', '', '', 0),
(70, 68, 'Admin', 'Ad', 'delete', '', 1, 0, '删除广告', '', '', 1000),
(71, 68, 'Admin', 'Ad', 'edit', '', 1, 0, '编辑广告', '', '', 1000),
(72, 71, 'Admin', 'Ad', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(73, 68, 'Admin', 'Ad', 'add', '', 1, 0, '添加广告', '', '', 1000),
(74, 73, 'Admin', 'Ad', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(75, 39, 'Admin', 'Link', 'index', '', 0, 1, '友情链接', '', '', 3),
(76, 75, 'Admin', 'Link', 'listorders', '', 1, 0, '友情链接排序', '', '', 0),
(77, 75, 'Admin', 'Link', 'toggle', '', 1, 0, '友链显示切换', '', '', 0),
(78, 75, 'Admin', 'Link', 'delete', '', 1, 0, '删除友情链接', '', '', 1000),
(79, 75, 'Admin', 'Link', 'edit', '', 1, 0, '编辑友情链接', '', '', 1000),
(80, 79, 'Admin', 'Link', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(81, 75, 'Admin', 'Link', 'add', '', 1, 0, '添加友情链接', '', '', 1000),
(82, 81, 'Admin', 'Link', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(83, 39, 'Api', 'Oauthadmin', 'setting', '', 1, 0, '第三方登陆', 'leaf', '', 4),
(84, 83, 'Api', 'Oauthadmin', 'setting_post', '', 1, 0, '提交设置', '', '', 0),
(85, 0, 'Admin', 'Menu', 'default', '', 1, 1, '菜单管理', 'list', '', 20),
(86, 85, 'Admin', 'Navcat', 'default1', '', 1, 1, '前台菜单', '', '', 0),
(87, 86, 'Admin', 'Nav', 'index', '', 1, 1, '菜单管理', '', '', 0),
(88, 87, 'Admin', 'Nav', 'listorders', '', 1, 0, '前台导航排序', '', '', 0),
(89, 87, 'Admin', 'Nav', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(90, 87, 'Admin', 'Nav', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(91, 90, 'Admin', 'Nav', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(92, 87, 'Admin', 'Nav', 'add', '', 1, 0, '添加菜单', '', '', 1000),
(93, 92, 'Admin', 'Nav', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(94, 86, 'Admin', 'Navcat', 'index', '', 1, 1, '菜单分类', '', '', 0),
(95, 94, 'Admin', 'Navcat', 'delete', '', 1, 0, '删除分类', '', '', 1000),
(96, 94, 'Admin', 'Navcat', 'edit', '', 1, 0, '编辑分类', '', '', 1000),
(97, 96, 'Admin', 'Navcat', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(98, 94, 'Admin', 'Navcat', 'add', '', 1, 0, '添加分类', '', '', 1000),
(99, 98, 'Admin', 'Navcat', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(100, 85, 'Admin', 'Menu', 'index', '', 1, 1, '后台菜单', '', '', 0),
(101, 100, 'Admin', 'Menu', 'add', '', 1, 0, '添加菜单', '', '', 0),
(102, 101, 'Admin', 'Menu', 'add_post', '', 1, 0, '提交添加', '', '', 0),
(103, 100, 'Admin', 'Menu', 'listorders', '', 1, 0, '后台菜单排序', '', '', 0),
(104, 100, 'Admin', 'Menu', 'export_menu', '', 1, 0, '菜单备份', '', '', 1000),
(105, 100, 'Admin', 'Menu', 'edit', '', 1, 0, '编辑菜单', '', '', 1000),
(106, 105, 'Admin', 'Menu', 'edit_post', '', 1, 0, '提交编辑', '', '', 0),
(107, 100, 'Admin', 'Menu', 'delete', '', 1, 0, '删除菜单', '', '', 1000),
(108, 100, 'Admin', 'Menu', 'lists', '', 1, 0, '所有菜单', '', '', 1000),
(109, 0, 'Admin', 'Setting', 'default', '', 0, 1, '设置', 'cogs', '', 0),
(110, 109, 'Admin', 'Setting', 'userdefault', '', 0, 1, '个人信息', '', '', 0),
(111, 110, 'Admin', 'User', 'userinfo', '', 1, 1, '修改信息', '', '', 0),
(112, 111, 'Admin', 'User', 'userinfo_post', '', 1, 0, '修改信息提交', '', '', 0),
(113, 110, 'Admin', 'Setting', 'password', '', 1, 1, '修改密码', '', '', 0),
(114, 113, 'Admin', 'Setting', 'password_post', '', 1, 0, '提交修改', '', '', 0),
(115, 109, 'Admin', 'Setting', 'site', '', 1, 1, '网站信息', '', '', 0),
(116, 115, 'Admin', 'Setting', 'site_post', '', 1, 0, '提交修改', '', '', 0),
(117, 115, 'Admin', 'Route', 'index', '', 1, 0, '路由列表', '', '', 0),
(118, 115, 'Admin', 'Route', 'add', '', 1, 0, '路由添加', '', '', 0),
(119, 118, 'Admin', 'Route', 'add_post', '', 1, 0, '路由添加提交', '', '', 0),
(120, 115, 'Admin', 'Route', 'edit', '', 1, 0, '路由编辑', '', '', 0),
(121, 120, 'Admin', 'Route', 'edit_post', '', 1, 0, '路由编辑提交', '', '', 0),
(122, 115, 'Admin', 'Route', 'delete', '', 1, 0, '路由删除', '', '', 0),
(123, 115, 'Admin', 'Route', 'ban', '', 1, 0, '路由禁止', '', '', 0),
(124, 115, 'Admin', 'Route', 'open', '', 1, 0, '路由启用', '', '', 0),
(125, 115, 'Admin', 'Route', 'listorders', '', 1, 0, '路由排序', '', '', 0),
(126, 109, 'Admin', 'Mailer', 'default', '', 1, 1, '邮箱配置', '', '', 0),
(127, 126, 'Admin', 'Mailer', 'index', '', 1, 1, 'SMTP配置', '', '', 0),
(128, 127, 'Admin', 'Mailer', 'index_post', '', 1, 0, '提交配置', '', '', 0),
(129, 126, 'Admin', 'Mailer', 'active', '', 1, 1, '注册邮件模板', '', '', 0),
(130, 129, 'Admin', 'Mailer', 'active_post', '', 1, 0, '提交模板', '', '', 0),
(131, 109, 'Admin', 'Setting', 'clearcache', '', 1, 1, '清除缓存', '', '', 1),
(132, 0, 'User', 'Indexadmin', 'default', '', 1, 1, '用户管理', 'group', '', 10),
(133, 132, 'User', 'Indexadmin', 'default1', '', 1, 1, '用户组', '', '', 0),
(134, 133, 'User', 'Indexadmin', 'index', '', 1, 1, '本站用户', 'leaf', '', 0),
(135, 134, 'User', 'Indexadmin', 'ban', '', 1, 0, '拉黑会员', '', '', 0),
(136, 134, 'User', 'Indexadmin', 'cancelban', '', 1, 0, '启用会员', '', '', 0),
(137, 133, 'User', 'Oauthadmin', 'index', '', 1, 0, '第三方用户', 'leaf', '', 0),
(138, 137, 'User', 'Oauthadmin', 'delete', '', 1, 0, '第三方用户解绑', '', '', 0),
(139, 132, 'User', 'Indexadmin', 'default3', '', 1, 1, '管理组', '', '', 0),
(140, 139, 'Admin', 'Rbac', 'index', '', 1, 1, '角色管理', '', '', 0),
(141, 140, 'Admin', 'Rbac', 'member', '', 1, 0, '成员管理', '', '', 1000),
(142, 140, 'Admin', 'Rbac', 'authorize', '', 1, 0, '权限设置', '', '', 1000),
(143, 142, 'Admin', 'Rbac', 'authorize_post', '', 1, 0, '提交设置', '', '', 0),
(144, 140, 'Admin', 'Rbac', 'roleedit', '', 1, 0, '编辑角色', '', '', 1000),
(145, 144, 'Admin', 'Rbac', 'roleedit_post', '', 1, 0, '提交编辑', '', '', 0),
(146, 140, 'Admin', 'Rbac', 'roledelete', '', 1, 1, '删除角色', '', '', 1000),
(147, 140, 'Admin', 'Rbac', 'roleadd', '', 1, 1, '添加角色', '', '', 1000),
(148, 147, 'Admin', 'Rbac', 'roleadd_post', '', 1, 0, '提交添加', '', '', 0),
(149, 139, 'Admin', 'User', 'index', '', 1, 1, '管理员', '', '', 0),
(150, 149, 'Admin', 'User', 'delete', '', 1, 0, '删除管理员', '', '', 1000),
(151, 149, 'Admin', 'User', 'edit', '', 1, 0, '管理员编辑', '', '', 1000),
(152, 151, 'Admin', 'User', 'edit_post', '', 1, 0, '编辑提交', '', '', 0),
(153, 149, 'Admin', 'User', 'add', '', 1, 0, '管理员添加', '', '', 1000),
(154, 153, 'Admin', 'User', 'add_post', '', 1, 0, '添加提交', '', '', 0),
(155, 47, 'Admin', 'Plugin', 'update', '', 1, 0, '插件更新', '', '', 0),
(156, 109, 'Admin', 'Storage', 'index', '', 1, 1, '文件存储', '', '', 0),
(157, 156, 'Admin', 'Storage', 'setting_post', '', 1, 0, '文件存储设置提交', '', '', 0),
(158, 54, 'Admin', 'Slide', 'ban', '', 1, 0, '禁用幻灯片', '', '', 0),
(159, 54, 'Admin', 'Slide', 'cancelban', '', 1, 0, '启用幻灯片', '', '', 0),
(160, 149, 'Admin', 'User', 'ban', '', 1, 0, '禁用管理员', '', '', 0),
(161, 149, 'Admin', 'User', 'cancelban', '', 1, 0, '启用管理员', '', '', 0),
(166, 127, 'Admin', 'Mailer', 'test', '', 1, 0, '测试邮件', '', '', 0),
(167, 109, 'Admin', 'Setting', 'upload', '', 1, 1, '上传设置', '', '', 0),
(168, 167, 'Admin', 'Setting', 'upload_post', '', 1, 0, '上传设置提交', '', '', 0),
(169, 7, 'Portal', 'AdminPost', 'copy', '', 1, 0, '文章批量复制', '', '', 0),
(174, 100, 'Admin', 'Menu', 'backup_menu', '', 1, 0, '备份菜单', '', '', 0),
(175, 100, 'Admin', 'Menu', 'export_menu_lang', '', 1, 0, '导出后台菜单多语言包', '', '', 0),
(176, 100, 'Admin', 'Menu', 'restore_menu', '', 1, 0, '还原菜单', '', '', 0),
(177, 100, 'Admin', 'Menu', 'getactions', '', 1, 0, '导入新菜单', '', '', 0),
(187, 0, 'Statis', 'Counts', 'index', '', 1, 1, '统计', '', '', 1),
(188, 187, 'Statis', 'User', 'index', '', 1, 1, '用户统计', '', '', 0),
(189, 0, 'Admin', 'BasicConfig', 'index', '', 1, 1, '基本配置', 'cogs', '', 0),
(190, 188, 'Statis', 'User', 'get_usersummary', '', 1, 0, '公众号用户', '', '', 0),
(191, 188, 'Statis', 'User', 'envelop_user', '', 1, 0, '本地红包用户统计', '', '', 0),
(192, 187, 'Statis', 'Money', 'index', '', 1, 1, '资金流动', '', '', 0),
(193, 0, 'Admin', 'Customer', 'index', '', 1, 1, '用户信息', 'group', '', 0),
(194, 192, 'Statis', 'Money', 'get_sum', '', 1, 0, '资金流动异步方法', '', '', 0),
(195, 0, 'Capital', 'Capital', 'index', '', 1, 1, '资金明细', '', '', 0),
(196, 195, 'Capital', 'Capital', 'pay', '', 1, 1, '支付明细', '', '', 0),
(197, 195, 'Capital', 'Capital', 'withdrawals', '', 1, 1, '提现明细', '', '', 0),
(198, 195, 'Capital', 'Capital', 'receive', '', 1, 1, '领取明细', '', '', 0),
(199, 0, 'Admin', 'Enve', 'index', '', 1, 1, '红包管理', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `hb_money_log`
--

CREATE TABLE IF NOT EXISTS `hb_money_log` (
  `id` int(11) unsigned NOT NULL,
  `pay_type` char(1) NOT NULL DEFAULT '1' COMMENT '支付类型 1微信支付',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `nonce_str` varchar(255) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '支付订单号',
  `out_trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '微信商户订单号',
  `amount` decimal(18,2) NOT NULL DEFAULT '0.00',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT '来源',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '资金流动说明',
  `pay_status` varchar(255) NOT NULL DEFAULT '' COMMENT '支付状态',
  `add_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hb_nav`
--

CREATE TABLE IF NOT EXISTS `hb_nav` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_nav_cat`
--

CREATE TABLE IF NOT EXISTS `hb_nav_cat` (
  `navcid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_oauth_user`
--

CREATE TABLE IF NOT EXISTS `hb_oauth_user` (
  `id` int(20) NOT NULL,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_options`
--

CREATE TABLE IF NOT EXISTS `hb_options` (
  `option_id` bigint(20) unsigned NOT NULL,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载'
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

--
-- 转存表中的数据 `hb_options`
--

INSERT INTO `hb_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(9, 'site_options', '{"site_name":"\\u534e\\u590f\\u5929\\u9a84","site_admin_url_password":"","site_tpl":"simplebootx","site_adminstyle":"flat","site_icp":"","site_admin_email":"","site_tongji":"","site_copyright":"","site_seo_title":"","site_seo_keywords":"","site_seo_description":"","urlmode":"1","html_suffix":"","comment_time_interval":"60"}', 1),
(10, 'cmf_settings', '{"banned_usernames":""}', 1),
(11, 'cdn_settings', '{"cdn_static_root":""}', 1),
(12, 'customer_options', '{"site_name":"\\u5305\\u4f60\\u8bf4\\u5fae\\u4fe1\\u53e3\\u4ee4\\u7ea2\\u5305\\u5c0f\\u7a0b\\u5e8f","site_icp":"\\u5b8c\\u7f8e\\u8fd0\\u8425\\u7248\\uff0c\\u4fee\\u590d\\u6240\\u6709BUG","site_tongji":"\\u4e13\\u4e1a\\u63d0\\u4f9b\\u5404\\u79cd\\u7cbe\\u54c1\\u5546\\u4e1a\\u6e90\\u7801\\uff0c\\u8054\\u7cfbQQ\\uff1a201855699","site_copyright":"\\u51fa\\u552e\\u5168\\u81ea\\u52a8\\u5f15\\u6d41\\u811a\\u672c\\uff0c\\u65e5\\u52a01000\\u7c89\\uff0c\\u8054\\u7cfbQQ\\uff1a201855699","G_APPID":"wx34e06eeca0438c8c","G_APPSECRET":"678c20d1da7b246408e8f0b740df55b6","G_MCHID":"1486890792","G_KEY":"r3R3fif0CvhgazkD1jmi95y6xaxFA7Rb","C_APPID":"wxfafde7c72b112e76","C_APPSECRET":"557a25212eda9c09ea515708dfd6fdcc","C_JUMP":"pages\\/index\\/index","new_tpl":"news_tpl_send : maCtOP96wLIi9ynCnHJ17DgcnQcvmHw9-v1WlkM9yHg,\\nnews_tpl_finish : 044zEgNwSPRBG_sL2Hy44QPH91kFH3R8lKoQIAUA1Gg,\\nnews_tpl_refund: XitxWZCwM29DZm87K1Ivw2r4-AIa8H2A-NbiF0qWwvQ","commision":"2","advcommision":"50","amount_min":"0.01","receive_amount_min":"0.01","min_withdrawals":"1","max_withdrawal_time":"1000000","title":"\\u5c0f\\u5a77\\u8d44\\u6e90\\u7f51","description":"QQ\\uff1a201855699","url":"http:\\/\\/www.010xr.com\\/"}', 1),
(14, 'wealthy_group_member', '["os2wg0bgV_yDWiWYUobUANZiEgcc","o6OJb5aEbYy4EbXDnaOke84eUUWo"]', 1),
(13, 'upload_setting', '{"image":{"upload_max_filesize":"10240","extensions":"jpg,jpeg,png,gif,bmp4"},"video":{"upload_max_filesize":"10240","extensions":"mp4,avi,wmv,rm,rmvb,mkv"},"audio":{"upload_max_filesize":"10240","extensions":"mp3,wma,wav,silk"},"file":{"upload_max_filesize":"10240","extensions":"txt,pdf,doc,docx,xls,xlsx,ppt,pptx,zip,rar"}}', 1);

-- --------------------------------------------------------

--
-- 表的结构 `hb_pay_log`
--

CREATE TABLE IF NOT EXISTS `hb_pay_log` (
  `id` int(11) unsigned NOT NULL,
  `pay_type` char(1) NOT NULL DEFAULT '1' COMMENT '支付类型 1微信支付 2余额支付  ',
  `transaction_id` varchar(32) NOT NULL DEFAULT '' COMMENT '微信商户订单',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：正常 1: 支付失败 2：支付异常',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '简述',
  `action` varchar(150) DEFAULT '' COMMENT '来源',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT 'log具体内容',
  `add_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `hb_plugins`
--

CREATE TABLE IF NOT EXISTS `hb_plugins` (
  `id` int(11) unsigned NOT NULL COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_posts`
--

CREATE TABLE IF NOT EXISTS `hb_posts` (
  `id` bigint(20) unsigned NOT NULL,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post发布日期',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核,3删除',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT '1' COMMENT 'post类型，1文章,2页面',
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_reuncash_log`
--

CREATE TABLE IF NOT EXISTS `hb_reuncash_log` (
  `id` int(11) unsigned NOT NULL,
  `pay_type` char(1) NOT NULL DEFAULT '1' COMMENT '支付类型 1微信支付',
  `transaction_id` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '微信商户订单',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：正常 1:退款成功 2：退款失败',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '简述',
  `action` varchar(150) DEFAULT '' COMMENT '来源',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT 'log具体内容',
  `add_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `hb_role`
--

CREATE TABLE IF NOT EXISTS `hb_role` (
  `id` int(11) unsigned NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色表';

--
-- 转存表中的数据 `hb_role`
--

INSERT INTO `hb_role` (`id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder`) VALUES
(6, 'index', NULL, 1, 'index', 1507794296, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `hb_role_user`
--

CREATE TABLE IF NOT EXISTS `hb_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_route`
--

CREATE TABLE IF NOT EXISTS `hb_route` (
  `id` int(11) NOT NULL COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_settings`
--

CREATE TABLE IF NOT EXISTS `hb_settings` (
  `key` varchar(20) NOT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hb_share_pic`
--

CREATE TABLE IF NOT EXISTS `hb_share_pic` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL COMMENT '红包id',
  `purl` varchar(255) DEFAULT NULL COMMENT '红包图片路径',
  `createtime` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hb_slide`
--

CREATE TABLE IF NOT EXISTS `hb_slide` (
  `slide_id` bigint(20) unsigned NOT NULL,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

--
-- 转存表中的数据 `hb_slide`
--

INSERT INTO `hb_slide` (`slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder`) VALUES
(1, 1, 'first', 'admin/20180204/5a767d8431199.jpg', 'http://www.010xr.com/', '', '', 1, 0),
(2, 1, 'second', 'admin/20180204/5a767d8431199.jpg', 'http://www.010xr.com/', '', '', 1, 0),
(3, 1, 'third', 'admin/20180204/5a767d8431199.jpg', 'http://www.010xr.com/', '', '', 1, 0),
(4, 2, '我收到的', 'admin/20180204/5a767d8431199.jpg', 'http://www.010xr.com/', '', '', 1, 0),
(5, 3, '我发出的', 'admin/20180204/5a767d8431199.jpg', 'http://www.010xr.com/', '', '', 1, 0),
(6, 4, '领取页面', 'admin/20180204/5a767d8431199.jpg', 'http://www.010xr.com/', '', '', 1, 0),
(7, 5, '分享页面', 'admin/20180204/5a767d8431199.jpg', 'http://www.010xr.com/', '', '', 1, 0),
(8, 6, '广场', 'admin/20180204/5a767d8431199.jpg', 'http://www.010xr.com/', '', '', 1, 0),
(9, 7, '提现', 'admin/20180204/5a767d8431199.jpg', 'http://www.010xr.com/', '', '', 1, 0),
(10, 8, '常见问题', 'admin/20180204/5a767d8431199.jpg', 'http://www.010xr.com/', '', '', 0, 0),
(11, 9, '个人中心', 'admin/20180204/5a767d8431199.jpg', 'http://www.010xr.com/', '', '', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `hb_slide_cat`
--

CREATE TABLE IF NOT EXISTS `hb_slide_cat` (
  `cid` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示'
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

--
-- 转存表中的数据 `hb_slide_cat`
--

INSERT INTO `hb_slide_cat` (`cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status`) VALUES
(1, '首页三张', 'index3', '', 1),
(2, '我收到的', 'myrecive', '', 1),
(3, '我发出的', 'mysend', '', 1),
(4, '红包领取页', 'hbdetail', '', 1),
(5, '分享页面', 'share', '', 1),
(6, '红包广场', 'hbsquare', '', 1),
(7, '提现页面', 'withdrawal', '', 1),
(8, '余额提现', 'cquestion', '', 1),
(9, '个人中心', 'user_center', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `hb_terms`
--

CREATE TABLE IF NOT EXISTS `hb_terms` (
  `term_id` bigint(20) unsigned NOT NULL COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_term_relationships`
--

CREATE TABLE IF NOT EXISTS `hb_term_relationships` (
  `tid` bigint(20) NOT NULL,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

--
-- 转存表中的数据 `hb_term_relationships`
--

INSERT INTO `hb_term_relationships` (`tid`, `object_id`, `term_id`, `listorder`, `status`) VALUES
(1, 1, 3, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `hb_theme`
--

CREATE TABLE IF NOT EXISTS `hb_theme` (
  `id` int(11) unsigned NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1王者  2搞怪 3中秋国庆',
  `quest` varchar(255) NOT NULL DEFAULT '' COMMENT '问题',
  `answer` varchar(255) NOT NULL DEFAULT '' COMMENT '答案',
  `difficult` char(10) NOT NULL DEFAULT '1' COMMENT '难度 0-100%'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `hb_upload`
--

CREATE TABLE IF NOT EXISTS `hb_upload` (
  `id` int(11) unsigned NOT NULL,
  `src` varchar(255) DEFAULT '' COMMENT '语音路径',
  `user_id` int(11) DEFAULT '0',
  `openid` varchar(35) DEFAULT '' COMMENT '微信小程序或者公共号openid',
  `add_time` int(10) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `hb_users`
--

CREATE TABLE IF NOT EXISTS `hb_users` (
  `id` bigint(20) unsigned NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `hb_users`
--

INSERT INTO `hb_users` (`id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type`, `coin`, `mobile`) VALUES
(1, 'admin', '###96239539b2aec88906027336b0a07a53', '新睿社区', '', '', NULL, 2, '1996-06-22', '', '223.96.238.63', '2018-02-04 11:26:26', '2000-01-01 00:00:00', '', 1, 0, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `hb_user_favorites`
--

CREATE TABLE IF NOT EXISTS `hb_user_favorites` (
  `id` int(11) NOT NULL,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- --------------------------------------------------------

--
-- 表的结构 `hb_withdrawals`
--

CREATE TABLE IF NOT EXISTS `hb_withdrawals` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `amount` decimal(10,2) NOT NULL,
  `appid` varchar(100) DEFAULT '' COMMENT '公众号的APPID',
  `openid` varchar(100) DEFAULT '' COMMENT '提现用户openid',
  `repeat_openid` varchar(100) DEFAULT '' COMMENT '重复收款用户OpenID',
  `check_name` varchar(80) DEFAULT '' COMMENT '校验用户姓名选项',
  `re_user_name` varchar(150) DEFAULT '' COMMENT '真是姓名',
  `id_card` varchar(100) DEFAULT '' COMMENT '身份证号',
  `pay_desc` varchar(255) DEFAULT '' COMMENT '付款说明',
  `err_code_des` varchar(255) DEFAULT '' COMMENT '错误信息',
  `nonce_str` varchar(32) DEFAULT '' COMMENT '随机字符',
  `partner_trade_no` varchar(100) NOT NULL DEFAULT '' COMMENT '单号',
  `spbill_create_ip` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT '' COMMENT '提款状态',
  `add_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `hb_wx_user`
--

CREATE TABLE IF NOT EXISTS `hb_wx_user` (
  `id` int(11) unsigned NOT NULL,
  `user_name` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `nick_name` varchar(100) NOT NULL DEFAULT '',
  `amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `frozen_amount` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '冻结余额',
  `session_key` varchar(80) DEFAULT NULL,
  `unionid` varchar(80) DEFAULT NULL,
  `openid` varchar(100) DEFAULT '' COMMENT '微信openId',
  `sex` char(1) NOT NULL DEFAULT '0',
  `coutry` varchar(255) NOT NULL DEFAULT '',
  `province` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `phone` char(15) NOT NULL DEFAULT '',
  `ip_addr` varchar(50) DEFAULT NULL,
  `update_time` int(11) DEFAULT '0' COMMENT '修改',
  `add_time` int(11) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  `show_adv` tinyint(1) DEFAULT '1' COMMENT '0关闭广告 1开启广告'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='微信用户表';

--
-- 转存表中的数据 `hb_wx_user`
--

INSERT INTO `hb_wx_user` (`id`, `user_name`, `head_img`, `nick_name`, `amount`, `frozen_amount`, `session_key`, `unionid`, `openid`, `sex`, `coutry`, `province`, `city`, `phone`, `ip_addr`, `update_time`, `add_time`, `status`, `show_adv`) VALUES
(1, 'M婷', 'https://wx.qlogo.cn/mmopen/vi_32/QYF2fM2z3k93YSQcRfg8Q3nz7Sibyh8Kd8CwZxHg9Marz0FoPYuqEJyBhh8y7LGa2t6C2zoTib11HjyABpQYSZtA/0', 'M婷', '36.79', '0.00', NULL, '', 'o7AX94xrGgZjtHXklbHFsDprjmmc', '2', 'China', 'Shanghai', 'Jiading', '', '113.129.145.158', 1517714519, 1517713961, '0', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hb_ad`
--
ALTER TABLE `hb_ad`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `ad_name` (`ad_name`) USING BTREE;

--
-- Indexes for table `hb_asset`
--
ALTER TABLE `hb_asset`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `hb_auth_access`
--
ALTER TABLE `hb_auth_access`
  ADD KEY `role_id` (`role_id`) USING BTREE,
  ADD KEY `rule_name` (`rule_name`) USING BTREE;

--
-- Indexes for table `hb_auth_rule`
--
ALTER TABLE `hb_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`,`status`,`type`) USING BTREE;

--
-- Indexes for table `hb_comments`
--
ALTER TABLE `hb_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_post_ID` (`post_id`) USING BTREE,
  ADD KEY `comment_approved_date_gmt` (`status`) USING BTREE,
  ADD KEY `comment_parent` (`parentid`) USING BTREE,
  ADD KEY `table_id_status` (`post_table`,`post_id`,`status`) USING BTREE,
  ADD KEY `createtime` (`createtime`) USING BTREE;

--
-- Indexes for table `hb_common_action_log`
--
ALTER TABLE `hb_common_action_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_object_action` (`user`,`object`,`action`) USING BTREE,
  ADD KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`) USING BTREE;

--
-- Indexes for table `hb_enve`
--
ALTER TABLE `hb_enve`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`) USING BTREE COMMENT '用户id';

--
-- Indexes for table `hb_enve_receive`
--
ALTER TABLE `hb_enve_receive`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`pid`) USING BTREE COMMENT '用户id';

--
-- Indexes for table `hb_guestbook`
--
ALTER TABLE `hb_guestbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_links`
--
ALTER TABLE `hb_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_status`) USING BTREE;

--
-- Indexes for table `hb_menu`
--
ALTER TABLE `hb_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `parentid` (`parentid`) USING BTREE,
  ADD KEY `model` (`model`) USING BTREE;

--
-- Indexes for table `hb_money_log`
--
ALTER TABLE `hb_money_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_nav`
--
ALTER TABLE `hb_nav`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_nav_cat`
--
ALTER TABLE `hb_nav_cat`
  ADD PRIMARY KEY (`navcid`);

--
-- Indexes for table `hb_oauth_user`
--
ALTER TABLE `hb_oauth_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_options`
--
ALTER TABLE `hb_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`) USING BTREE;

--
-- Indexes for table `hb_pay_log`
--
ALTER TABLE `hb_pay_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_plugins`
--
ALTER TABLE `hb_plugins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_posts`
--
ALTER TABLE `hb_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`) USING BTREE,
  ADD KEY `post_parent` (`post_parent`) USING BTREE,
  ADD KEY `post_author` (`post_author`) USING BTREE,
  ADD KEY `post_date` (`post_date`) USING BTREE;

--
-- Indexes for table `hb_reuncash_log`
--
ALTER TABLE `hb_reuncash_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_role`
--
ALTER TABLE `hb_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentId` (`pid`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `hb_role_user`
--
ALTER TABLE `hb_role_user`
  ADD KEY `group_id` (`role_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `hb_route`
--
ALTER TABLE `hb_route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_settings`
--
ALTER TABLE `hb_settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `hb_share_pic`
--
ALTER TABLE `hb_share_pic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_slide`
--
ALTER TABLE `hb_slide`
  ADD PRIMARY KEY (`slide_id`),
  ADD KEY `slide_cid` (`slide_cid`) USING BTREE;

--
-- Indexes for table `hb_slide_cat`
--
ALTER TABLE `hb_slide_cat`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `cat_idname` (`cat_idname`) USING BTREE;

--
-- Indexes for table `hb_terms`
--
ALTER TABLE `hb_terms`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `hb_term_relationships`
--
ALTER TABLE `hb_term_relationships`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `term_taxonomy_id` (`term_id`) USING BTREE;

--
-- Indexes for table `hb_theme`
--
ALTER TABLE `hb_theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_upload`
--
ALTER TABLE `hb_upload`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_users`
--
ALTER TABLE `hb_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_login_key` (`user_login`) USING BTREE,
  ADD KEY `user_nicename` (`user_nicename`) USING BTREE;

--
-- Indexes for table `hb_user_favorites`
--
ALTER TABLE `hb_user_favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`) USING BTREE;

--
-- Indexes for table `hb_withdrawals`
--
ALTER TABLE `hb_withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hb_wx_user`
--
ALTER TABLE `hb_wx_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `openId` (`openid`) USING BTREE COMMENT 'openId';

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hb_ad`
--
ALTER TABLE `hb_ad`
  MODIFY `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hb_asset`
--
ALTER TABLE `hb_asset`
  MODIFY `aid` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hb_auth_rule`
--
ALTER TABLE `hb_auth_rule`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `hb_comments`
--
ALTER TABLE `hb_comments`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hb_common_action_log`
--
ALTER TABLE `hb_common_action_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hb_enve`
--
ALTER TABLE `hb_enve`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `hb_enve_receive`
--
ALTER TABLE `hb_enve_receive`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `hb_guestbook`
--
ALTER TABLE `hb_guestbook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hb_links`
--
ALTER TABLE `hb_links`
  MODIFY `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `hb_menu`
--
ALTER TABLE `hb_menu`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=200;
--
-- AUTO_INCREMENT for table `hb_money_log`
--
ALTER TABLE `hb_money_log`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hb_nav`
--
ALTER TABLE `hb_nav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hb_nav_cat`
--
ALTER TABLE `hb_nav_cat`
  MODIFY `navcid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hb_oauth_user`
--
ALTER TABLE `hb_oauth_user`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hb_options`
--
ALTER TABLE `hb_options`
  MODIFY `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `hb_pay_log`
--
ALTER TABLE `hb_pay_log`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `hb_plugins`
--
ALTER TABLE `hb_plugins`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id';
--
-- AUTO_INCREMENT for table `hb_posts`
--
ALTER TABLE `hb_posts`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hb_reuncash_log`
--
ALTER TABLE `hb_reuncash_log`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hb_role`
--
ALTER TABLE `hb_role`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `hb_route`
--
ALTER TABLE `hb_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id';
--
-- AUTO_INCREMENT for table `hb_share_pic`
--
ALTER TABLE `hb_share_pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `hb_slide`
--
ALTER TABLE `hb_slide`
  MODIFY `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `hb_slide_cat`
--
ALTER TABLE `hb_slide_cat`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `hb_terms`
--
ALTER TABLE `hb_terms`
  MODIFY `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id';
--
-- AUTO_INCREMENT for table `hb_term_relationships`
--
ALTER TABLE `hb_term_relationships`
  MODIFY `tid` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `hb_theme`
--
ALTER TABLE `hb_theme`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hb_upload`
--
ALTER TABLE `hb_upload`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=156;
--
-- AUTO_INCREMENT for table `hb_users`
--
ALTER TABLE `hb_users`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `hb_user_favorites`
--
ALTER TABLE `hb_user_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hb_withdrawals`
--
ALTER TABLE `hb_withdrawals`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hb_wx_user`
--
ALTER TABLE `hb_wx_user`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
