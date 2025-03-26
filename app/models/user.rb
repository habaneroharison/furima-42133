class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: { message: "can't be blank" }
         
         validates :password,  format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "is invalid. Include both letters and numbers" }

         validates :birth_day_date, presence: { message: "can't be blank" }
       
         validates :last_name, presence: { message: "can't be blank" },
                               format: { with: /\A[一-龯ぁ-んァ-ヶー々]+\z/, message: "is invalid. Input full-width characters" }
         validates :first_name, presence: { message: "can't be blank" },
                                format: { with: /\A[一-龯ぁ-んァ-ヶー々]+\z/, message: "is invalid. Input full-width characters" }
         validates :last_name_kana, presence: { message: "can't be blank" },
                                    format: { with: /\A[ァ-ヶー]+\z/, message: "Input full-width katakana characters" }
         validates :first_name_kana, presence: { message: "can't be blank" },
                                     format: { with: /\A[ァ-ヶー]+\z/, message: "Input full-width katakana characters" }
       end


