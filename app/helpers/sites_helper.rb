module SitesHelper
  def top_sites(small_category_id)
    Site.where(small_category_id: small_category_id).limit(3)
  end
end
