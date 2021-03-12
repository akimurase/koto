require 'rails_helper'

RSpec.describe Point, type: :model do
  before do
    @point = FactoryBot.build(:point)
  end

  describe '商品の新規投稿' do
    context '新規投稿がうまくいくとき' do
      it '画像が存在すれば登録できる' do
        expect(@point).to be_valid
      end
    end
  end

  context "新規投稿がうまくいかない" do
    it "titleが空では登録できない" do
      @point.image = ""
      @point.valid?
      expect(@point.errors.full_messages).to include()
    end
  end
end
