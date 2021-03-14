require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の新規投稿' do
    context '新規投稿がうまくいくとき' do
      it '画像、名前、金額が存在すれば登録できる' do
        expect(@product).to be_valid
      end
    end
  end

  context "新規投稿がうまくいかない" do
    it "imageが空では登録できない" do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("画像を入力してください")
    end
    it "nameが空では登録できない" do
      @product.name = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("商品名を入力してください")
    end
    it "priceが空では登録できない" do
      @product.price = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("金額を入力してください")
    end
  end
end
