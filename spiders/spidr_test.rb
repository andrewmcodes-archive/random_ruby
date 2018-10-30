require 'spidr'

Crawl = Struct.new(:url) do
  def crawler
    @crawler ||= Spidr.site(url)
  end

  def failed_urls
    Spidr.site(url) do |spider|
      spider.every_failed_url { |url| puts url }
    end
  end

  def url_map
    url_map = Hash.new { |hash, key| hash[key] = [] }
    crawler do |spider|
      spider.every_link do |origin, dest|
        url_map[dest] << origin
      end
    end

    puts url_map
  end

  def visited_urls
    puts "Visited URLS Count: #{crawler.visited_urls.count}"
    puts 'Visited URLS: '
    crawler.visited_urls.each do |url|
      puts url
    end
  end
end

crawler_obj = Crawl.new('https://www.onshorestudios.com/')
puts 'Visited URLS'
crawler_obj.visited_urls
puts 'URL Map'
crawler_obj.url_map
puts 'Failed URLs'
crawler_obj.failed_urls
