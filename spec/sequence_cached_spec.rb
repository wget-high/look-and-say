# frozen_string_literal: true

require_relative '../app/sequence'
require_relative '../app/look_say_member'

RSpec.describe SequenceCached do
  it 'returns n-th sequence member' do
    cached_sequence = SequenceCached.new(LookSayMember)

    expect(cached_sequence.get_member(1)).to eq LookSayMember.new('1')
    expect(cached_sequence.get_member(2)).to eq LookSayMember.new('11')
    expect(cached_sequence.get_member(3)).to eq LookSayMember.new('21')
    expect(cached_sequence.get_member(5)).to eq LookSayMember.new('111221')
    expect(cached_sequence.get_member(7)).to eq LookSayMember.new('13112221')
    expect(cached_sequence.get_member(15)).to eq LookSayMember.new('311311222113111231131112132112311321322112111312211312111322212311322113212221')
  end

  it 'iterates over sequence' do
    first_five = [LookSayMember.new('1'), LookSayMember.new('11'), LookSayMember.new('21'), LookSayMember.new('1211'), LookSayMember.new('111221')]
    r = []

    sequence = SequenceCached.new(LookSayMember)
    sequence.each(5) { |m| r << m }
    expect(r).to eq first_five

    r.clear
    sequence.to_enum.take(5).each { |m| r << m }
    expect(r).to eq first_five
  end

  it 'returns sequence array' do
    first_five = [LookSayMember.new('1'), LookSayMember.new('11'), LookSayMember.new('21'), LookSayMember.new('1211'), LookSayMember.new('111221')]

    sequence = SequenceCached.new(LookSayMember)
    expect(sequence.get_sequence(5)).to eq first_five
  end
end
