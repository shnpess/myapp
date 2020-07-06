require 'rails_helper'
describe Post do
  before do
    create(:user)
    @post = create(:post)
    create(:comment)
    create(:like)
    create(:group)
  end
  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      @post.valid?
      expect(@post).to be_valid
    end

    it "名前がない場合は登録できないこと" do
      @post = build(:post, name: " ")
      @post.valid?
      expect(@post.errors[:name]).to include("を入力してください")
    end

    it "名前が8文字以上だと登録出来ないこと" do
      @post = build(:post, name: "a" * 9)
      @post.valid?
      expect(@post.errors[:name]).to include("は8文字以内で入力してください")
    end

    it "名前が7文字の場合は登録出来ること" do
      @post = build(:post, name: "a" * 7)
      expect(@post).to be_valid
    end

    it "contentが100文字以上だと登録出来ないこと" do
      @post = build(:post, content: "a" * 101)
      @post.valid?
      expect(@post.errors[:content]).to include("は100文字以内で入力してください")
    end

    it "contentが100文字の場合は登録出来ること" do
      @post = build(:post, content: "a" * 100)
      @post.valid?
      expect(@post).to be_valid
    end

    it "contentがない場合は登録出来ないこと" do
      @post = build(:post, content: "")
      @post.valid?
      expect(@post.errors[:content]).to include("を入力してください")
    end
  end

  describe 'Association' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Userテーブルとのアソシエーション' do
      let(:target) { :user }
      it "Userとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end
    context 'Groupテーブルとのアソシエーション' do
      let(:target) { :groups }
      it "Groupとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end

      it "Postが削除されたらGroupも削除されること" do
        expect { @post.destroy }.to change { Group.count }.by(-1)
      end
    end

    context 'Likeテーブルとのアソシエーション' do
      let(:target) { :likes }
      it "Likeとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
      it "Postが削除されたらLikeも削除されること" do
        expect { @post.destroy }.to change { Like.count }.by(-1)
      end
    end

    context 'Commentテーブルとのアソシエーション' do
      let(:target) { :comments }
      it "Commentとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :has_many
      end
      it "Postが削除されたらCommentも削除されること" do
        expect { @post.destroy }.to change { Comment.count }.by(-1)
      end
    end
  end
end
