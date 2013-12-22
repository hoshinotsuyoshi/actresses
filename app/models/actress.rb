# coding: utf-8
require 'mongoid' #←workerが必要
class Actress
  include Mongoid::Document
  field :name, type: String
  validates :name, uniqueness: true
  field :_id, type: String, default: ->{ name }

  field :text, type: String
  field :display, :type => String , :default=>"1"
  has_many :photos 
  has_and_belongs_to_many :tags

  scope :display, where(:display=>"1")

  field :release_date, type: DateTime
  scope :released   ,where(:release_date.lte => Time.zone.now)
  scope :unreleased ,where(:release_date.gt  => Time.zone.now)

  #similar
  #mongoid2(resque-web、rails3)だと自己参照がうまく行えない。。。
  if defined?(::Rails) 
    if ::Rails.version == "4.0.0"
      field :actress_id, type: Actress
      has_many :similars, :class_name => 'Actress', :foreign_key => :actress_id 
      #↓要る
      belongs_to :actress, :class_name => 'Actress', :foreign_key => :actress_id 
    end
  end

  def thumbnail_rand
    photos_sort_by_points.map(&:url)[rand(4)]
  end

  def photos_sort_by_points
    photos.released.sort_by(&:point).reverse
  end

  def photos_sort_by_release_date
    photos.released.sort_by(&:release_date)
  end

  def page_size
    (photos.released.size.to_f / 8 ).ceil
  end

end
