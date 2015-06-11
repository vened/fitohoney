xml.instruct!
xml.rss version: '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    
    xml.title 'Fitohoney'
    xml.description 'Интернет магазин меда и здорового питания Fitohoney'
    xml.link root_url
    xml.language 'ru'
    xml.tag! 'atom:link', rel: 'self', type: 'application/rss+xml', href: 'home/rss'

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.link "#{root_url}posts/#{post.path}"
        xml.pubDate(post.created_at.rfc2822)
        xml.guid "#{root_url}posts/#{post.path}"
        xml.description(h(post.prev))
      end
    end

  end
end