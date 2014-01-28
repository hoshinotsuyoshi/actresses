module ApplicationHelper
  def sp?
    ua = request.env["HTTP_USER_AGENT"]
    return false if ua.nil? # for request-test
    ua.include?('Mobile') || ua.include?('Android')
  end
end
