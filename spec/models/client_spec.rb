require 'rails_helper'

RSpec.describe Client, type: :model do
  before do
    @client = FactoryBot.build(:client)
  end

  describe 'クライアント新規登録' do
    context '新規登録がうまくいくとき' do
      it '会社名、会社名かな、責任者名、責任者かな、会社所在、メール、パスワード、電話番号が存在すれば登録できる' do
        expect(@client).to be_valid
      end
      it 'emailはアドレスと@があれば登録できる' do
        @client.email = 'a@a'
        expect(@client).to be_valid
      end
      it 'passwordが6文字以上で半角英数字混合であれば登録できる' do
        @client.password = 'a12345'
        @client.password_confirmation = 'a12345'
        expect(@client).to be_valid
      end
    end
  end

  context "クライアント新規登録" do
    it "company_nameが空では登録できない" do
      @client.company_name = ""
      @client.valid?
      expect(@client.errors.full_messages).to include("会社名を入力してください")
    end
    it "c_kanaが空では登録できない" do
      @client.c_kana = ""
      @client.valid?
      expect(@client.errors.full_messages).to include("カナを入力してください")
    end
    it "supervisorが空では登録できない" do
      @client.supervisor = ""
      @client.valid?
      expect(@client.errors.full_messages).to include("担当者を入力してください")
    end
    it "s_kanaが空では登録できない" do
      @client.s_kana = ""
      @client.valid?
      expect(@client.errors.full_messages).to include("カナを入力してください")
    end
    it "company_addressが空では登録できない" do
      @client.company_address = ""
      @client.valid?
      expect(@client.errors.full_messages).to include("住所を入力してください")
    end
    it "telが空では登録できない" do
      @client.tel = ""
      @client.valid?
      expect(@client.errors.full_messages).to include("電話番号を入力してください")
    end
    it "emailが空では登録できない" do
      @client.email = ""
      @client.valid?
      expect(@client.errors.full_messages).to include("メールを入力してください")
    end
    it "emailに@がなければでは登録できない" do
      @client.email = "aaa"
      @client.valid?
      expect(@client.errors.full_messages).to include("メールは不正な値です")
    end
    it "passwordが空では登録できない" do
      @client.password = ""
      @client.valid?
      expect(@client.errors.full_messages).to include("パスワードを入力してください")
    end
    it "password_confirmationが空では登録できない" do
      @client.password_confirmation = ""
      @client.valid?
      expect(@client.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "password_confirmationが空では登録できない" do
      @client.password_confirmation = ""
      @client.valid?
      expect(@client.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
  end
end
