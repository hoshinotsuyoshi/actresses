module ApplicationHelper
  def sp?
    ua = request.env["HTTP_USER_AGENT"]
    ua.include?('Mobile') || ua.include?('Android')
  end
end
