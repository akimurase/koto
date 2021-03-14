require 'rails_helper'
describe ProductsController, type: :request do

  before do
    @top = FactoryBot.create(:Product)

    describe "GET #index" do
      it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
        get root_path
        expect(response.status).to eq 200
      end
      it "indexアクションにリクエストするとレスポンスに投稿済みのnameが存在する" do 
        get root_path
        expect(response.body).to include @product.name
      end
      it "indexアクションにリクエストするとレスポンスに投稿済みtextが存在する" do 
        get root_path
        expect(response.body).to include @product.text
      end
      it "indexアクションにリクエストするとレスポンスに投稿済みtitleが存在する" do 
        get root_path
        expect(response.body).to include @product.title
      end
      it "indexアクションにリクエストするとレスポンスに投稿済み金額が存在する" do 
        get root_path
        expect(response.body).to include @product.price
      end
      it "indexアクションにリクエストするとレスポンスに投稿済み単位が存在する" do 
        get root_path
        expect(response.body).to include @product.uniut
      end
    end
  end
end