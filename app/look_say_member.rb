# frozen_string_literal: true

require_relative '../member'

# Class which represents look-and-say sequence member
class LookSayMember
  extend Member
  attr_reader :value

  def initialize(value)
    @value = value.to_s
  end

  def next
    next_member = String.new
    buffer = String.new
    @value.each_char do |c|
      unless buffer[-1] == c || buffer.empty?
        next_member += "#{buffer.length}#{buffer[0]}"
        buffer.clear
      end
      buffer += c
    end
    next_member += "#{buffer.length}#{buffer[0]}" unless buffer.empty?
    LookSayMember.new(next_member)
  end
end
