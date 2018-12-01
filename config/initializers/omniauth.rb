# Rails.application.config.middleware.use OmniAuth::Builder do
#     provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
# end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET'],
  # OmniAuth.config.on_failure = UsersController.action(:oauth_failure)
  #prompt part so user gets prompted each time
  {
      # client_id: 716852772616-ve9st1glged32a4l5aanoicfnunhrpde.apps.googleusercontent.com,
      scope: 'userinfo.email, userinfo.profile, plus.me, http://gdata.youtube.com',
      prompt: 'select_account',
      image_aspect_ratio: 'square',
      image_size: 50
    }
end