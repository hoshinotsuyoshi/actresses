# coding: utf-8
class SitemapController < ApplicationController
  def index
    @actresses   = Actress.all
    @tags        = Tag.all
    @photos      = Photo.all
    respond_to do |format|
      format.xml
    end
  end
end
