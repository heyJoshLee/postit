module ApplicationHelper

  def fix_post_url (url)
    if url.start_with?("www.")
      "http://#{url}"
    elsif url.start_with?("http://")
      url
    else
      "http://www.#{url}"
    end
  end
end
