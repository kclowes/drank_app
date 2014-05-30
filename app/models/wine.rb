class Wine < ActiveRecord::Base
  belongs_to :collection
  mount_uploader :wine_image, WineImageUploader
end