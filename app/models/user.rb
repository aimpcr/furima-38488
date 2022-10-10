class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true

  validates :password,  format: { with: /\A[a-z0-9]+\z/i }

  validates :family_name,presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name,presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

  validates :kana_family_name,presence: true, format: { with: / \A [ァガー－]+ \z / }
  validates :kana_first_name,presence: true, format: { with: / \A [ァガー－]+ \z / }

end
