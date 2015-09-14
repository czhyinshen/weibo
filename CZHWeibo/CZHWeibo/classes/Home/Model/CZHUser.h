//
//  CZHUser.h
//  CZHWeibo
//
//  Created by 陈志辉 on 15/9/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZHUser : NSObject

@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *idstr;
@property (nonatomic,strong)NSString *profile_image_url;

@property (nonatomic,strong)NSString * avatar_large;
/**
 *  是否是Vip
 */
/*会员类型**/
@property (nonatomic,assign) int mbtype;
/*会员等级**/
@property (nonatomic,assign) int mbrank;

@end

/*
 
 返回值字段	字段类型	字段说明
 id	int64	用户UID
 idstr	string	字符串型的用户UID
 screen_name	string	用户昵称
 name	string	友好显示名称
 province	int	用户所在省级ID
 city	int	用户所在城市ID
 location	string	用户所在地
 description	string	用户个人描述
 url	string	用户博客地址
 profile_image_url	string	用户头像地址（中图），50×50像素
 profile_url	string	用户的微博统一URL地址
 domain	string	用户的个性化域名
 weihao	string	用户的微号
 gender	string	性别，m：男、f：女、n：未知
 followers_count	int	粉丝数
 friends_count	int	关注数
 statuses_count	int	微博数
 favourites_count	int	收藏数
 created_at	string	用户创建（注册）时间
 following	boolean	暂未支持
 allow_all_act_msg	boolean	是否允许所有人给我发私信，true：是，false：否
 geo_enabled	boolean	是否允许标识用户的地理位置，true：是，false：否
 verified	boolean	是否是微博认证用户，即加V用户，true：是，false：否
 verified_type	int	暂未支持
 remark	string	用户备注信息，只有在查询用户关系时才返回此字段
 status	object	用户的最近一条微博信息字段 详细
 allow_all_comment	boolean	是否允许所有人对我的微博进行评论，true：是，false：否
 avatar_large	string	用户头像地址（大图），180×180像素
 avatar_hd	string	用户头像地址（高清），高清头像原图
 verified_reason	string	认证原因
 follow_me	boolean	该用户是否关注当前登录用户，true：是，false：否
 online_status	int	用户的在线状态，0：不在线、1：在线
 bi_followers_count	int	用户的互粉数
 lang	string	用户当前的语言版本，zh-cn：简体中文，zh-tw：繁体中文，en：英语
 
 ---------------------------------------- ---------------------------------------- ----------------------------------------
 "allow_all_act_msg" = 1;
 "allow_all_comment" = 1;
 "avatar_hd" = "http://tp4.sinaimg.cn/2671109275/180/5667209124/0";
 "avatar_large" = "http://tp4.sinaimg.cn/2671109275/180/5667209124/0";
 "bi_followers_count" = 1463;
 "block_app" = 1;
 "block_word" = 0;
 cardid = "star_005";
 city = 8;
 class = 1;
 "created_at" = "Wed Mar 21 10:31:42 +0800 2012";
 "credit_score" = 80;
 description = "\U6559\U6388\U65b0\U624b\U4f7f\U7528\U5fae\U535a\U65b9\U6cd5\U4e13\U4e1a\U6237\Uff0c\U6bcf\U5929\U63a8\U8350\U65b9\U6cd5\U4ecb\U7ecd\U3001\U5fae\U535a\U70ed\U70b9...\U6709\U95ee\U9898\U8bf7call\U6211\Uff0c@\U3001\U79c1\U4fe1\U90fd\U53ef\U4ee5\Uff0c\U6b22\U8fce\U9a9a\U6270~";
 domain = "";
 "favourites_count" = 2351;
 "follow_me" = 0;
 "followers_count" = 115835997;
 following = 1;
 "friends_count" = 1902;
 gender = f;
 "geo_enabled" = 1;
 id = 2671109275;
 idstr = 2671109275;
 lang = "zh-cn";
 location = "\U5317\U4eac \U6d77\U6dc0\U533a";
 mbrank = 6;
 mbtype = 12;
 name = "\U65b0\U624b\U6307\U5357";
 "online_status" = 0;
 "pagefriends_count" = 30;
 "profile_image_url" = "http://tp4.sinaimg.cn/2671109275/50/5667209124/0";
 "profile_url" = "u/2671109275";
 province = 11;
 ptype = 0;
 remark = "";
 "screen_name" = "\U65b0\U624b\U6307\U5357";
 star = 0;
 "statuses_count" = 9380;
 urank = 27;
 url = "http://www.weibo.com/guide/handbook";
 "user_ability" = 0;
 verified = 1;
 "verified_contact_email" = "";
 "verified_contact_mobile" = "";
 "verified_contact_name" = "";
 "verified_level" = 3;
 "verified_reason" = "\U65b0\U6d6a\U5fae\U535a\U65b0\U624b\U6307\U5357\U5b98\U65b9\U5fae\U535a";
 "verified_reason_modified" = "";
 "verified_reason_url" = "";
 "verified_source" = "";
 "verified_source_url" = "";
 "verified_state" = 0;
 "verified_trade" = "";
 "verified_type" = 7;
 weihao = "";
 */
