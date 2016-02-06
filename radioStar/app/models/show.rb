class Show < ActiveRecord::Base
  has_many :user_shows
  has_many :playlists, dependent: :destroy
end
