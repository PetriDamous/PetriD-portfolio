class Portfolio < ApplicationRecord
    #validates :title, presence: true, length: {minimum: 3}
    #validates :subtitle, presence: true, length: {minimum: 3}
    #validates_presence_of :body, :main_image, :thumb_image
    validates_presence_of :title, :body
end
