class LikesController < ApplicationController
    def index
        if params[:user_id]
            @likes = Like.select("likes.*").where(liker_id: params[:user_id])
        elsif params[:artwork_id]
            @likes = Like.select("likes.*").where(likeable_id: params[:artwork_id])
        elsif params[:comment_id]
            @likes = Like.select("likes.*").where(likeable_id: params[:comment_id])
        end
        render json: @comments
    end

    def create
        @like = Like.new(like_params)
        if @like.save
            render json: @like, status: :created
        else
            render json: @like.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @like = Like.find(params[:id])
        @like.destroy
        redirect_to likes_url
    end

    private

    def like_params
        params.require(:like).permit(:liker_id, :likeable_id)
    end
end
