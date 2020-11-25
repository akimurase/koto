class Event < ApplicationRecord
  belongs_to :user , optional: true #optionalはuserがなくても保存できてしまうので後で外す
  belongs_to :products, optional: true
  #モジュールを取り込む記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アクティブハッシュ用rアソシエーション
  belongs_to_active_hash :num
  



  # 後でバリデーション設定する :start_time,
  validates :num_id, presence: true

  #決済機能 (後で詳しく設定する)
  # attr_accessor :token



end
