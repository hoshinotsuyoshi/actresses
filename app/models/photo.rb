class Photo
  include Mongoid::Document
  field :path, type: String
  field :url, type: String
  field :secure_url, type: String
  belongs_to :actress
end
