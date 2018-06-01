class Blog < ApplicationRecord
    enum status: { draft: 0, published: 1 }
    extend FriendlyId
    friendly_id :title, use: :slugged
    validates :title, presence: true, length: {minimum: 3}
    validates_presence_of :body, :topic_id
    has_many :comments, dependent: :destroy
    
    
    
    def self.recent
        order("created_at DESC")
    end
    
end
