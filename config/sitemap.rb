# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://hontobutai.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['AWS_S3_BUCKET_NAME']}/"

SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(
  fog_region: 'ap-northeast-1',
  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
)

SitemapGenerator::Sitemap.create do
  # トップページ
  add root_path, priority: 1.0
  # 投稿一覧
  add books_path, :priority => 0.7, :changefreq => 'daily'
  # 投稿詳細ページ
  Book.find_each do |book|
    add book_path(book), :lastmod => book.updated_at
  end
end
