class SearchBooksService
  def self.call(search_text)
    url = "https://www.googleapis.com/books/v1/volumes"
    res = Faraday.get(url, q: search_text, langRestrict: 'ja', maxResults: 20)
    JSON.parse(res.body)
  end
end