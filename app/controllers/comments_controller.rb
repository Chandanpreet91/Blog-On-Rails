class CommentsController < ApplicationController
  before_action :authenticate_user!
    def create
          @post = Post.find params[:post_id]
          @comment = Comment.new params.require(:comment).permit(:body)
          @comment.post = @post
          @comment.user=current_user 
        
          if @comment.save
              redirect_to post_path(@post)
          else
              flash[:notice] = "Failed to create comment"
              render 'posts/show'
            end
    end
      
      def destroy
        @comment = Comment.find params[:id]
         if can?(:crud, @comment)
            @comment.delete
            redirect_to post_path(@comment.post)
         else
            head :unauthorized
            redirect_to root_path, alert: 'Not Authorized'
         end
      end
    
end
