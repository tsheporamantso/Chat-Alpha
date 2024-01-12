require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'attributes to be present' do
    context 'title to be present' do
      it 'should not be valid without title' do
        article = FactoryBot.build(:article, title: nil)
        expect(article).to_not be_valid
      end
   
      it 'should not be valid with title longer than 100 characters' do
        article = FactoryBot.build(:article, title: "a" * 101)
        expect(article).to_not be_valid
      end
   
      it 'should not be valid with less than 6 characters' do
        article = FactoryBot.build(:article, title: "aaa")
        expect(article).to_not be_valid
      end
   
      it 'should be valid with characters between 6 to 100' do
        article = FactoryBot.build(:article, title: "g" * 100)
        expect(article).to be_valid
      end
    end
    context 'description to be present' do
      it 'should not be valid without description' do
        article = FactoryBot.build(:article, description: nil)
        expect(article).to_not be_valid
      end

      it 'should not be valid with descrption longer than 300 characters' do
        article = FactoryBot.build(:article, description: "a" * 301)
        expect(article).to_not be_valid
      end

      it 'should not be valid with less than 10 characters' do
        article = FactoryBot.build(:article, description: "aa")
        expect(article).to_not be_valid
      end

      it 'should be valid with characters between 10 to 300' do
        article = FactoryBot.build(:article, description: "d" * 300)
        expect(article).to be_valid
      end
    end
  end
end
