require 'rails_helper'
describe PointsController, type: :request do

  before do
    @top = FactoryBot.create(:Point)

    describe "GET #index" do
      it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
        get root_path
        expect(response.status).to eq 200
      end
      it "indexアクションにリクエストするとレスポンスに投稿済みのnameが存在する" do 
        get root_path
        expect(response.body).to include @point.title
      end
      it "indexアクションにリクエストするとレスポンスに投稿済みtextが存在する" do 
        get root_path
        expect(response.body).to include @point.text
      end
    end
  end
end