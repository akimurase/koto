require 'rails_helper'

RSpec.describe Point, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe '商品の新規投稿' do
    context '新規投稿がうまくいくとき' do
      it 'カード情報、予約日、人数、金額が存在すれば登録できる' do
        expect(@event).to be_valid
      end
    end
  end

  context "新規投稿がうまくいかない" do
    it "tokenが空では登録できない" do
      @event.token = ""
      @event.valid?
      expect(@event.errors.full_messages).to include()
    end
    it "start_timeが空では登録できない" do
      @event.start_time = ""
      @event.valid?
      expect(@event.errors.full_messages).to include()
    end
    it "num_idが空では登録できない" do
      @event.num_id = ""
      @event.valid?
      expect(@event.errors.full_messages).to include()
    end
    it "priceが空では登録できない" do
      @event.price = ""
      @event.valid?
      expect(@event.errors.full_messages).to include()
    end
  end
end
