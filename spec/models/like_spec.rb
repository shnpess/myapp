require 'rails_helper'
describe Like do
  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      user = create(:user)
      post = create(:post)
      like = build(:like)
      expect(like).to be_valid
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
