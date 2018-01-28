class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice]="You are now friend!"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert]=@friendship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    if @friendship.destroy
      flash[:notice]="Friendship deleted!"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert]=@friendship.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end
end
