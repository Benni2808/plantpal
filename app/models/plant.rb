# frozen_string_literal: true

class Plant < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :realName, :nickName, :waterNeed, :waterCurrent, :sunNeed, :place, :love, presence: {
    message: 'Feld darf nicht leer sein'
  }
  validates :realName, :nickName, :place, length: {
    in: 2..20,
    message: 'Eingabe zwischen 2 und max. 20 Zeichen'
  }, format: {
    with: /\A[[:alpha:] \t\r\n\f]+\z/,
    message: 'Nur Buchstaben des Alphabetes erlaubt'
  }
  validates :waterNeed, :waterCurrent, numericality: {
    only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10_000,
    message: 'Nur Zahlen zwischen 0 und 10000 erlaubt'
  }
  validates :waterCurrent, numericality: {
    less_than_or_equal_to: :waterNeed,
    message: 'Der aktuelle Wasserstand darf nicht größer als der Wasserstand pro Woche'
  }
  validates :love, numericality: {
    only_integer: true, greater_than: -1, less_than: 11,
    message: 'Nur Zahlen zwischen 0 und 10 erlaubt'
  }
  validates :sunNeed, numericality: {
    reater_than: 0, less_than: 25,
    message: 'Nur Zahlen zwischen  0 und 25 erlaubt'
  }
  # validates :image, allow_blank: true, format: {
  #   with: /\.(jpg|png|gif|bmp)/, # %r{\.gif|jpg|png|jpeg}i,
  #   message: 'Bild muss im jpg, jpeg, png oder gif Format sein du dummi 😜'
  # }
end
