class User < ApplicationRecord
  has_many :plants, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable

  has_one_attached :photo

  validates :nickName, :email, :password, :encrypted_password, presence: {
    message: "Feld darf nicht leer sein"
  }
  validates :nickName, length: { 
    in: 2..20,
    message: "Eingabe zwischen 2 und max. 20 Zeichen"
    }, 
    format: { 
    with: /\A[[:alpha:] \t\r\n\f]+\z/,
    message: "Nur Buchstaben des Alphabetes erlaubt"
  }
  validates :email, uniqueness: true
  validates :encrypted_password, length: { 
    minimum: 6,
    message: "Eingabe muss mind. 6 Zeichen haben"
    }

end
