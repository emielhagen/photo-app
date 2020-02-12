class FavoritePhotosController < ApplicationController
  def index
    @favorite_photos = Photo.where(favorite: true)
  end

  def create
    @photo = Photo.find(params[:photo_id])

    @photo.update(favorite: true)

    respond_to do |format|
      format.html { redirect_to album_path(@photo.album) }
      format.js
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    @photo.update(favorite: false)

    respond_to do |format|
      format.html { redirect_to album_path(@photo.album) }
      format.js { render :create }
    end
  end
end
