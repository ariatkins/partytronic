Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '183048925162409', '17a78187753b46d6559656fadb16d29a'
end
