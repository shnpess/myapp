require 'rails_helper'
describe Comment do
  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      user = create(:user)
      post = create(:post)
      comment = build(:comment)
      comment.valid?
      expect(comment).to be_valid
    end

    it "コメントがない場合は登録できないこと" do
      user = create(:user)
      post = create(:post)
      comment = build(:comment, text: "")
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end
    it "コメントが51文字以上の場合は登録できないこと" do
      user = create(:user)
      post = create(:post)
      comment = build(:comment, text: "a" * 51)
      comment.valid?
      expect(comment.errors[:text]).to include("は50文字以内で入力してください")
    end
    it "コメントが50文字の場合は登録できること" do
      user = create(:user)
      post = create(:post)
      comment = build(:comment, text: "a" * 50)
      comment.valid?
      expect(comment).to be_valid
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
    context 'Userモデルとのアソシエーション' do
      let(:target) { :user }
      it "Postsとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'Postモデルとのアソシエーション' do
      let(:target) { :post }
      it "Postとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
