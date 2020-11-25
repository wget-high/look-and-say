# frozen_string_literal: true

require_relative '../app/sequence'
require_relative '../app/look_say_member'

RSpec.describe Sequence do
  it 'returns n-th sequence member' do
    sequence = Sequence.new(LookSayMember)

    expect(sequence.get_member(1)).to eq LookSayMember.new('1')
    expect(sequence.get_member(2)).to eq LookSayMember.new('11')
    expect(sequence.get_member(3)).to eq LookSayMember.new('21')
    expect(sequence.get_member(5)).to eq LookSayMember.new('111221')
    expect(sequence.get_member(7)).to eq LookSayMember.new('13112221')
    expect(sequence.get_member(15)).to eq LookSayMember.new('311311222113111231131112132112311321322112111312211312111322212311322113212221')
  end

  it 'iterates over sequence' do
    r = []
    first_five = [LookSayMember.new('1'), LookSayMember.new('11'), LookSayMember.new('21'), LookSayMember.new('1211'), LookSayMember.new('111221')]
    sequence = Sequence.new(LookSayMember)
    sequence.each(5) { |m| r << m }
    expect(r).to eq first_five

    r.clear
    sequence.to_enum.take(5).each { |m| r << m }
    expect(r).to eq first_five
  end
end
