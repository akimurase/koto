require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  before do
    @itinerary = FactoryBot.build(:itinerary)
  end

  describe '商品の新規投稿' do
    context '新規投稿がうまくいくとき' do
      it '画像、名前、金額が存在すれば登録できる' do
        expect(@itinerary).to be_valid
      end
    end
  end

  context "新規投稿がうまくいかない" do
    it "titleが空では登録できない" do
      @itinerary.image = ""
      @itinerary.valid?
      expect(@itinerary.errors.full_messages).to include()
    end
  end
end
