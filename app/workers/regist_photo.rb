require 'tumblife'
require 'mechanize'
require "#{Rails.root}/app/models/tumblr_host"

class RegistPhoto
  @queue = :default

  def self.perform arg
    begin
      @actress_name = arg[0]
      @uri          = arg[1]
      @release_date = arg[2]
      upload_or_not = !Api.path_exist?(@uri)
      if upload_or_not
        self.upload 
        self.scrape_photo_url
        self.db_save
      end
      "upload:#{upload_or_not.to_s} #{@actress_name},#{@uri},#{@release_date}"
    rescue => e
      "Error: '#{e.backtrace.first} #{e.inspect}' #{@actress_name},#{@uri},#{@release_date}"
    end
  end
  private
  def self.upload(content_type="image/jpeg")
    mash = ::Tumblife.client.photo("#{TumblrHost}.tumblr.com",source: @uri)
    @mash_id = mash.id 
  end
  def self.scrape_photo_url
    agent,c,img = ::Mechanize.new,0,[]
    while c < 20 and img.empty? do 
      sleep 4
      agent.get  "http://#{TumblrHost}.tumblr.com/post/#{@mash_id.to_s}"
      xpath1 = '//*[@id="posts"]/li/section[@class="top media"]/img'
      xpath2 = '//*[@id="posts"]/li/section[@class="top media"]/a/img'
      if !(agent.page/(xpath1)).empty? 
        img = agent.page/(xpath1)
      else 
        img = agent.page/(xpath2)
      end
      if !img.empty? then
        @big_url = img.attr("src").value 
      end
      @secure_url = ""  
      c += 1
    end
  end
  def self.db_save
    @actress = Actress.find_or_create_by(name: @actress_name)
    @actress.release_date = @release_date
    @actress.save
    photo = Photo.new(path: @uri,url: @big_url.sub(/_1280\.jpg$/,"_400.jpg"), big_url: @big_url, secure_url: @secure_url, release_date: @release_date)
    photo.actress = @actress
    photo.save
  end

end
