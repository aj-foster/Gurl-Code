class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :code

  has_attached_file :graphic
  do_not_validate_attachment_file_type :graphic
end
