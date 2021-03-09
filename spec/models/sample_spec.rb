require 'rails_helper'

RSpec.describe Sample, type: :model do
    before do
      @sample = FactoryBot.build(:sample)
    end
  
  describe 'サンプル新規登録' do
    context '新規登録がうまくいくとき' do
      it '名前、かな、メール、パスワード、電話番号、商品名が存在すれば登録できる' do
        expect(@sample).to be_valid
      end
      it 'emailはアドレスと@があれば登録できる' do
        @sample.email = 'a@a'
        expect(@sample).to be_valid
      end
      it 'passwordが6文字以上で半角英数字混合であれば登録できる' do
        @sample.password = 'a12345'
        @sample.password_confirmation = 'a12345'
        expect(@sample).to be_valid
      end
    end
  end

  describe "サンプル新規登録" do
    it "nameが空では登録できない" do
      @sample.name = ""
      @sample.valid?
      expect(@sample.errors.full_messages).to include()
    end
    it "emailが空では登録できない" do
      @sample.email = ""
      @sample.valid?
      expect(@sample.errors.full_messages).to include()
    end
    it "passwordが空では登録できない" do
      @sample.password = ""
      @sample.valid?
      expect(@sample.errors.full_messages).to include()
    end
    it "password_confirmationが空では登録できない" do
      @sample.password_confirmation = ""
      @sample.valid?
      expect(@sample.errors.full_messages).to include()
    end
  end
end
