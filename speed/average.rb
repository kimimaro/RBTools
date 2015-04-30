#!/usr/bin/env ruby
# encoding utf-8

require 'logger'
require "erb"
include ERB::Util

LOGGER = Logger.new(STDOUT)

LOGGER.level = Logger::WARN
# LOGGER.level = Logger::DEBUG

class SpeedManager

  attr_accessor :source

  def initialize(source, opt = {})
    super

    # @source = ARGV[0]
    @source = source
    
    # all log list
    @file_log_list = Array.new(10)

    LOGGER.debug "speed man initialize #{source}"
  end

  def average

    i = 0
    10.times do
      file_path = @source + i.to_str

      LOGGER.debug "file path:#{file_path}"

      File.open(file_path, "r") do |file|
        file.each_line do |line|
          # Launch speed point:%d with value:%f ms
          point_pattern = '^Launch speed point:(\d) with value.*$'
          value_pattern = '^Launch speed point:\d with value:(.*) ms$'

          point = line.grep(point_pattern)
          value = line.grep(value_pattern)

          LOGGER.debug "point:#{point} value:#{value}"

          @file_log_list.add({point.to_sym => value})
        end
      end

      i=i+1
    end

    LOGGER.debug "file log list:#{@file_log_list}"
  end
end

speed_man = SpeedManager.new()  # 参数值和init方法参数数量？
#speed_man.average
