require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'サンプル新規登録' do
    context '新規登録がうまくいくとき' do
      it '名前、かな、メール、パスワード、電話番号、商品名が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailはアドレスと@があれば登録できる' do
        @user.email = 'a@a'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で半角英数字混合であれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
    end
  end

  describe "サンプル新規登録" do
    it "nameが空では登録できない" do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
  end
end
