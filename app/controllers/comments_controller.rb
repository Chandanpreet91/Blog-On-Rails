class CommentsController < ApplicationController

    def create
        @post = Post.find params[:post_id]
        @comment = Comment.new params.require(:comment).permit(:title, :body)
        @comment.post = @post
        
        if @comment.save
          redirect_to post_path(@post)
        else
          flash[:notice] = "Failed to create comment"
        end
      end
      
      def destroy
        @comment = Comment.find params[:id]
        @comment.delete
        redirect_to post_path(@comment.post)
      end
    
end
