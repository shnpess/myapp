require 'rails_helper'
describe Group do
  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      user = create(:user)
      post = create(:post)
      group = create(:group)
      group.valid?
      expect(group).to be_valid
    end

    it "名前がない場合は登録できないこと" do
      user = create(:user)
      post = create(:post)
      group = build(:group, name: " ")
      group.valid?
      expect(group.errors[:name]).to include("を入力してください")
    end
  end
end
