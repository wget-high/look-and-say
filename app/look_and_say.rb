# frozen_string_literal: true

require_relative 'sequence'
require_relative 'look_say_member'
require 'optparse'
require 'benchmark'

options = {}
OptionParser.new do |parser|
  parser.banner = 'Look-and-say sequence builder'
  parser.on('-c', '--cache', 'Cache sequence') do
    options[:cache] = true
  end
  parser.on('-l=LENGTH', '--length=LENGTH', Integer, 'Members to generate') do |l|
    options[:length] = l
  end

  parser.on('-r=COUNT', '--rerun=COUNT', Integer, 'How many times to run') do |c|
    options[:rerun] = c
  end

  parser.on('-b', '--benchmark', 'Print only performance results') do
    options[:benchmark] = true
  end

  parser.on('-h', '--help', 'Prints this help') do
    puts parser
    exit
  end
end.parse!

options[:rerun] ||= 1
options[:length] ||= 15

puts 'Using cache' if options[:cache]
puts "Generating #{options[:length] ||= 20} members"
puts "#{options[:rerun]} times"
puts 'Silently' if options[:benchmark]


sequence = options[:cache] ? SequenceCached.new(LookSayMember) : Sequence.new(LookSayMember)
(0...options[:rerun]).each do
  r = Benchmark.measure do
    sequence.to_enum.take(options[:length]).each do |m, i|
      puts "#{i}: #{m.value}" unless options[:benchmark]
    end
  end
  puts r
end
