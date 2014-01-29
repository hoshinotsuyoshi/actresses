# coding: utf-8
class Photo
  include Mongoid::Document
  field :path, type: String
  field :url, type: String
  field :secure_url, type: String
  field :big_url, type: String
  belongs_to :actress, class_name: 'Actress'
  field :release_date, type: Time
  field :point, type: Integer, default: 0

  scope :released   , ->{where(:release_date.lte => Time.zone.now)}
  scope :unreleased , ->{where(:release_date.gt  => Time.zone.now)}

  # 5days latest
  scope :latest , ->{between(release_date: ((Time.now-60*60*24*5)..(Time.now)))}

  def index
    actress.photos_sort_by_points.index(self)
  end

  def actress_photos_size
    actress.photos.released.size
  end

  def self.table(sym=:latest)
    self.group(sym).map{|k,v|{:name=>k[0].name,:date=>k[1].to_s,:size=>v.size}}
  end

  private
  def self.group(sym)
    self.send(sym).group_by{|p| [p.actress,p.release_date]}
  end

end
