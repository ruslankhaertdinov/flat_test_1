#!/usr/bin/env ruby
#coding=utf-8

require 'optparse'

class NextEl
  attr_accessor :n

  def initialize()
    @n = 1
  end

  def next_el(len)
    res = []

    len.times do
      res.push(n.to_s)
      @n = @n.to_s.scan(/\d/).map { |i| i.to_i }
      acc = []
      last = nil

      @n.each do |x|
        if x == last
          acc[-1][0] += 1
        else
          acc.push([1, x])
        end

        last = x
      end

      @n = acc.flatten.join('')
    end

    res
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
  a = NextEl.new
  print a.next_el(options[:len])
end

