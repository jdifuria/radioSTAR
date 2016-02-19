class Chart < ActiveRecord::Base
  belongs_to :station
  has_many :songs, dependent: :destroy
end
