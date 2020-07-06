require 'rails_helper'
describe User do
  before do
    @user = create(:user)
    create(:post)
    create(:comment)
    create(:like)
    create(:group)
    create(:group_user)
    create(:message)
  end

  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "ニックネームがない場合は登録できないこと" do
      @user = build(:user, nickname: "")
      @user.valid?
      expect(@user.errors[:nickname]).to include("を入力してください")
    end

    it "ニックネームが7文字以上の場合は登録できないこと" do
      @user = build(:user, nickname: "a" * 7)
      @user.valid?
      expect(@user.errors[:nickname]).to include("は6文字以内で入力してください")
    end

    it "ニックネームが6文字の場合は登録できること" do
      @user[:nickname] = "a" * 6
      expect(@user).to be_valid
    end

    it "emailがない場合は登録できないこと" do
      @user = build(:user, email: "")
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    it "プロフィールが71文字以上の場合は登録できないこと" do
      @user = build(:user, profile: "a" * 71)
      @user.valid?
      expect(@user.errors[:profile]).to include("は70文字以内で入力してください")
    end
    it "プロフィールが70文字の場合は登録できること" do
      @user[:profile] = "a" * 70
      @user.valid?
      expect(@user).to be_valid
    end

    it "passwordがない場合は登録できないこと" do
      @user = build(:user, password: "")
      @user.valid?
      expect(@user.errors[:password]).to include("を入力してください")
    end

    it "passwordが5文字以下の場合は登録できないこと" do
      @user = build(:user, password: "a" * 5)
      @user.valid?
      expect(@user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "passwordが6文字の場合は登録できること" do
      expect(@user).to be_valid
    end
  end



  describe 'Association' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Postテーブルとのアソシエーション' do
      let(:target) { :posts }
      it "Postとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end

      it "Userが削除されたらPostも削除されること" do
        expect { @user.destroy }.to change { Post.count }.by(-1)
      end
    end

    context 'Groupテーブルとのアソシエーション' do
      let(:target) { :groups }
      it "Groupとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end

      it "Userが削除されたらcommentも削除されること" do
        expect { @user.destroy }.to change { Comment.count }.by(-1)
      end
    end

    context 'Group_userテーブルとのアソシエーション' do
      let(:target) { :group_users }
      it "Group_userとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end

      it "Userが削除されたらGroup_userも削除されること" do
        expect { @user.destroy }.to change { GroupUser.count }.by(-1)
      end
    end

    context 'Likeテーブルとのアソシエーション' do
      let(:target) { :likes }
      it "Likeとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end

      it "Userが削除されたらLikeも削除されること" do
        expect { @user.destroy }.to change { Like.count }.by(-1)
      end
    end

    context 'Commentテーブルとのアソシエーション' do
      let(:target) { :comments }
      it "Commentとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end

      it "Userが削除されたらCommentも削除されること" do
        expect { @user.destroy }.to change { Comment.count }.by(-1)
      end
    end
  end
end
