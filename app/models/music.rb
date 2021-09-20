class Music < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  
  with_options presence: true do 
    validates :name
    validates :phrase
    validates :text
    validates :genre_id
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :genre_id
  end
end
