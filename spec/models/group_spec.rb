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

  describe 'Association' do
    before do
      FactoryBot.build(:user)
      FactoryBot.build(:comment)
      FactoryBot.build(:like)
      @post = FactoryBot.build(:post)
    end

    let(:association) do
      described_class.reflect_on_association(target)
    end
    context 'Userテーブルとのアソシエーション' do
      let(:target) { :users }
      it "Userとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Postテーブルとのアソシエーション' do
      let(:target) { :post }
      it "Postとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'GroupsUserテーブルとのアソシエーション' do
      let(:target) { :group_users }
      it "GroupsUserとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
    end

    context ' Messageテーブルとのアソシエーション' do
      let(:target) { :messages }
      it "Messageとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :has_many
      end
    end

  end
end
