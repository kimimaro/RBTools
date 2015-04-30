#!/usr/bin/env ruby
# encoding: utf-8

require 'logger'
require "erb"
include ERB::Util

LOGGER = Logger.new(STDOUT)


CMD_PREFIX = "baiduboxapp://"


CMD_QUESTION = "?"
CMD_EQUAL = "="
CMD_AND = "&"


CMD_ACTION_KEY = "action"
CMD_OPTIONS_KEY = "params"
CMD_CALLBACK_KEY = "func"
CMD_MINVERSION_KEY = "minver"

CMD_CALLBACK_METHOD = "testJS"
CMD_DEFAULT_MINVER = "6.5.0.0"

# 宏
# if ENV['RAILS_ENV'] == 'development'
#   class A; end;
# else
#   class B; end;
# end

=begin
# 分享6.5

CMD_HOST = "common"
CMD_ACTION = "callshare"
CMD_MINVER = "6.5.0.0"

LINK_URL = "http://zhida.baidu.com/s?app_id=4369243&ref_id=share&target_url=http%3A%2F%2Fguilin.yoloke.com%2F"
ICON_URL = "http://kibey-fair.b0.upaiyun.com/2013/05/03/fd7bccb1d489dbc3dbe51c37119ee179.png"
AUDIO_URL = "http://www.xiami.com/song/1773645478?spm=a1z1s.6659513.0.0.IayWEn"
IMAGE_URL = "http://hd.shijue.cvimage.cn/asset/50d02af2e744f91103000001.jpg"

CMD_OPTIONS_HASH = {
  "mediaType":"all",
  "type":"1",
  "appid":"4369243",
  "title":"首页-桂林旅游",
  "content":"桂林旅游 , 这个直达号很赞， 马上在手机百度上输入@桂林旅游 , 体验一下吧",
  "linkUrl":url_encode(LINK_URL),
  "iconurl":url_encode(ICON_URL),
  "audiourl":url_encode(AUDIO_URL),
  "imageUrl":url_encode(IMAGE_URL),
  "wxttitle":"微信朋友圈标题",
  "wxtcontent":"微信朋友圈内容",
  "wxftitle":"微信标题",
  "wxfcontent":"微信内容",
  "qztitle":"qzone标题",
  "qzcontent":"qzone内容",
  "qftitle":"qq标题",
  "qfcontent":"qq内容",
  "wbcontent":"微博内容"
}
=end


# 调起SDK插件
CMD_HOST = "invokeplug"
CMD_ACTION = "open"

CMD_MINVER = "6.5.0.0"

URL_LIST = [
  "http://map.baidu.com/mobile/webapp/place/hotelzt/c=131&hidenav=1&hidefooter=1&locMC=12948047.315804|4845092.992634&third_party=xxx&cuid=E712FF971F2C481364204D2EEE9F08F1|573244420301468&resid=03&src_from=xxx", # 酒店首页Web
  "http://map.baidu.com/mobile/webapp/place/hotelzt/test=test&c=131&hidenav=1&hidefooter=1&third_party=kuang_card&resid=03&com_dispatch_param={}&src_from=kuang_card&category=hotel&target=hotel_search_channel_wise&vmgdb=100194q", # 酒店首页Na 卡片
  "http://map.baidu.com/mobile/webapp/place/hotelzt/test=test&c=131&hidenav=1&hidefooter=1&third_party=kuang_find_banner&resid=03&com_dispatch_param={}&src_from=kuang_find_banner&category=hotel&target=hotel_search_channel_wise&vmgdb=100180c", # 酒店首页Na 语音搜索
  "http://m.nuomi.com/326/0-0/0-0-0-0-0?n=1&cid=qingyy03&com_dispatch_param=%7b%22ldata%22%3a%22%22%2c%22qid%22%3a%22%22%2c%22src_channel%22%3a%22kuang_life_economical%22%2c%22key%22%3a%22snd_cattag_id%22%2c%22value%22%3a%22326%22%2c%22name%22%3a%22%e7%be%8e%e9%a3%9f%22%7d&category=groupon&target=target_wise_list&vmgdb=100180c", # 团购列表页
  "http://m.nuomi.com/326/0-0/0-0-0-0-0?n=1&cid=005711&com_dispatch_param=%7b%22ldata%22%3a%22%22%2c%22qid%22%3a%22%22%2c%22src_channel%22%3a%22kuang_site_food%22%2c%22key%22%3a%22snd_cattag_id%22%2c%22value%22%3a%22326%22%2c%22name%22%3a%22%e7%be%8e%e9%a3%9f%22%7d&category=groupon&target=target_wise_list&vmgdb=100081h" # 网址大全 美食团购
]

#2-5
URL = URL_LIST[4]

# <<-URL
#   http://map.baidu.com/mobile/webapp/place/hotelzt/test=test&c=131&hidenav=1&hidefooter=1&locMC=12948047.315804|4845092.992634&third_party=xxx&cuid=E712FF971F2C481364204D2EEE9F08F1|573244420301468&resid=03&com_dispatch_param=&\src_fro\=x\x\x&\category\=h\o\te\l&target\=h\otel_search_channel_wise\
# URL

PLUGIN_ID = "lbsplugin.iphone"
LOG_URL = ""

CMD_OPTIONS_HASH = {
  url: url_encode(URL),
  plugin_id: PLUGIN_ID,
  log_url: LOG_URL,
  log_header: "",
  # append: "1",
  # issturl: "0"
}
=begin
=end

=begin

# 调起优惠券
CMD_HOST = "apppage"
CMD_ACTION = "openCoupon"



# 调起O2O
CMD_HOST = "easybrowse"
CMD_ACTION = ""
CMD_MINVER = "5.3.0.0"

URL = "http://m.baidu.com/lightapp/2387396?from_id=channel&channel_id=searchbox_film&page=http%3a%2f%2fm.dianying.baidu.com%3fsfrom%3dlightapp%26vmgdb%3d100180c"

CMD_OPTIONS_HASH = {
  opentype: "1",  # 1 代表O2O框架
  openurl: url_encode(URL),
  isla: "1",
  #可选参数
  appid: "2387396",
  # append: "1",
  # barcolor: "0000cd",
  # rbtnstyle: "2",
  # subtitle: "百度安全支付"
}
=end

