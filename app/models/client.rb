class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :company_name, :c_kana, :supervisor, :s_kana, :company_address, :tel, :email, presence: true
  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'client@example.com') do |client|
      client.password = SecureRandom.urlsafe_base64
      # client.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
