module ApplicationHelper
  #取得した値にサムネ画像がなかった場合はsample.pngを付与する。
  def google_book_thumbnail(google_book)
    google_book['volumeInfo']['imageLinks'].nil? ? 'sample.png' : google_book['volumeInfo']['imageLinks']['thumbnail']
  end

  #必要な形式となるようデータを加工する。
  #thumbnailはネストしている配置なのでdigを使って取り出す。
  def set_google_book_params(google_book)
    google_book['volumeInfo']['bookImage'] = google_book.dig('volumeInfo', 'imageLinks', 'thumbnail')
    #volumeInfoの中が必要な項目のみになるようsliceを使って絞りこむ。
    google_book['volumeInfo'].slice('title', 'authors', 'publishedDate', 'infoLink', 'bookImage')
  end

  #タイトル設定
  def page_title(page_title = '', admin: false)
    base_title = if admin
                  'Hontobutai | 管理画面'
                else
                  'Hontobutai'
                end

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  #メタタグ設定
  def default_meta_tags
    {
      site: 'Hontubutai',
      title: '気になる地域が舞台となっている小説や漫画を探してみよう！',
      reverse: true,
      separator: '|',
      description: '「Hontobutai」は、気になる地域や思い入れのある地域が舞台となっている小説や漫画を探したい人向けの、本の検索・投稿サービスです。',
      keywords: ' Hontobutai',
      charset: 'UTF-8',
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      og: {
        site_name: 'Hontobutai',
        title: '気になる地域が舞台となっている小説や漫画を探してみよう！',
        description: '「Hontobutai」は、気になる地域や思い入れのある地域が舞台となっている小説や漫画を探したい人向けの、本の検索・投稿サービスです。',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@kame_maru01',
      },
    }
  end
end
