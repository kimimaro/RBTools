#!/usr/bin/env ruby
# encoding: utf-8
require 'json'

require_relative 'common'


LOGGER.level = Logger::WARN
# LOGGER.level = Logger::DEBUG


class CommandBuilder
  attr_accessor :invoke_apps_hash, :invoke_file_hash, :invoke_url_hash, :vague_commands

  def initialize()  #(command, opts = {})
    super

    # query = ARGV[0]

    # string.force_encoding(Encoding::UTF_8)

    # my_hash = {:hello => "goodbye"}
    # puts JSON.generate(my_hash) 

    # LOGGER.debug "encode json:#{encode_options_str}"

    # url = "http://map.baidu.com/mobile/webapp/place/hotelzt/c=131&hidenav=一二三四1&hidefooter=1&locMC=12948047.315804|4845092.992634&third_party=xxx&cuid=E712FF971F2C481364204D2EEE9F08F1|573244420301468&resid=03&src_from=xxx"
    # encode_url = url_encode(url)
    # puts encode_url

    minver_str = CMD_MINVER ? CMD_MINVER : CMD_DEFAULT_MINVER

    ret_cmd = CMD_PREFIX + CMD_HOST + CMD_QUESTION

    if CMD_ACTION != ""
      json_options_str = JSON.generate(CMD_OPTIONS_HASH)
      encode_options_str = url_encode(json_options_str)

      LOGGER.debug "\n---- options:#{CMD_OPTIONS_HASH}, \n---- encode options:#{encode_options_str}"

      ret_cmd += CMD_ACTION_KEY + CMD_EQUAL + CMD_ACTION + CMD_AND + \
                 CMD_OPTIONS_KEY + CMD_EQUAL + encode_options_str + CMD_AND + \
                 CMD_CALLBACK_KEY + CMD_EQUAL + CMD_CALLBACK_METHOD + CMD_AND + \
                 CMD_MINVERSION_KEY + CMD_EQUAL + minver_str
    else
      CMD_OPTIONS_HASH.each do |key, value|
        LOGGER.debug "options hash key:#{key} value:#{value} add to cmd:#{ret_cmd}"
        ret_cmd += key.to_s + CMD_EQUAL + value + CMD_AND
      end

      ret_cmd += CMD_CALLBACK_KEY + CMD_EQUAL + CMD_CALLBACK_METHOD + CMD_AND + \
                 CMD_MINVERSION_KEY + CMD_EQUAL + minver_str
    end
    
    puts ret_cmd
  end
end

CommandBuilder.new()
