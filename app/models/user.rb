class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      # <ワード検索時の処理>
  def self.search(search)
    if search != ""
      User.where('name LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end
end
