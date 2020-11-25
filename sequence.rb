# frozen_string_literal: true

require_relative 'look_say_member'

# Memory effective ascending sequence
class Sequence
  def initialize(member_cls)
    @member_cls = member_cls
  end

  def get_member(index)
    last = @member_cls.new(1)
    (1...index).each do
      last = last.next
    end
    last
  end

  def to_enum
    last = @member_cls.new(1)
    Enumerator.new do |m|
      loop do
        m << last
        last = last.next
      end
    end
  end

  def each(count, &block)
    last = @member_cls.new(1)
    (0...count).each do
      block.call(last)
      last = last.next
    end
    last
  end
end

# Ascending sequence which stores all calculated members
class SequenceCached < Sequence
  def initialize(member_cls)
    super(member_cls)
    @sequence = [member_cls.new(1)]
  end

  def get_member(index)
    build(index)
    @sequence[index]
  end

  def get_sequence(len)
    build(len)
    @sequence.first(len)
  end

  def to_enum
    Enumerator.new do |m|
      i = 0
      loop do
        build(i + 1)
        m << @sequence[i]
        i += 1
      end
    end
  end

  def each(count, &block)
    last = @member_cls.new(1)
    (0...count).each do
      block.call(last)
      last = last.next
    end
  end

  private

  def build(len)
    @sequence << @sequence.last.next while @sequence.length < len
  end
end
