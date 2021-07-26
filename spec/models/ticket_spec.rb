require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) do 
    _ticket = FactoryBot.build(:ticket)
    _ticket.tags = FactoryBot.build_list(:tag, 4)
    _ticket
  end

  it "is valid with valid attributes" do
    expect(ticket).to be_valid
  end

  it "is not valid without a title" do
    ticket.title = nil
    expect(ticket).to be_invalid
  end

  it "is not valid without a user_id" do
    ticket.user_id = nil
    expect(ticket).to be_invalid
  end

  it "is not valid when has more than 4 tags" do
    ticket.tags << FactoryBot.build(:tag)
    expect(ticket).to be_invalid
  end
end
