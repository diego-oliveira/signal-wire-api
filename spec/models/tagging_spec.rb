require 'rails_helper'

RSpec.describe Tagging, type: :model do
  let(:tagging) { FactoryBot.build(:tagging) }

  it "is valid with valid attributes" do
    expect(tagging).to be_valid
  end

  it "is not valid without a tag" do
    tagging.tag = nil
    expect(tagging).to be_invalid
  end

  it "is not valid without a ticket" do
    tagging.ticket = nil
    expect(tagging).to be_invalid
  end
end
