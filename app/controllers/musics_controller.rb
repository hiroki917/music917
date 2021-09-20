class MusicsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy, :update]
  
  def index
  end

  def new
    @music = Music.new
  end

  def create
  end

  private
  
  def music_params
    params.require(:music).permit(:name, :text, :genre_id, :phrase, :image).merge(user_id: current_user.id)
  end

end
