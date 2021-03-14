require 'rails_helper'
describe ItinerarysController, type: :request do

  before do
    @itinerarie = FactoryBot.create(:itineraries)

    describe "GET #index" do
      it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
        get root_path
        expect(response.status).to eq 200
      end
      it "indexアクションにリクエストするとレスポンスに投稿済みのtimeが存在する" do 
        get root_path
        expect(response.body).to include @itinerarie.time
      end
      it "indexアクションにリクエストするとレスポンスに投稿済みtitleが存在する" do 
        get root_path
        expect(response.body).to include @itinerarie.title
      end
      it "indexアクションにリクエストするとレスポンスに投稿済みtextが存在する" do 
        get root_path
        expect(response.body).to include @itinerarie.text
      end
    end
  end
end