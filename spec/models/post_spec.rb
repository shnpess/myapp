require 'rails_helper'
describe Post do
  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      user = create(:user)
      post = build(:post)
      post.valid?
      expect(post).to be_valid
    end

    it "名前がない場合は登録できないこと" do
      user = create(:user)
      post = build(:post, name: " ")
      post.valid?
      expect(post.errors[:name]).to include("を入力してください")
    end

    it "名前が8文字以上だと登録出来ないこと" do
      user = create(:user)
      post = build(:post, name: "a" * 9 )
      post.valid?
      expect(post.errors[:name]).to include("は8文字以内で入力してください")
    
    end

    it "名前が7文字の場合は登録出来ること" do
      user = create(:user)
      post = build(:post, name: "a" * 7 )
      expect(post).to be_valid
    end

    it "contentが100文字以上だと登録出来ないこと" do
      user = create(:user)
      post = build(:post, content: "a" * 101)
      post.valid?
      expect(post.errors[:content]).to include("は100文字以内で入力してください")
    end

    it "contentが100文字の場合は登録出来ること" do
      user = create(:user)
      post = build(:post, content: "a" * 100)
      post.valid?
      expect(post).to be_valid
    end

    it "contentがない場合は登録出来ないこと" do
      user = create(:user)
      post = build(:post, content: "")
      post.valid?
      expect(post.errors[:content]).to include("を入力してください")
    end

  end
end