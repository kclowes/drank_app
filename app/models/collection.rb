class Collection < ActiveRecord::Base
  has_many :wines, dependent: :destroy
  belongs_to :user
  validates :collection_name, presence: true
end