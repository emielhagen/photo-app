class Photo < ApplicationRecord
  belongs_to :album

  # validates :location, :cam_type, :exposure, :iso_speed, :foc_length, presence: true
  has_one_attached :image
end
