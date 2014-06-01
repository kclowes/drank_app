class Collection < ActiveRecord::Base
  has_many :wines
  belongs_to :user
  validates :collection_name, presence: true
end