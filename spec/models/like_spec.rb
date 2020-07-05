require 'rails_helper'
describe Like do
  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      user = create(:user)
      post = create(:post)
      like = build(:like)
      expect(like).to be_valid
    end
  end
end
