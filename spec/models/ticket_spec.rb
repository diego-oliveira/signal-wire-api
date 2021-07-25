require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { FactoryBot.build(:ticket)  }

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
end
