require 'rails_helper'
describe Like do
  before do
    create(:user)
    create(:post)
    @like = create(:like)
  end

  describe '#create' do
    it "必須項目がすべて存在すれば登録できること" do
      expect(@like).to be_valid
    end
  end

  describe 'Association' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Userテーブルとのアソシエーション' do
      let(:target) { :user }
      it "Postsとの関連付けはbelongs_toであること" do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'Postテーブルとのアソシエーション' do
      let(:target) { :post }
      it "Postとの関連付けはhas_manyであること" do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
