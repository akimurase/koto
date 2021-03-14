require 'rails_helper'
describe TopsController, type: :request do

  before do
    @top = FactoryBot.create(:top)

    describe "GET #index" do
      it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
        get root_path
        expect(response.status).to eq 200
      end
      it "indexアクションにリクエストするとレスポンスに登録済み動画のが存在する" do 
        get root_path
        expect(response.body).to include @top.video_top
      end
      it "indexアクションにリクエストするとレスポンスに登録済みtitleが存在する" do 
        get root_path
        expect(response.body).to include @top.title
      end
    end
  end
end