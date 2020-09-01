class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  
  zenkaku = /\A[ぁ-んァ-ン一-龥]/
  kana = /\A[ァ-ヶー－]+\z/
  
  with_options presence: true do
  validates :nickname
  validates :first_name, format: { with: zenkaku, message: 'は全角で入力してください。' }
  validates :last_name, format: { with: zenkaku, message: 'は全角で入力してください。' }
  validates :first_name_kana, format: { with: kana, message: 'は全角カタカナで入力して下さい。' }
  validates :last_name_kana, format: { with: kana, message: 'は全角カタカナで入力して下さい。' }
  validates :birth_date
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は英数字混同で入力してください' }
end
