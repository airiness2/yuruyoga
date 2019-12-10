class MyFailureApp < Devise::FailureApp
  def route(scope)
    :top_url
  end
end
