class Album < ApplicationRecord
  has_many :photos, dependent: :delete_all

  validates :name, presence: true, uniqueness: true
end
