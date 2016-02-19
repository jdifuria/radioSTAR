class Station < ActiveRecord::Base
  has_many :users, dependent: :destroy
  has_many :charts, dependent: :destroy
  has_many :shows, dependent: :destroy

end
