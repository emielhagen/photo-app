class FavoritePhotosController < ApplicationController
  def index
    @favorite_photos = Photo.joins(:favorite_photos).where('favorite_photos.user_id = ?', current_user.id)
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @favorite_photo = FavoritePhoto.new(photo: @photo, user: current_user)
    @favorite_photo.save

    respond_to do |format|
      format.html { redirect_to album_path(@photo.album) }
      format.js
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    FavoritePhoto.find_by(photo: @photo, user: current_user).delete

    respond_to do |format|
      format.html { redirect_to album_path(@photo.album) }
      format.js { render :create }
    end
  end
end
