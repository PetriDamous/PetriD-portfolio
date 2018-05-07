class Portfolio < ApplicationRecord
    include Placeholder
    has_many :technologies
    
    accepts_nested_attributes_for :technologies, 
                                   allow_destroy: true,
                                   reject_if: lambda {|attr| attr['name'].blank?}
    
    #validates :title, presence: true, length: {minimum: 3}
    #validates :subtitle, presence: true, length: {minimum: 3}
    validates_presence_of :title, :body
    #validates_presence_of :title, :body
    
    #Image Upload
    mount_uploader :thumb_image, PortfolioUploader
    mount_uploader :main_image, PortfolioUploader
    
    #Custom scope method way
    def self.javascript 
        where(subtitle: "Javascript")
    end
    
    #Custom scope lamda way
    scope :ruby_rails, -> {where(subtitle: "Ruby on Rails")}
    
    def self.by_position
        order("position ASC")
    end
end
