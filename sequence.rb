# frozen_string_literal: true

require_relative 'member'

# Ascending sequence
class Sequence
  def initialize(member_cls)
    raise 'Should use a member class' unless member_cls.is_a? Member

    @sequence = [member_cls.new(1)] # OptimizationV0.1
  end

  def get_member(index)
    build(index)
    @sequence[index - 1]
  end

  def get_sequence(len)
    build(len)
    @sequence.first(len)
  end

  private

  def build(len)
    @sequence << @sequence.last.next while @sequence.length < len
  end
end
