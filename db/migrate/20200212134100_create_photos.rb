class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :album_id
      t.string :location
      t.string :cam_type
      t.string :exposure
      t.string :iso_speed
      t.string :foc_length

      t.timestamps
    end
  end
end
