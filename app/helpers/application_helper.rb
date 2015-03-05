module ApplicationHelper
  DEFAULT_GRAVATAR_SIZE = 60
  DEFAULT_SCREENHERO_URL = "http://screenhero.com"
  GRAVATAR_FALLBACKS = {
    wa: 'gravatar_fallback_wa.png',
    you: 'gravatar_fallback_you.png',
    other: nil,
  }

  def gravatar_tag(email, fallback, options = {})
    size = options.fetch(:size) { DEFAULT_GRAVATAR_SIZE }
    fallback_image = GRAVATAR_FALLBACKS.fetch(fallback)
    options[:size] = "#{size}x#{size}"
    image_tag(gravatar_url(email, fallback_image, size), options)
  end

  def gravatar_url(email, fallback_image, size = DEFAULT_GRAVATAR_SIZE)
    md5 = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{md5}.jpg?s=#{size}&d=#{asset_url fallback_image}"
  end

  def render_session_row(options = {})
    render("sessions/row", options)
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
