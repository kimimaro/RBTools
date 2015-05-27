#!/usr/bin/env ruby
# encoding utf-8

require_relative 'common'
require_relative 'fileParser'

# include ERB::Util

class SpeedManager

  attr_accessor :file_log_list, :source

  def initialize()
    super

    LOGGER.debug "speed man initialize."
  end

  def average

    # get log files
    source = ARGV[0]
    LOGGER.debug "source file argv:#{source}"

    if source == nil
      source = './logs/log'
    end

    @source = source

    file_parser = FileParser.new(source)
    @file_log_list = file_parser.parser

    LOGGER.debug "parse log list:#{@file_log_list}"

    # compose log hash
    average_log_hash = Hash.new()

    @file_log_list.each() do |file_log|
      file_log.each() do |key,value|
        value_list = average_log_hash[key]
        if value_list == nil then
          value_list = Array.new()
        end

        LOGGER.debug "key:#{key}, value:#{value}, value_list:#{value_list}"
        value_list.push(value.to_i)
        average_log_hash[key] = value_list
      end
    end

    LOGGER.debug "average_log_hash:#{average_log_hash}"

    # calculate average
    average_log_hash.each() do |key,value_list|
      average = value_list.inject{ |sum, el| sum + el }.to_f / value_list.size

      LOGGER.debug "value_list size:#{value_list.size}, average:#{average} for key:#{key}"
      average_log_hash[key] = average
    end

    return average_log_hash
  end

  def average_write_to_file
    log_hash = average()

    log_hash = log_hash.sort_by{|k,v| k.to_s.to_i}

    LOGGER.debug "final average speed:#{log_hash}"

    file_path = @source + '.log'
    File.open(file_path, "w") do |file|
      log_hash.each() do |k,v|
        file << "速度统计点:#{"%02d" % (k.to_s.to_i)}, 启动到该点耗时均值:#{"%04d" % v} ms, 含义:#{SPEED_POINT_MEANING_HASH[k.to_sym]} \n"
      end
    end
  end
end

speed_man = SpeedManager.new()
speed_man.average_write_to_file

