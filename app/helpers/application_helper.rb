module ApplicationHelper
  def google_book_thumbnail(google_book)
    google_book['volumeInfo']['imageLinks'].nil? ? 'sample.png' : google_book['volumeInfo']['imageLinks']['thumbnail']
  end

  def set_google_book_params(google_book)
    google_book['volumeInfo']['bookImage'] = google_book.dig('volumeInfo', 'imageLinks', 'thumbnail')
    google_book['volumeInfo'].slice('title', 'authors', 'publishedDate', 'infoLink', 'bookImage')
  end

  def page_title(page_title = '')#, admin: false)
    base_title = #if admin
                  #'Hontobutai | 管理画面'
                #else
                  'Hontobutai'
                #end

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
