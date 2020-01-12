module PosesHelper
  def pre_referrer
    path = Rails.application.routes.recognize_path(request.referer)
    path[:controller] == "diaries" and path[:action] == "new"
  end
end
