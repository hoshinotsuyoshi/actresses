# coding: utf-8
class Actress
  include Mongoid::Document
  field :name, type: String
  field :text, type: String
  field :display, :type => Boolean , :default=>true
  has_many :photos 
  has_and_belongs_to_many :similar_actresses

  def thumbnail_rand
    photos.map{|p| p.url}[rand(4)]
  end

  def photos_urls
    photos.map{|p| p.url}
  end

  def page_size
    (photos.size.to_f / 8 ).ceil
  end

end
