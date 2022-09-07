class BookCommentsController < ApplicationController
    
    def create
        book = Bookfind(params[:book_id])
        comment = current_user.book_comments.new(book_comment_params)
        comment.book_id = book.id
        comment.save
        redirect_to request.referer
    end
    
    def destroy
        BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
        redirect_to referer
    end
    
    private
    def book_commit_params
        params.request(:book_comment).permit(:comment)
    end
    
end
