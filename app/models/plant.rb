class Plant < ApplicationRecord
    belongs_to :user
    has_one_attached :image

    validates :realName, :nickName, :waterNeed, :waterCurrent, :sunNeed, :place, :love, presence: {
        message: "Feld darf nicht leer sein"
        }
    validates :realName, :nickName, :place, length: { 
        in: 2..20,
        message: "Eingabe zwischen 2 und max. 20 Zeichen"
        }, 
        format: { 
        with: /\A[[:alpha:] \t\r\n\f]+\z/,
        message: "Nur Buchstaben des Alphabetes erlaubt"
      }
    validates :waterNeed, :waterCurrent, numericality: {
        only_integer: true, greater_than: 0, less_than: 10000,
        message: "Nur Zahlen zwischen 0 und 10000 erlaubt"
    }
    validates :love, numericality: {
        only_integer: true, greater_than: 0, less_than: 11,
        message: "Nur Zahlen zwischen 0 und 10 erlaubt"
    }
    validates :sunNeed, numericality: { 
        reater_than: 0, less_than: 25,
        message: "Nur Zahlen zwischen  0 und 25 erlaubt"
    }

end
