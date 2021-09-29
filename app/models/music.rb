class Music < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image

  with_options presence: true do 
    validates :name
    validates :phrase
    validates :text
    validates :genre_id
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :genre_id
  end
end
