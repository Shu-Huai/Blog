-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: mysql.lvshuhuai.cn    Database: my_blog_db
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `generator_test`
--

DROP TABLE IF EXISTS `generator_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generator_test` (
                                  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
                                  `test` varchar(100) NOT NULL COMMENT '测试字段',
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generator_test`
--

LOCK TABLES `generator_test` WRITE;
/*!40000 ALTER TABLE `generator_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `generator_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jdbc_test`
--

DROP TABLE IF EXISTS `jdbc_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jdbc_test` (
                             `type` varchar(100) DEFAULT NULL COMMENT '类型',
                             `name` varchar(100) DEFAULT NULL COMMENT '名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jdbc_test`
--

LOCK TABLES `jdbc_test` WRITE;
/*!40000 ALTER TABLE `jdbc_test` DISABLE KEYS */;
INSERT INTO `jdbc_test` VALUES ('com.zaxxer.hikari.HikariDataSource','hikari数据源'),('org.apache.commons.dbcp2.BasicDataSource','dbcp2数据源'),('test','测试类'),('类别2','测试类2');
/*!40000 ALTER TABLE `jdbc_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_admin_user`
--

DROP TABLE IF EXISTS `tb_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_admin_user` (
                                 `admin_user_id` int NOT NULL AUTO_INCREMENT COMMENT '管理员id',
                                 `login_user_name` varchar(50) NOT NULL COMMENT '管理员登陆名称',
                                 `login_password` varchar(50) NOT NULL COMMENT '管理员登陆密码',
                                 `nick_name` varchar(50) NOT NULL COMMENT '管理员显示昵称',
                                 `locked` tinyint DEFAULT '0' COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
                                 PRIMARY KEY (`admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admin_user`
--

LOCK TABLES `tb_admin_user` WRITE;
/*!40000 ALTER TABLE `tb_admin_user` DISABLE KEYS */;
INSERT INTO `tb_admin_user` VALUES (1,'lvzhihe_123@qq.com','5a31893be1b474502a046e74841e119b','殊怀丶',0);
/*!40000 ALTER TABLE `tb_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blog`
--

DROP TABLE IF EXISTS `tb_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog` (
                           `blog_id` bigint NOT NULL AUTO_INCREMENT COMMENT '博客表主键id',
                           `blog_title` varchar(200) NOT NULL COMMENT '博客标题',
                           `blog_sub_url` varchar(200) NOT NULL COMMENT '博客自定义路径url',
                           `blog_cover_image` varchar(200) NOT NULL COMMENT '博客封面图',
                           `blog_content` mediumtext NOT NULL COMMENT '博客内容',
                           `blog_category_id` int NOT NULL COMMENT '博客分类id',
                           `blog_category_name` varchar(50) NOT NULL COMMENT '博客分类(冗余字段)',
                           `blog_tags` varchar(200) NOT NULL COMMENT '博客标签',
                           `blog_status` tinyint NOT NULL DEFAULT '0' COMMENT '0-草稿 1-发布',
                           `blog_views` bigint NOT NULL DEFAULT '0' COMMENT '阅读量',
                           `enable_comment` tinyint NOT NULL DEFAULT '0' COMMENT '0-允许评论 1-不允许评论',
                           `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
                           `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                           PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog`
--

LOCK TABLES `tb_blog` WRITE;
/*!40000 ALTER TABLE `tb_blog` DISABLE KEYS */;
INSERT INTO `tb_blog` VALUES (5,'Git','','http://localhost:28083/admin/dist/img/rand/logo.png','# Git\n\n## 安装Git\n\n### 设置名字、邮箱\n\n```shell\n$ git config --global user.name \"Your Name\"\n$ git config --global user.email \"email@example.com\"\n```\n\n### 创建版本库（repository）\n\n1. 创建空目录\n   ```shell\n   $ mkdir <repo name>\n   $ cd <repo name>\n   ```\n2. 把这个目录变成Git可以管理的仓库\n   ```shell\n   $ git init\n   ```\n\n## 基本概念\n\n### 散列值\n\n根据文件内容及元数据计算出来的40位16进制数\n\n### Git的核心是一个对象数据库\n\n## 版本库\n\n### 插入到对象数据库\n\n```shell\n$ git hash-object -w <filename>\n```\n\n### 访问对象\n\n```shell\n$ git cat-file -p <id>\n```\n\n### Blob与Tree\n\n![Blob与Tree](http://public.file.lvshuhuai.cn/图床/Blob与Tree.png \"Blob与Tree\")\n\n### 节省空间\n\nGit对于相同的文件内容只存储一次，即时文件名不同。\n可以使用gc命令增量地存储文件。\n\n## 文件操作\n\n### 添加文件\n\n把文件往Git版本库里添加的时候，是分两步执行的：\n\n- 第一步是用git add把文件添加进去，实际上就是把文件修改添加到暂存区；\n- 第二步是用git commit提交更改，实际上就是把暂存区的所有内容提交到当前分支。\n\n1. 将工作区文件添加到暂存区\n   ```shell\n   $ git add <filename>\n   $ git add --all\n   ```\n2. 将暂存区文件添加到本地仓库\n   ```shell\n   $ git commit -m <message>\n   ```\n\n### 查看信息\n\n#### 查看仓库当前状态\n\n```shell\n$ git status\n```\n\n会显示被提交的更改，不会被更新的更改，未被跟踪的文件\n\n#### 查看版本库的完整性\n\n通过散列值检验：\n\n```shell\n$ git fsck\n```\n\n如果内容与散列值不匹配发出错误报告：\n\n```shell\nerror: shal mismatch <id>\nerror: <id>\nobject corrupt or missing\n```\n\n#### 查看文件修改\n\n查看工作区和版本库里文件的区别：\n\n```shell\n$ git diff <id>\n$ git diff HEAD -- <id> \n```\n\n与上一次提交比较：\n\n```shell\n$ git diff <id>^!\n```\n\n显示每个文件中的修改数量：\n\n```shell\n$ git diff --stat <id> <id>\n```\n\n显示暂存区与版本库的不同，也就是暂存区中的东西：\n\n```shell\n$ git diff --staged # staging vs. repository\n```\n\n显示暂存区与工作区的不同，也就是工作区中东西：\n\n```shell\n$ git diff # staging vs. workplace\n```\n\n#### 查看历史\n\n简单显示：\n\n```shell\n$ git log\n```\n\n显示细节：\n\n```shell\n$ git log --format=fuller\n```\n\n每个提交显示一行：\n\n```shell\n$ git log --oneline\n```\n\n只显示最近3个提交：\n\n```shell\n$ git log -n 3\n```\n\n显示被修改的文件：\n\n```shell\n$ git log --stat --oneline\n```\n\n显示有多少文件被修改：\n\n```shell\n$ git log --shortstat --oneline\n```\n\n显示包含被修改的文件的目录：\n\n```shell\n$ git log --dirstat --oneline\n```\n\n显示各提交之间的关系：\n\n```shell\n$ git log --graph --oneline\n```\n\n### 修改文件\n\n#### 退回上一版本\n\n```shell\n$ git reset --hard HEAD^\n```\n\n上一个版本就是HEAD^，上上一个版本就是HEAD^^，当然往上100个版本写100个^比较容易数不过来，所以写成HEAD~100。\n\n#### 退回某一版本\n\n```shell\n$ git reset --hard <id>\n```\n\n#### 显示所有历史命令\n\n```shell\n$ git reflog\n```\n\n#### 清除工作区的修改\n\n```shell\n$ git checkout -- <filename>\n```\n\n实质：用版本库里的版本替换工作区的版本\n\n#### 清除暂存区的修改\n\n```shell\n$ git reset HEAD <id>\n```\n\n#### 从工作区中删除文件\n\n```shell\n$ rm <filename>\n```\n\n#### 从版本库中删除文件\n\n```shell\n$ git rm <filename>\n```\n\n别忘了git commit\n\n#### 储藏\n\n将某项修改存储在本地，先不提交这个修改，日后再来处理\n\n保存修改：\n\n```shell\n$ git stash\n```\n\n查看存储栈：\n\n```shell\n$ git stash list\n```\n\n恢复储藏栈顶的修改：\n\n```shell\n$ git stash pop\n```\n\n恢复刚早之前所储藏的修改：\n\n```shell\n$ git stash pop stash@{1}\n```\n\n## 远程仓库操作\n\n### 创建SSH Key\n\n```shell\n$ ssh-keygen -t rsa -C \"youremail@example.com\"\n```\n\n可以在用户主目录里找到.ssh目录，里面有id_rsa和id_rsa.pub两个文件，这两个就是SSH Key的秘钥对，id_rsa是私钥，不能泄露出去，id_rsa.pub是公钥，可以放心地告诉任何人\n\n### 关联远程仓库\n\n```shell\n$ git remote add origin git@github.com:GitHub-name/Repo-name.git\n```\n\n### 初次推送\n\n```shell\n$ git push -u origin master\n```\n\n### 将本地库推送至远程库\n\n```shell\n$ git push origin master\n```\n\n若要强制推送覆盖远程文件\n\n```shell\n$ git push -f origin master\n```\n\n### 将远程库克隆至本地库\n\n```shell\n$ git clone git@github.com:GitHub-name/Repo-name.git\n```\n\n## 分支操作\n\n分支共有5种类型\n\n1. master，最终发布版本，整个项目中有且只有一个\n2. develop，项目的开发分支，原则上项目中有且只有一个\n3. feature，功能分支，用于开发一个新的功能\n4. release，预发布版本，介于develop和master之间的一个版本，主要用于测试\n5. hotfix，修复补丁，用于修复master上的bug，直接作用于master\n\n### 创建并切换到新的分支\n\n```shell\n$ git switch -c <name>\n```\n\n### 创建新的分支\n\n```shell\n$ git branch <name>\n```\n\n### 切换到已有的分支\n\n```shell\n$ git switch <name>\n```\n\n### 查看分支\n\n```shell\n$ git branch\n```\n\n### 合并某分支到当前分支\n\n```shell\n$ git merge <name>\n```\n\n### 删除分支\n\n```shell\n$ git branch -d <name>\n```\n\n若要强行删除\n\n```shell\n$ git branch -D <name>\n```\n\n### 查看分支的合并情况\n\n```shell\n$ git log --graph --pretty=oneline --abbrev-commit\n```\n\n### 分支策略\n\n在实际开发中，我们应该按照几个基本原则进行分支管理：\n\n首先，master分支应该是非常稳定的，也就是仅用来发布新版本，平时不能在上面干活；\n\n那在哪干活呢？干活都在dev分支上，也就是说，dev分支是不稳定的，到某个时候，比如1.0版本发布时，再把dev分支合并到master上，在master分支发布1.0版本；\n\n你和你的小伙伴们每个人都在dev分支上干活，每个人都有自己的分支，时不时地往dev分支上合并就可以了。\n所以，团队合作的分支看起来就像这样：\n![团队合作分支](http://public.file.lvshuhuai.cn/图床/团队合作分支.png \"团队合作分支\")\n\n### 暂存工作现场\n\n```shell\n$ git stash\n```\n\n### 查看暂存的工作现场\n\n```shell\n$ git stash list\n```\n\n### 恢复暂存现场\n\n```shell\n$ git stash pop\n```\n\n若要恢复指定的stash\n\n```shell\n$ git stash apply stash@{0}\n```\n\n### 复制一个特定的提交到当前分支\n\n```shell\n$ git cherry-pick <id>\n```\n\n### 整理分支\n\n```shell\n$ git rebase\n```\n\nrebase操作可以把本地未push的分叉提交历史整理成直线\nrebase的目的是使得我们在查看历史提交的变化时更容易，因为分叉的提交需要三方对比\n\n## 多人协作\n\n### 查看远程库的信息\n\n```shell\n$ git remote\n```\n\n若要查看更详细的信息\n\n```shell\n$ git remote -v\n```\n\n### 推送分支\n\n```shell\n$ git push origin <branch-name>\n```\n\n### 在本地创建和远程分支对应的分支\n\n```shell\n$ git checkout -b <branch-name> origin/<branch-name>\n```\n\n分支名字最好一样\n\n### 将远程库最新的提交抓下来\n\n```shell\n$ git pull\n```\n\n若提示no tracking information，则说明本地分支和远程分支的链接关系没有创建，用命令`$ git branch --set-upstream-to <branch-name> origin/<branch-name>`或`$ git pull origin <branch-name>`\n\n### 主要步骤\n\n多人协作的工作模式通常是这样：\n\n1. 首先，可以试图用 `git push origin <branch-name>`推送自己的修改；\n2. 如果推送失败，则因为远程分支比你的本地更新，需要先用git pull试图合并；\n3. 如果合并有冲突，则解决冲突，并在本地提交；\n4. 没有冲突或者解决掉冲突后，再用`git push origin <branch-name>`推送就能成功！\n\n## 标签操作\n\n### 创建标签\n\n切换到需要打标签的分支上\n```shell\n$ git tag `<tag-name>`\n```\n\n若要根据commit id打标签\n```shell\n$ git tag `<tag-name>` `<id>`\n```\n\n若要创建带有说明的标签\n```shell\n$ git tag -a `<tag-name>` -m \"message\" `<id>`\n```\n\n### 查看标签\n\n```shell\n$ git tag\n```\n\n### 查看标签详细信息\n\n```shell\n$ git show `<tag-name>`\n```\n\n### 删除标签\n\n```shell\n$ git tag -d `<tag-name>`\n```\n\n若要删除远程库标签，先从本地删除，然后\n```shell\n$ git push origin :refs/tags/`<tag-name>`\n```\n\n### 推送标签至远程库\n\n```shell\n$ git push origin `<tag-name>`\n```\n\n若要一次性全部推送\n```shell\n$ git push origin --tags\n```\n\n## 自定义\n\n### 显示更丰富的颜色\n\n```shell\n$ git config --global color.ui true\n```\n\n### 配置别名\n\n```shell\n$ git config --global alias.`<simple-name>` `<origin-name>`\n```\n\n### 忽略特殊文件\n\n```shell\n$ touch .gitignore\n```\n\n或直接创建一个.gitignore文件\n\n别忘了提交.gitignore\n\n### 删除仓库\n\n```shell\n$ rm .git -rf\n```\n\n### 解决Git命令中文显示乱码的问题（\\273\\223）\n\n```shell\n$ git config --global core.quotepath false\n```',25,'语法笔记','笔记,语法',1,1,0,0,'2023-05-11 15:37:09','2023-05-11 15:37:09');
/*!40000 ALTER TABLE `tb_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blog_category`
--

DROP TABLE IF EXISTS `tb_blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog_category` (
                                    `category_id` int NOT NULL AUTO_INCREMENT COMMENT '分类表主键',
                                    `category_name` varchar(50) NOT NULL COMMENT '分类的名称',
                                    `category_icon` varchar(50) NOT NULL COMMENT '分类的图标',
                                    `category_rank` int NOT NULL DEFAULT '1' COMMENT '分类的排序值 被使用的越多数值越大',
                                    `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog_category`
--

LOCK TABLES `tb_blog_category` WRITE;
/*!40000 ALTER TABLE `tb_blog_category` DISABLE KEYS */;
INSERT INTO `tb_blog_category` VALUES (25,'语法笔记','/admin/dist/img/category/09.png',3,0,'2023-05-11 15:37:30');
/*!40000 ALTER TABLE `tb_blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blog_comment`
--

DROP TABLE IF EXISTS `tb_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog_comment` (
                                   `comment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
                                   `blog_id` bigint NOT NULL DEFAULT '0' COMMENT '关联的blog主键',
                                   `commentator` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者名称',
                                   `email` varchar(100) NOT NULL DEFAULT '' COMMENT '评论人的邮箱',
                                   `website_url` varchar(50) NOT NULL DEFAULT '' COMMENT '网址',
                                   `comment_body` varchar(200) NOT NULL DEFAULT '' COMMENT '评论内容',
                                   `comment_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论提交时间',
                                   `commentator_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '评论时的ip地址',
                                   `reply_body` varchar(200) NOT NULL DEFAULT '' COMMENT '回复内容',
                                   `reply_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
                                   `comment_status` tinyint NOT NULL DEFAULT '0' COMMENT '是否审核通过 0-未审核 1-审核通过',
                                   `is_deleted` tinyint DEFAULT '0' COMMENT '是否删除 0-未删除 1-已删除',
                                   PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog_comment`
--

LOCK TABLES `tb_blog_comment` WRITE;
/*!40000 ALTER TABLE `tb_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blog_tag`
--

DROP TABLE IF EXISTS `tb_blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog_tag` (
                               `tag_id` int NOT NULL AUTO_INCREMENT COMMENT '标签表主键id',
                               `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
                               `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0=否 1=是',
                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                               PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog_tag`
--

LOCK TABLES `tb_blog_tag` WRITE;
/*!40000 ALTER TABLE `tb_blog_tag` DISABLE KEYS */;
INSERT INTO `tb_blog_tag` VALUES (134,'笔记',0,'2023-05-11 15:37:09'),(135,'语法',0,'2023-05-11 15:37:09');
/*!40000 ALTER TABLE `tb_blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_blog_tag_relation`
--

DROP TABLE IF EXISTS `tb_blog_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_blog_tag_relation` (
                                        `relation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '关系表id',
                                        `blog_id` bigint NOT NULL COMMENT '博客id',
                                        `tag_id` int NOT NULL COMMENT '标签id',
                                        `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
                                        PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_blog_tag_relation`
--

LOCK TABLES `tb_blog_tag_relation` WRITE;
/*!40000 ALTER TABLE `tb_blog_tag_relation` DISABLE KEYS */;
INSERT INTO `tb_blog_tag_relation` VALUES (283,5,134,'2023-05-11 15:57:08'),(284,5,135,'2023-05-11 15:57:08');
/*!40000 ALTER TABLE `tb_blog_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_config`
--

DROP TABLE IF EXISTS `tb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_config` (
                             `config_name` varchar(100) NOT NULL DEFAULT '' COMMENT '配置项的名称',
                             `config_value` varchar(200) NOT NULL DEFAULT '' COMMENT '配置项的值',
                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
                             PRIMARY KEY (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_config`
--

LOCK TABLES `tb_config` WRITE;
/*!40000 ALTER TABLE `tb_config` DISABLE KEYS */;
INSERT INTO `tb_config` VALUES ('footerAbout','殊怀丶博客','2018-11-11 20:33:23','2023-05-11 07:48:26'),('footerCopyRight','殊怀丶','2018-11-11 20:33:31','2023-05-11 07:48:26'),('footerICP','','2018-11-11 20:33:27','2018-11-12 11:58:06'),('footerPoweredBy','http://lvshuhuai.cn/','2018-11-11 20:33:36','2023-05-11 07:48:26'),('footerPoweredByURL','http://lvshuhuai.cn/','2018-11-11 20:33:39','2023-05-11 07:48:26'),('websiteDescription','','2018-11-11 20:33:04','2023-05-11 07:43:22'),('websiteIcon','/admin/dist/img/logo.png','2018-11-11 20:33:11','2023-05-11 07:43:22'),('websiteLogo','/admin/dist/img/logo.png','2018-11-11 20:33:08','2023-05-11 07:43:22'),('websiteName','殊怀丶博客','2018-11-11 20:33:01','2023-05-11 07:43:22'),('yourAvatar','/admin/dist/img/logo.png','2018-11-11 20:33:14','2023-05-11 07:43:21'),('yourEmail','lvzhihe_123@qq.com','2018-11-11 20:33:17','2023-05-11 07:43:21'),('yourName','殊怀丶','2018-11-11 20:33:20','2023-05-11 07:43:21');
/*!40000 ALTER TABLE `tb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_link`
--

DROP TABLE IF EXISTS `tb_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_link` (
                           `link_id` int NOT NULL AUTO_INCREMENT COMMENT '友链表主键id',
                           `link_type` tinyint NOT NULL DEFAULT '0' COMMENT '友链类别 0-友链 1-推荐 2-个人网站',
                           `link_name` varchar(50) NOT NULL COMMENT '网站名称',
                           `link_url` varchar(100) NOT NULL COMMENT '网站链接',
                           `link_description` varchar(100) NOT NULL COMMENT '网站描述',
                           `link_rank` int NOT NULL DEFAULT '0' COMMENT '用于列表排序',
                           `is_deleted` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除 0-未删除 1-已删除',
                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
                           PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_link`
--

LOCK TABLES `tb_link` WRITE;
/*!40000 ALTER TABLE `tb_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_test`
--

DROP TABLE IF EXISTS `tb_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_test` (
                           `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
                           `test_info` varchar(50) NOT NULL COMMENT '测试内容',
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_test`
--

LOCK TABLES `tb_test` WRITE;
/*!40000 ALTER TABLE `tb_test` DISABLE KEYS */;
INSERT INTO `tb_test` VALUES (1,'SpringBoot-MyBatis测试');
/*!40000 ALTER TABLE `tb_test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-11 16:17:02
