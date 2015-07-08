#/usr/bin/env ruby
# encoding utf-8

require 'logger'
require 'erb'

LOGGER = Logger.new(STDOUT)

LOGGER.level = Logger::WARN
LOGGER.level = Logger::DEBUG


LOG_FILE_COUNT = 10

SPEED_POINT_MEANING_HASH = {
  "1":  "Main函数开始时刻",
  "2":  "application_didFinishLaunchingWithOptions开始时刻",
  "3":  "用户行为统计模块初始化开始时刻",
  "4":  "doTasksBeforeUI开始时刻",
  "5":  "registerKSCrashHandler开始时刻",
  "6":  "setWebViewUserAgent开始时刻",
  "7":  "registerAsGlobalInstance开始时刻",
  "8":  "syncLoginInfoFromKeychain开始时刻",
  "9":  "添加cookie监控通知开始时刻",
  "10": "获取statusBar高度开始时刻",
  "11": "startDetectNetwork开始时刻",
  "12": "checkLaunchType开始时刻",
  "13": "UIWindow初始化开始时刻",
  "14": "BBARootViewController sharedInstance开始时刻",
  "15": "makeKeyAndVisible开始时刻",
  "16": "BBARootViewController loadView开始时刻",
  "17": "加载大用户教育开始时刻",
  "18": "加载大用户教育结束时刻",
  "19": "loadMainView开始时刻",
  "20": "初始化BBAMainViewController开始时刻",
  "21": "初始化BBAWindowsViewController开始时刻",
  "22": "loadMainView结束时刻",
  "23": "BBARootViewController loadView结束时刻",
  "24": "BBARootViewController viewDidLoad开始时刻",
  "25": "BBARootViewController viewDidLoad结束时刻",
  "26": "BBAConsole初始化开始时刻",
  "27": "开启夜间模式开始时刻",
  "28": "doDelayTasks开始时刻",
  "29": "application_didFinishLaunchingWithOptions结束时刻",
  "30": "application_openURL开始时刻",
  "31": "application_openURL结束时刻",
  "32": "applicationDidBecomeActive开始时刻",
  "33": "applicationDidBecomeActive结束时刻",
  "34": "启动完成",
}