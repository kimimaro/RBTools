#/usr/bin/env ruby
# encoding utf-8

require_relative 'common'

class FileParser

  attr_accessor :source

  def initialize(source, opt = {})

    @source = source
    
    # all log list
    @file_log_list = Array.new()

    LOGGER.debug "file parser initialize #{source}"
  end

  def parser

    i = 0
    LOG_FILE_COUNT.times do
      file_path = @source + i.to_s + '.log'

      LOGGER.debug "file path:#{file_path}"

      if File.exist?(file_path) then
        file_log = Hash.new()
        File.open(file_path, "r") do |file|
          
          j = 0
          file.each_line do |line|
            # Launch speed point:%d with value:%f ms
            point_pattern = /^Launch speed point:(\d{1,3}) with value.*$/
            value_pattern = /^Launch speed point:\d{1,3} with value:(.*) ms$/

            if point_pattern =~ line then
              point = $1
            end

            if value_pattern =~ line then
              value = $1
            end

            # point = line.grep(point_pattern)
            # value = line.grep(value_pattern)

            LOGGER.debug "point:#{point} value:#{value}"

            # array
            # file_log.insert(j, {point.to_sym => value})
            # file_log.push({ => value})

            # hash
            file_log[point.to_sym] = value

            j=j+1
          end
        end

        @file_log_list.push(file_log)
      end
      
      i=i+1
    end

    LOGGER.debug "file log list:#{@file_log_list}"
    return @file_log_list
  end
end
