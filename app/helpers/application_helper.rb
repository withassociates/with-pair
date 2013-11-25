module ApplicationHelper
  DEFAULT_GRAVATAR_SIZE = 60
  DEFAULT_SCREENHERO_URL = "http://screenhero.com"
  SESSION_ROW_DEFAULTS = { display_book_button: true }

  def gravatar_tag(email, options = {})
    size = options.fetch(:size) { DEFAULT_GRAVATAR_SIZE }
    options[:size] = "#{size}x#{size}"
    image_tag(gravatar_url(email, size), options)
  end

  def gravatar_url(email, size = DEFAULT_GRAVATAR_SIZE)
    md5 = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{md5}.jpg?s=#{size}"
  end

  def render_session_row(options = {})
    render("sessions/row", SESSION_ROW_DEFAULTS.merge(options))
  end

  def link_to_screenhero(text, url, options = {})
    link_to(text, url || DEFAULT_SCREENHERO_URL, options)
  end
end
