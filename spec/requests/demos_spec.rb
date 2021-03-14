require 'rails_helper'
describe DemosController, type: :request do

  before do
    @demo = FactoryBot.create(:demo)

#   describe "GET #index" do
#     it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
#       get root_path
#       expect(response.status).to eq 200
#     end
#     it "indexアクションにリクエストするとレスポンスに登録済みsample名のが存在する" do 
#       get root_path
#       expect(response.body).to include @demo.sample_name
#     end
#     it "indexアクションにリクエストするとレスポンスに登録済みsample名kanaのが存在する" do 
#       get root_path
#       expect(response.body).to include @demo.sample_kana
#     end
#     it "indexアクションにリクエストするとレスポンスに登録済みsampleメールが存在する" do 
#       get root_path
#       expect(response.body).to include @demo.sample_email
#     end
#     it "indexアクションにリクエストするとレスポンスに登録済みsampleのtel番号が存在する" do 
#       get root_path
#       expect(response.body).to include @demo.sample_tel
#     end
#     it "indexアクションにリクエストするとレスポンスに登録済みsampleの商品名が存在する" do 
#       get root_path
#       expect(response.body).to include @demo.sample_product_name
#     end
#     it "indexアクションにリクエストするとレスポンスに登録済みsampleの料金が存在する" do 
#       get root_path
#       expect(response.body).to include @demo.price
#     end
#     it "indexアクションにリクエストするとレスポンスに登録済みsampleのナンバーidが存在する" do 
#       get root_path
#       expect(response.body).to include @demo.num_id
#     end
#   end
# end

#     describe "GET #home" do
#       it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
#         get root_path
#         expect(response.status).to eq 200
#       end
#       it "indexアクションにリクエストするとレスポンスに登録済みsample名のが存在する" do 
#         get root_path
#         expect(response.body).to include @demo.sample_name
#       end
#       it "indexアクションにリクエストするとレスポンスに登録済みsample名kanaのが存在する" do 
#         get root_path
#         expect(response.body).to include @demo.sample_kana
#       end
#       it "indexアクションにリクエストするとレスポンスに登録済みsampleメールが存在する" do 
#         get root_path
#         expect(response.body).to include @demo.sample_email
#       end
#       it "indexアクションにリクエストするとレスポンスに登録済みsampleのtel番号が存在する" do 
#         get root_path
#         expect(response.body).to include @demo.sample_tel
#       end
#       it "indexアクションにリクエストするとレスポンスに登録済みsampleの商品名が存在する" do 
#         get root_path
#         expect(response.body).to include @demo.sample_product_name
#       end
#       it "indexアクションにリクエストするとレスポンスに登録済みsampleの料金が存在する" do 
#         get root_path
#         expect(response.body).to include @demo.price
#       end
#       it "indexアクションにリクエストするとレスポンスに登録済みsampleのナンバーidが存在する" do 
#         get root_path
#         expect(response.body).to include @demo.num_id
#       end
#     end
#   end
# end

    describe "GET #about" do
      it "indexアクションにリクエストすると正常にレスポンスが返ってくる" do 
        get root_path
        expect(response.status).to eq 200
      end
      it "indexアクションにリクエストするとレスポンスに登録済みsample名のが存在する" do 
        get root_path
        expect(response.body).to include @demo.sample_name
      end
      it "indexアクションにリクエストするとレスポンスに登録済みsample名kanaのが存在する" do 
        get root_path
        expect(response.body).to include @demo.sample_kana
      end
      it "indexアクションにリクエストするとレスポンスに登録済みsampleメールが存在する" do 
        get root_path
        expect(response.body).to include @demo.sample_email
      end
      it "indexアクションにリクエストするとレスポンスに登録済みsampleのtel番号が存在する" do 
        get root_path
        expect(response.body).to include @demo.sample_tel
      end
      it "indexアクションにリクエストするとレスポンスに登録済みsampleの商品名が存在する" do 
        get root_path
        expect(response.body).to include @demo.sample_product_name
      end
      it "indexアクションにリクエストするとレスポンスに登録済みsampleの料金が存在する" do 
        get root_path
        expect(response.body).to include @demo.price
      end
      it "indexアクションにリクエストするとレスポンスに登録済みsampleのナンバーidが存在する" do 
        get root_path
        expect(response.body).to include @demo.num_id
      end
    end
  end
end