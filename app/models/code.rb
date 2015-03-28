class Code < ActiveRecord::Base
  has_many :submissions

  validates :title, presence: true
end
