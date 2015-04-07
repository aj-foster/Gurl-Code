class Submission < ActiveRecord::Base
  belongs_to :user
  belongs_to :code

  has_attached_file :graphic, {
    url: "/system/:class/:attachment/:id_partition/:style/:hash.:extension",
    hash_secret: "4970dd92b6944521c909e80ed06be1ca86007"
  }

  validates :graphic, attachment_presence: true
  validates_attachment_content_type :graphic, content_type: /\Aimage\/.*\Z/

  def has_socials?
    self.behance.present?   ||
    self.dribbble.present?  ||
    self.facebook.present?  ||
    self.pinterest.present? ||
    self.twitter.present?
  end
end
