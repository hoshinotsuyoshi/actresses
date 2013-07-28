class Photo
  include Mongoid::Document
  field :path, type: String
  field :url, type: String
  field :secure_url, type: String
  belongs_to :actress, :class_name=> 'Actress'
  field :release_date, type: DateTime

  scope :released   ,where(:release_date.lte => Time.now)
  scope :unreleased ,where(:release_date.gt  => Time.now)

end
