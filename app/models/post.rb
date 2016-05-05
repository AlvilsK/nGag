class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :categories
  has_many :comments
  
  has_attached_file :post_img, styles: { medium: "500x900x", thumb: "280x210^#" }, default_url: "http://vietnam.mpt.org/s/photogallery/img/no-image-available.jpg"
  validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\Z/
  validates :post_img, attachment_presence: true
  validates_with AttachmentPresenceValidator, attributes: :post_img
  validates_with AttachmentSizeValidator, attributes: :post_img, less_than: 100.megabytes
end
