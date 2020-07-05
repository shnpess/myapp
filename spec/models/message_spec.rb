require 'rails_helper'
describe Message do
  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      user = create(:user)
      post = create(:post)
      group = create(:group)
      message = create(:message)
      message.valid?
      expect(message).to be_valid
    end

    it "メッセージがない場合は登録できないこと" do
      user = create(:user)
      post = create(:post)
      group = create(:group)
      message = build(:message, content: " ")
      message.valid?
      expect(message.errors[:content]).to include("を入力してください")
    end
    it "メッセージが51文字以上の場合は登録できないこと" do
      user = create(:user)
      post = create(:post)
      group = create(:group)
      message = build(:message, content: "a" * 51)
      message.valid?
      expect(message.errors[:content]).to include("は50文字以内で入力してください")
    end
    it "メッセージが50文字の場合は登録できること" do
      user = create(:user)
      post = create(:post)
      group = create(:group)
      message = build(:message, content: "a" * 50)
      message.valid?
      expect(message).to be_valid
    end
  end
end
