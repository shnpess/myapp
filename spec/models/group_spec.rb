require 'rails_helper'
describe Group do
  before do
    create(:user)
    create(:post)
    @group = create(:group)
    create(:group_user)
    create(:message)
  end

  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      @group.valid?
      expect(@group).to be_valid
    end

    it "名前がない場合は登録できないこと" do
      @group = build(:group, name: " ")
      @group.valid?
      expect(@group.errors[:name]).to include("を入力してください")
    end
  end

  describe 'Association' do
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

      it "Groupが削除されたらGroup_userも削除されること" do
        expect { @group.destroy }.to change { GroupUser.count }.by(-1)
      end
    end

    context ' Messageテーブルとのアソシエーション' do
      let(:target) { :messages }
      it "Messageとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :has_many
      end

      it "Groupが削除されたらMessageも削除されること" do
        expect { @group.destroy }.to change { Message.count }.by(-1)
      end
    end
  end
end
