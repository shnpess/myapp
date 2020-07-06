require 'rails_helper'
describe Post do
  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "ニックネームがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "ニックネームが7文字以上の場合は登録できないこと" do
      user = build(:user, nickname: "a" * 7)
      user.valid?
      expect(user.errors[:nickname]).to include("は6文字以内で入力してください")
    end

    it "ニックネームが6文字の場合は登録できること" do
      user = build(:user, nickname: "a" * 6)
      expect(user).to be_valid
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "プロフィールが71文字以上の場合は登録できないこと" do
      user = build(:user, profile: "a" * 71)
      user.valid?
      expect(user.errors[:profile]).to include("は70文字以内で入力してください")
    end
    it "プロフィールが70文字以上の場合は登録できないこと" do
      user = build(:user, profile: "a" * 70)
      user.valid?
      expect(user).to be_valid
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが5文字以下の場合は登録できないこと" do
      user = build(:user, password: "a" * 5)
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "passwordが6文字の場合は登録できること" do
      user = build(:user, password: "a" * 6)
      expect(user).to be_valid
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

    context 'Postモデルとのアソシエーション' do
      let(:target) { :groups }
      it "Postとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Groupモデルとのアソシエーション' do
      let(:target) { :groups }
      it "Groupとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Likeモデルとのアソシエーション' do
      let(:target) { :likes }
      it "Likeとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
      # it "Postが削除されたらCommentも削除されること" do
      #   expect { @post.destroy }.to change { Like.count }
      # end
    end

    context 'Commentモデルとのアソシエーション' do
      let(:target) { :comments }
      it "Commentとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
      # it "Postが削除されたらCommentも削除されること" do
      #   expect { @post.destroy }.to change { Comment.count }
      # end
    end
  end
end
