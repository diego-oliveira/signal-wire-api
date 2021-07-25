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

  describe 'scopes' do
    describe 'most_used' do
      before do
        FactoryBot.create(:tag, taggings_count: 5)
        FactoryBot.create(:tag, taggings_count: 10)
        FactoryBot.create(:tag, taggings_count: 50)
        FactoryBot.create(:tag, taggings_count: 6)
      end

      it 'returns the tag with highest taggings_count' do
        tag = Tag.most_used
        expect(tag.taggings_count).to be 50
      end
    end
  end
end
