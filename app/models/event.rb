class Event < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :client, optional: true
  belongs_to :product, optional: true
  #モジュールを取り込む記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アクティブハッシュ用rアソシエーション
  belongs_to_active_hash :num
  
  # バリデーション
  validates :start_time, presence: true #token
  validates :num_id, presence: true, numericality: { other_than: 0 }
  validates :price, presence: true, numericality: { other_than: 0 }

  # <ワード検索時の処理>
  def self.search(search)
    if search != ""
      Event.where('price LIKE(?)', "%#{search}%")
    else
      Event.all
    end
  end

  #決済機能 (後で詳しく設定する)
  attr_accessor :token



end
