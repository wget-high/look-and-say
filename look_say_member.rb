# frozen_string_literal: true

require_relative 'member'

# Class which represents look-and-say sequence member
class LookSayMember
  extend Member
  attr_reader :value

  REGEXP = Regexp.new('(1+)|(2+)|(3+)')
  REGEXP_REVERSE = Regexp.new('(1+)|(2+)|(3+)')

  def initialize(value)
    @value = value.to_s
  end

  def next
    groups = @value.scan(REGEXP)
    next_member = String.new
    groups.each do |m|
      match = get_match(m)
      next_member += "#{match.length}#{match[0]}"
    end
    LookSayMember.new(next_member)
  end

  private

  def get_match(arr)
    arr.compact[0]
  end
end
