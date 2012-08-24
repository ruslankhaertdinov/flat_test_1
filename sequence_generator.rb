#!/usr/bin/env ruby
#coding=utf-8

require 'optparse'

class SequenceGenerator

  def initialize(start=1)
    @last = start.to_s
  end

  def next
    chars = @last.split(//)
    acc = []
    last = nil

    chars.each do |x|
      if x == last
        acc[-1][0] += 1
      else
        acc.push([1, x])
      end

      last = x
    end

    @last = acc.flatten.join('')
  end
end


if __FILE__ == $0

  options = {}

  optparse = OptionParser.new do |opts|
    opts.banner = "Usage: file_name.rb [-l N]"

    options[:len] = 7
    opts.on('-l', '--length N', Integer, 'Sequence length') do |l|
      options[:len] = l
    end

    opts.on('-h', '--help', 'Display this screen') do
      puts opts
      exit
    end
  end

  begin
    optparse.parse!
  rescue OptionParser::InvalidArgument, OptionParser::InvalidOption
    puts optparse
    Process.exit!(true)
  end

  g = SequenceGenerator.new
  options[:len].times {puts g.next}
end

