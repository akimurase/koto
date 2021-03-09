require 'rails_helper'

RSpec.describe Sample, type: :model do
  describe "サンプル新規登録" do
    it "nameが空では登録できない" do
      # sample = FactoryBot.build(:sample)
      # sample.name = ""
      sample = Sample.new(name: "", email: "test@example", password: "000000", password_confirmation: "000000")
      sample.valid?
      expect(sample.errors.full_messages).to include()
    end
    it "emailが空では登録できない" do
      sample = Sample.new(name: "あ", email: "", password: "000000", password_confirmation: "000000")
      sample.valid?
      expect(sample.errors.full_messages).to include()
    end
    it "passwordが空では登録できない" do
      sample = Sample.new(name: "あ", email: "test@example", password: "", password_confirmation: "000000")
      sample.valid?
      expect(sample.errors.full_messages).to include()
    end
    it "password_confirmationが空では登録できない" do
      sample = Sample.new(name: "あ", email: "test@example", password: "000000", password_confirmation: "")
      sample.valid?
      expect(sample.errors.full_messages).to include()
    end


  end
end
