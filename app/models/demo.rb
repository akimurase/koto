class Demo < ApplicationRecord
  attr_accessor :token
  belongs_to :sample, optional: true
  #モジュールを取り込む記述
  extend ActiveHash::Associations::ActiveRecordExtensions
  # アクティブハッシュ用rアソシエーション
  belongs_to_active_hash :num

  validates :token, presence: true, on: :create
  validates :start_time, presence: true
  validates :num_id, presence: true, numericality: { other_than: 0 }
  validates :price, presence: true, numericality: { other_than: 0 }
end
