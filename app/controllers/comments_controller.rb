class CommentsController < ApplicationController
    
    validates :content, presence: true, length: {minimum: 5, maximimum: 1000 }
    
    def create 
        @comment = current_user.comments.build(comment_params)
    end
    
    private 
    
    def comment_params
        params.require(:comment).permit(:content)
    end
end
