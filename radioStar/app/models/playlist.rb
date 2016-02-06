class Playlist < ActiveRecord::Base
  belongs_to :show
  has_many :songs, dependent: :destroy

end
