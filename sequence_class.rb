#!/usr/bin/env ruby
#coding=utf-8

require 'optparse'

class SequenceGenerator

  def initialize(start = 1)
    @last_el = start
  end

  def next
    chars = @last_el.to_s.scan(/\d/).map { |i| i.to_i }
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

    @last_el = acc.flatten.join('')
  end
end

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = "Usage: sequence.rb [-l N]"

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


if __FILE__ == $0
  g = SequenceGenerator.new
  options[:len].times {puts g.next()}
end

