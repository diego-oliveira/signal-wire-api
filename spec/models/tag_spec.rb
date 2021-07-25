require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { FactoryBot.build(:tag)  }

  it "is valid with valid attributes" do
    expect(tag).to be_valid
  end

  it "is not valid without a name" do
    tag.name = nil
    expect(tag).to be_invalid
  end

  it "is not valid if the tag has not a unique name" do
    tag.save!
    new_tag =  FactoryBot.build(:tag, name: tag.name)
    expect(new_tag).to be_invalid
  end
end
