class Api
  def self.create!(opt=nil)
    Response.build opt
  end
  def self.path_exist? path
    return nil unless path
    Photo.where(path: path).size.zero?.!
  end
  class Response
    def self.build(opt=nil)
      @response = {}
      return @response unless opt
      @response[:error] = Api.path_exist?(opt[:path]) ? "found" : ""
      @response
    end
  end
end
