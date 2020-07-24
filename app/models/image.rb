class Image
  include Mongoid::Document
  include Mongoid::Timestamps
  include ImageUploader::Attachment(:image)
  field :description, type: String
  field :image_data, type: String
  embedded_in :user
  validates_presence_of :image
end
