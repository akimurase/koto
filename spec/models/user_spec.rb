require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '名前、かな、メール、パスワード、電話番号が存在すれば登録できる' do
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

  describe "ユーザー新規登録" do
    it "nameが空では登録できない" do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("氏名を入力してください")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
    end
    it "emailに@がなけれえば登録できない" do
      @user.email = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
end
