# coding: utf-8
require 'mongoid' #←workerが必要
class Actress
  include Mongoid::Document
  field :name, type: String
  field :text, type: String
  field :display, :type => String , :default=>"1"
  has_many :photos 

  scope :display, where(:display=>"1")

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
    photos.released.map{|p| p.url}[rand(4)]
  end

  def photos_urls
    photos.released.map{|p| p.url}
  end

  def page_size
    (photos.released.size.to_f / 8 ).ceil
  end

end
