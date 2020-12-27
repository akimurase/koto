class Event < ApplicationRecord
  belongs_to :user #, optional: true #optionalはuserがなくても保存できてしまうので後で外す
  belongs_to :client #, optional: true #optionalはclientがなくても保存できてしまうので後で外す
  belongs_to :product, foreign_key: 'client_id'#3,optional: true
  #モジュールを取り込む記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アクティブハッシュ用rアソシエーション
  belongs_to_active_hash :num
  
  # 後でバリデーション設定する :start_time,
  # validates :num_id, :start_time, :price, presence: true #token
  validates :num_id, presence: true #token
  validates :price, presence: true #token
  validates :start_time, presence: true #token

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
