class MusicsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy, :update]
  before_action :set_music, only: [:update,:edit,:show]
  def index
    @musics =Music.all
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
    if @music.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @music.comments
  end

  def edit
  end

  def update 
   if @music.update(music_params)
    redirect_to @music
   else
    render :edit
   end
  end

  def destroy
    @music = Music.find(params[:id])
    redirect_to root_path  if @music.delete
  end
  private
  
  def music_params
    params.require(:music).permit(:name, :text, :genre_id, :phrase, :image).merge(user_id: current_user.id)
  end

   def set_music
    @music = Music.find(params[:id])
   end

end
