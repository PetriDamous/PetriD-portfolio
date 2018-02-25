class Portfolio < ApplicationRecord
    #validates :title, presence: true, length: {minimum: 3}
    #validates :subtitle, presence: true, length: {minimum: 3}
    validates_presence_of :title, :body, :main_image, :thumb_image
    #validates_presence_of :title, :body
    
    #Custom scope method way
    def self.javascript 
        where(subtitle: "Javascript")
    end
    
    #Custom scope lamda way
    scope :ruby_rails, -> {where(subtitle: "Ruby on Rails")}
    
    #Sets defaults for images if there isn't any
    after_initialize :set_default
    
    def set_default
        self.main_image ||= "http://via.placeholder.com/600x400"
        self.thumb_image ||= "http://via.placeholder.com/350x200"
    end    
end
