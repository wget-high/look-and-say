# frozen_string_literal: true

require_relative 'sequence'
require_relative 'look_say_member'

puts 'basic:'
sequence = Sequence.new(LookSayMember)
sequence.to_enum.take(10).each { |m| puts m.value }
sequence.each(10) do |m|
  puts m.value
end

puts 'cached:'
sequence2 = SequenceCached.new(LookSayMember)
sequence2.each(10) do |m|
  puts m.value
end
sequence2.to_enum.take(10).each do |m|
  puts m.value
end

