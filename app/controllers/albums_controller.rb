class AlbumsController < ApplicationController
  before_action :set_album, only: %i[show update edit destroy]

  def index
    @albums = Album.all
  end

  def show
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_path(@album)
    else
      render :index
    end
  end

  def edit
  end

  def update
    @album.update(album_params)

    if @album.save
      redirect_to albums_path
    else
      render :index
    end
  end

  def destroy
    @album.delete

    redirect_to albums_path
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name)
  end
end
