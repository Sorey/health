base_url = "http://#{request.host_with_port}"
xml.instruct! :xml, :version=>'1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url{
    xml.loc "#{base_url}"
    xml.changefreq("weekly")
    xml.priority(1.0)
  }
  xml.url{
    xml.loc("http://vinobliacms.vn.ua/news")
    xml.changefreq("daily")
    xml.priority(0.9)
  }
  xml.url{
    xml.loc("http://vinobliacms.vn.ua/videos")
    xml.changefreq("daily")
    xml.priority(0.9)
  }
  @news.each do |news|
    xml.url {
      xml.loc "#{show_one_news_url(news.id)}"
      xml.lastmod news.updated_at.strftime("%F")
      xml.changefreq("weekly")
      xml.priority(0.5)
    }
  end
  @videos.each do |video|
    xml.url {
      xml.loc "#{video_url(video.id)}"
      xml.lastmod video.updated_at.strftime("%F")
      xml.changefreq("weekly")
      xml.priority(0.5)
    }
  end
  @alias_articles.each do |alias_article|
    xml.url {
      xml.loc "http://vinobliacms.vn.ua/#{alias_article.alias}.html"
      xml.lastmod alias_article.updated_at.strftime("%F")
      xml.changefreq("weekly")
      xml.priority(0.5)
    }
  end
  if @group_articles
    @group_articles.each do |article|
      xml.url {
        xml.loc "http://vinobliacms.vn.ua/groups/regional_programs/#{article.title_english}"
        xml.lastmod article.updated_at.strftime("%F")
        xml.changefreq("monthly")
        xml.priority(0.5)
      }
    end
  end
  @medical_setups_groups.each do |group|
    xml.url {
      xml.loc "http://vinobliacms.vn.ua/medical_setups?category=#{group.ang_name}"
      # xml.lastmod group.updated_at.strftime("%F")
      xml.changefreq("monthly")
      xml.priority(0.5)
    }
  end
  xml.url{
    xml.loc("http://vinobliacms.vn.ua/statistic")
    xml.changefreq("monthly")
    xml.priority(0.5)
  }
  xml.url{
    xml.loc ("http://vinobliacms.vn.ua/groups/regional_programs")
    xml.changefreq("monthly")
    xml.priority(0.5)
  }
  xml.url{
    xml.loc ("http://vinobliacms.vn.ua/private_medical_setups")
    xml.changefreq("monthly")
    xml.priority(0.5)
  }

end