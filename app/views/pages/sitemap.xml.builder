xml.instruct!
xml.urlset(:xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9") do


  xml.url do
    xml.loc @url + '/catalog'
    xml.priority 1
  end

  @products.each do |item|
    xml.url do
      xml.loc @url + item.full_path
      xml.lastmod item.updated_at.strftime("%Y-%m-%d")
      xml.priority 1
    end
  end


  xml.url do
    xml.loc @url
    xml.lastmod '2015-06-03'
    xml.priority 0.8
  end
  

  xml.url do
    xml.loc @url + '/feedbacks'
    xml.priority 0.7
  end

  @feedbacks.each do |item|
    xml.url do
      xml.loc @url + '/feedbacks/' + item.id
      xml.lastmod item.updated_at.strftime("%Y-%m-%d")
      xml.priority 0.7
    end
  end

  xml.url do
    xml.loc @url + '/about'
    xml.priority 0.7
  end

  xml.url do
    xml.loc @url + '/delivery'
    xml.priority 0.7
  end


end
