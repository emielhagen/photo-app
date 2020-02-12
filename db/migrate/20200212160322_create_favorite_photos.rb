class CreateFavoritePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_photos do |t|
      t.integer :user_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
