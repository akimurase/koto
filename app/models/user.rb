class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :kana, :email, :tel, presence: true

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'user@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
      # <ワード検索時の処理>
  def self.search(search)
    if search != ""
      User.where('name LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end
end
