class PhotosController < ApplicationController
  before_action :set_photo, only: %i[show edit update destroy]

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @album = Album.find(params[:album_id])
    @photo = Photo.new
  end

  def create
    @album = Album.find(params[:album_id])
    @photo = Photo.new(photo_params)
    @photo.album = @album

    if @photo.save
      redirect_to album_path(@album)
    else
      render :index
    end
  end

  def edit
    @album = @photo.album
  end

  def update
    @photo.update(photo_params)

    if @photo.save
      redirect_to album_path(@photo.album)
    else
      render :index
    end
  end

  def destroy
    @photo.delete

    redirect_to album_path(@photo.album)
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:location, :cam_type, :exposure, :iso_speed, :foc_length, :image)
  end
end
