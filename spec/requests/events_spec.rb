require 'rails_helper'
describe EventsController, type: :request do

  before do
    @event = FactoryBot.create(:events)

    describe "GET #index" do
      it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
        get root_path
        expect(response.status).to eq 200
      end
      it "indexアクションにリクエストするとレスポンスに登録済みのユーザーnameが存在する" do 
        get root_path
        expect(response.body).to include @event.user_name
      end
      it "indexアクションにリクエストするとレスポンスに登録済みのユーザーカナが存在する" do 
        get root_path
        expect(response.body).to include @event.user_kana
      end
      it "indexアクションにリクエストするとレスポンスに登録済みメールが存在する" do 
        get root_path
        expect(response.body).to include @event.user_email
      end
      it "indexアクションにリクエストするとレスポンスに登録済みtelが存在する" do 
        get root_path
        expect(response.body).to include @event.user_tel
      end
      it "indexアクションにリクエストするとレスポンスに登録済み商品名が存在する" do 
        get root_path
        expect(response.body).to include @event.product_name
      end
      it "indexアクションにリクエストするとレスポンスに登録済み金額が存在する" do 
        get root_path
        expect(response.body).to include @event.price
      end
      it "indexアクションにリクエストするとレスポンスに登録済みナンバーが存在する" do 
        get root_path
        expect(response.body).to include @event.num_id
      end
      it "indexアクションにリクエストするとレスポンスに登録済み予約日が存在する" do 
        get root_path
        expect(response.body).to include @event.start_time
      end
    end
  end
end