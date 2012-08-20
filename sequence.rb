#!/usr/bin/env ruby
#coding=utf-8

require 'optparse'


def next_el(n=1, m)
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
  opts.banner = "Usage: sequence.rb [length]"

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
  puts next_el(options[:len])
end

