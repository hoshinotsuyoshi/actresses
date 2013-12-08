# coding: utf-8
class AdminController < ApplicationController

  def index
    @actresses = Actress.all.sort_by{|a|a.name}
    @released = Photo.released
    @unreleased = Photo.unreleased
    @tags = Tag.all
  end

  def regist_similar
    redirect_to admin_path if params[:name].blank?
    actress = Actress.where(:name=>params[:name]).first
    redirect_to admin_path if !actress
    array = [params[:act01],params[:act02],params[:act03],params[:act04],params[:act05]].select{|e| !e.blank?}
    while !array.empty? do
      actress2 = Actress.where(:name=>array.shift).first
      next if !actress2
      similar_regist actress ,actress2
      similar_regist actress2,actress
    end
    redirect_to admin_path
  end

  private
  def similar_regist subject,object
    subject.similars.push object
    subject.similars.uniq!
    subject.save
  end

  public
  def regist_tag
    redirect_to admin_path if params[:name].blank?
    tag = Tag.where(:name=>params[:name]).first
    redirect_to admin_path if !tag
    array = [params[:act01],params[:act02],params[:act03],params[:act04],params[:act05]].select{|e| !e.blank?}
    while !array.empty? do
      actress = Actress.where(:name=>array.shift).first
      next if !actress
      tag_regist tag ,actress
    end
    redirect_to admin_path
  end
  private
  def tag_regist subject,object
    subject.actresses.push object
    subject.actresses.uniq!
    subject.save
  end

end
