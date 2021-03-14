require 'rails_helper'

RSpec.describe Top, type: :model do
  before do
    @top = FactoryBot.build(:top)
  end

  describe 'トップ投稿' do
    context '投稿がうまくいくとき' do
      it '動画、タイトルが存在すれば登録できる' do
        expect(@top).to be_valid
      end
    end
  end

  context "投稿がうまくいかない時" do
    it "video_topが空では登録できない" do
      @top.video_top = nil
      @top.valid?
      expect(@top.errors.full_messages).to include("動画を入力してください")
    end
    it "titleが空では登録できない" do
      @top.title = ""
      @top.valid?
      expect(@top.errors.full_messages).to include("動画を入力してください")
    end
  end
end
