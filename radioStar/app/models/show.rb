class Show < ActiveRecord::Base
  belongs_to :station
  has_many :user_shows
  has_many :playlists, dependent: :destroy
end
