# frozen_string_literal: true

require_relative '../app/look_say_member'

RSpec.describe LookSayMember do
  it 'creates new member instance' do
    member = LookSayMember.new(1)
    expect(member.value).to eq '1'
    member = LookSayMember.new('21')
    expect(member.value).to eq '21'
  end

  it 'returns next member in look-and-say sequence' do
    member = LookSayMember.new('1')
    member = member.next
    expect(member.value).to eq '11'
    member = member.next
    expect(member.value).to eq '21'
    member = member.next
    expect(member.value).to eq '1211'
    member = member.next
    expect(member.value).to eq '111221'
    member = member.next
    expect(member.value).to eq '312211'
  end
end
