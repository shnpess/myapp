require 'rails_helper'
describe Message do
  before do
    create(:user)
    create(:post)
    create(:group)
    create(:group_user)
    @message = create(:message)
  end

  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      @message.valid?
      expect(@message).to be_valid
    end

    it "メッセージがない場合は登録できないこと" do
      @message = build(:message, content: " ")
      @message.valid?
      expect(@message.errors[:content]).to include("を入力してください")
    end

    it "メッセージが51文字以上の場合は登録できないこと" do
      @message = build(:message, content: "a" * 51)
      @message.valid?
      expect(@message.errors[:content]).to include("は50文字以内で入力してください")
    end

    it "メッセージが50文字の場合は登録できること" do
      @message = build(:message, content: "a" * 50)
      @message.valid?
      expect(@message).to be_valid
    end
  end

  describe 'Association' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Groupテーブルとのアソシエーション' do
      let(:target) { :group }
      it "Groupとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'Userテーブルとのアソシエーション' do
      let(:target) { :user }
      it "Userとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
