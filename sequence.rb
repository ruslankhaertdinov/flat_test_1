#!/usr/bin/env ruby
#coding=utf-8

require 'optparse'

def next_el(n, m)
  res = []

  m.times do
    res.push(n.to_s)
    n = n.to_s.scan(/\d/).map { |i| i.to_i }
    acc = []
    last = nil

    n.each do |x|
      if x == last
        acc[-1][0] += 1
      else
        acc.push([1, x])
      end

      last = x
    end

    n = acc.flatten.join('')
  end

  res
end


options = {}

optparse = OptionParser.new do |opts|
  opts.banner = "Usage: test1.rb [option1] [option2]"

  options[:start] = 1
  opts.on('-s', '--start N', Integer, 'Starting value') do |st_v|
    options[:start] = st_v
  end

  options[:depth] = 7
  opts.on('-d', '--depth N', Integer, 'Queue depth') do |d|
    options[:depth] = d
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
  puts next_el(s=options[:start], d=options[:depth])
end

