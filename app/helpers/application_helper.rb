module ApplicationHelper
  def avatar_url
    gravatar_id = Digest::MD5::hexdigest(ENV['EMAIL']).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def top_sites(small_category_id)
    Site.where(small_category_id: small_category_id).limit(3)
  end

  def copyright_year
    case Time.now.year
    when 2015 then '2015'
    else
      '2015 - ' + Time.now.year.to_s
    end
  end
end
