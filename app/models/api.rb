class Api
  def self.create! opt=nil
    Response.build opt
  end
  class Response
    def self.build opt=nil
      #(@body ||= {})[:error] = ""
      @body ||= {}
    end
  end
end
