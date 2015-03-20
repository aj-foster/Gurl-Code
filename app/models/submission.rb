class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :code

  has_attached_file :graphic
  validates_attachment_content_type :graphic, :content_type => /\Aimage\/.*\Z/
end
