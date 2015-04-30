#!/usr/bin/env ruby
# encoding: utf-8

#=begin
# 酒店

首页的吊起
1.webapp：http://map.baidu.com/mobile/webapp/place/hotelzt/c=131&hidenav=1&hidefooter=1&locMC=12948047.315804|4845092.992634&third_party=xxx&cuid=E712FF971F2C481364204D2EEE9F08F1|573244420301468&resid=03&src_from=xxx
静态参数：hidenav=1 , hidefooter=1 ,  resid=03
其余所有为动态参数。
 
2.android na插件
http://map.baidu.com/mobile/webapp/place/hotelzt/c=131&hidenav=1&hidefooter=1&locMC=12948047.315804|4845092.992634&third_party=xxx&cuid=E712FF971F2C481364204D2EEE9F08F1|573244420301468&resid=03&com_dispatch_param={"target":"hotel_search_channel_from_wise","resid":"03"}&src_from=xxx
 
静态参数：hidenav=1 , hidefooter=1 ,  resid=03 ， com_dispatch_param={"target":"hotel_search_channel_from_wise","resid":"03"}
其余为所有为动态参数。
注：对此协议进行了修改，请以此协议为准
 
 
3. iOS na 插件http://map.baidu.com/mobile/webapp/place/hotelzt/test=test&c=131&hidenav=1&hidefooter=1&locMC=12948047.315804|4845092.992634
&third_party=xxx&cuid=E712FF971F2C481364204D2EEE9F08F1|573244420301468&resid=03&com_dispatch_param={}&src_from=xxx&category=hotel&target=hotel_search_channel_wise

静态参数：test=test , hidenav=1 , hidefooter=1 ,  resid=03 ，target=hotel_search_channel_wise , com_dispatch_param（传空）,category=hotel
注：对此协议进行了修改，请以此协议为准

# 糯米等

http://map.nuomi.com/xxx/test?1=1&com_dispatch_param={"ldata":"","qid":"","src_channel":""}&category=groupon&target=target_wise_home


########
这个是首页的跳转样例，在com_dispatch_param里
com_dispatch_param 这个是json格式的
从框跳转到LBS再到团购中转的就是一个URL，这个是拼接起来的吧 上面我省略那部分是原始的，后面这些是我们解析需要添加的参数。 

http://map.nuomi.com/xxx/test?1=1&com_dispatch_param={"ldata":"","qid":"","src_channel":""}&category=groupon&target=target_wise_home
里面有个src_channel, 拼在那个后面


#######
我们这边四个入口的调用示例，需要注意有两点：

1. 1=1 的占位符，这个需要我们后续来约定一下
2. category 和 target 是必传字段，跳不同的入口这两个字段不同

详细如下：
首页    &category=groupon&target=target_wise_home
列表页   &category=groupon&target=target_wise_list
详情页   &category=groupon&target=target_wise_detail
订单详情页   &category=groupon&target=target_wise_order_detail

##############
1   框一级入口   框二级入口   框三级入口   插件调起页   入口PM负责人   URL地址   糯米跳转URL   插件渠道号src_channel
2   首页导航  网址大全  餐饮美食-团购   美食列表页   陈琛    http://m.nuomi.com/326/0-0/0-0-0-0-0?n=1&cid=005711&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_site_food","key":"snd_cattag_id","value":"326"}&category=groupon&target=target_wise_list   kuang_site_food
3   百度服务-团购         http://m.nuomi.com?n=1&cid=005710&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_site_serve"}&category=groupon&target=target_wise_home  kuang_site_serve
4   生活购物-团购         http://m.nuomi.com?n=1&cid=005712&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_site_shop"}&category=groupon&target=target_wise_home   kuang_site_shop
5   休闲娱乐-KTV  插件首页   http://m.nuomi.com/341/0-0/0-0-0-0-0?n=1&cid=005713&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_site_ktv","key":"snd_cattag_id","value":"341"}&category=groupon&target=target_wise_list  kuang_site_ktv
6   生活服务  热门类目  插件列表页   彭静   http://m.nuomi.com/326/0-0/0-0-0-0-0?n=1&cid=wise_life_tuangou&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_life_hot_group","key":"snd_cattag_id","value":"326"}&category=groupon&target=target_wise_list   kuang_life_hot_group
7   服务大全-团购   插件列表页   http://m.nuomi.com/326/0-0/0-0-0-0-0?n=1&cid=wise_life_fwtuangou&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_life_serve","key":"snd_cattag_id","value":"326"}&category=groupon&target=target_wise_list   kuang_life_serve
8   服务大全-代金券  插件列表页     http://m.nuomi.com/1000107/0-0/0-0-0-0-0?n=1&cid=wise_life_quan&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_life_serve_coupon","key":"snd_cattag_id","value":"1000107"}&category=groupon&target=target_wise_list    kuang_life_serve_coupon
9   服务大全-自助餐  插件列表页   　 http://m.nuomi.com/392/0-0/0-0-0-0-0?n=1&cid=wise_life_zizhucan&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_life_serve_buffet","key":"snd_cattag_id","value":"392"}&category=groupon&target=target_wise_list   kuang_life_serve_buffet
10  服务大全-火锅   插件列表页   　  http://m.nuomi.com/364/0-0/0-0-0-0-0?n=1&cid=wise_life_huoguo&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_life_serve_hotpot","key":"snd_cattag_id","value":"364"}&category=groupon&target=target_wise_list   kuang_life_serve_hotpot
11  抢购频道  插件商品详情页    http://详情页链接?n=1&cid=wise_life_qianggou&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_life_sales","key_detail_dealid":"团单ID"}&category=groupon&target=target_wise_detail   kuang_life_sales
12  banner位   插件首页/列表页/详情页           
13  Other   Other                
14  发现  发现banner      插件首页/列表页/详情页  郝奇           
15  发现固定入口  找美食   插件列表页     http://m.nuomi.com/326/0-0/0-0-0-0-0?n=1&cid=baiduboxapp_Fmeishi&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_enter","key":"snd_cattag_id","value":"326"}&category=groupon&target=target_wise_list  kuang_enter
16  查团购   插件列表页   　 http://m.nuomi.com?n=1&cid=baiduboxapp_find&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_diamond_cater"}&category=groupon&target=target_wise_home   kuang_diamond_cater
17  推荐  美食  插件详情页            
18  Other   Other                
19  我的钱包  钱包banner  顶部banner  插件首页/列表页/详情页  陶钧           
20  底部banner  插件首页/列表页/详情页           
21  钱包icon  团购  插件首页  http://m.nuomi.com?n=1&cid=baiduboxapp&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_wallet"}&category=groupon&target=target_wise_home   kuang_wallet
22  Other   Other                
23  首页运营位   首页banner      插件首页/列表页/详情页  王琰           
24  PUSH      插件首页/列表页/详情页           
25  百度笑报      插件首页/列表页/详情页           
26  今日资讯      插件首页/列表页/详情页           
27  Other   Other                
28  订单中心          订单详情页   陶钧   http://订单详情页链接?n=1&cid=wise_orderlist&com_dispatch_param={"ldata":"","qid":"","src_channel":"kuang_myorder","order_id":"订单ID"}&category=groupon&target=target_wise_order_detail   kuang_myorder
29  代金券           首页  陈琳       kuang_mycoupon
30  wise结果页           订单首页/商品详情页  陶钧  不固定，由糯米的RD做相关联调       kuang_search



#end