class Portfolio < ApplicationRecord
    include Placeholder
    has_many :technologies
    
    accepts_nested_attributes_for :technologies, 
                                   reject_if: lambda {|attr| attr['name'].blank?}
    
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
        self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
        self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
    end
    
    def self.by_position
        order("position ASC")
    end
end
