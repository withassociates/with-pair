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
    "http://www.gravatar.com/avatar/#{md5}.jpg?s=#{size}&d=#{asset_url 'gravatar_fallback.png'}"
  end

  def render_session_row(options = {})
    render("sessions/row", SESSION_ROW_DEFAULTS.merge(options))
  end

  def render_person_row(options = {})
    render("people/row", options)
  end

  def link_to_screenhero(text, url, options = {})
    link_to(text, url || DEFAULT_SCREENHERO_URL, options)
  end

  def session_time_tags(s)
    session_start_tag(s) + '–' + session_end_tag(s)
  end

  def session_start_tag(s)
    time_tag(s.starts_at, l(s.starts_at, format: :calendar))
  end

  def session_end_tag(s)
    time_tag(s.ends_at, l(s.ends_at, format: :time))
  end
end
