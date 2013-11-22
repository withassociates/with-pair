module ApplicationHelper
  DEFAULT_GRAVATAR_SIZE = 60

  def gravatar_tag(email, options = {})
    options[:size] ||= DEFAULT_GRAVATAR_SIZE
    image_tag(gravatar_url(email, options[:size]), options)
  end

  def gravatar_url(email, size = DEFAULT_GRAVATAR_SIZE)
    md5 = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{md5}.jpg?s=#{size}"
  end
end
