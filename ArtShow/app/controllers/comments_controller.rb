class CommentsController < ApplicationController
    def index
        p params
        if params[:user_id]
            @comments = Comment.select("comments.*").where(author_id: params[:user_id])
        elsif params[:artwork_id]
            @comments = Comment.select("comments.*").where(artwork_id: params[:artwork_id])
        end
        render json: @comments
    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            render json: @comment, status: :created
        else
            render json: @comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to comments_url
    end

    private

    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id, :body)
    end
end
