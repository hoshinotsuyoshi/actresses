# coding: utf-8
require 'mongoid' 
class Tag
  include Mongoid::Document
  field :name, type: String
  validates :name, uniqueness: true
  field :_id, type: String, default: ->{ name }
  
  field :text, type: String
  has_and_belongs_to_many :actresses
  def photos
    actresses.to_a.map{|a|a.photos.released}.flatten
  end

  def photos_sort_by_points
    photos.sort_by{|p|p.point}.reverse
  end

  def page_size
    (photos.size.to_f / 8 ).ceil
  end

end
