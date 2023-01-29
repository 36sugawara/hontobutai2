class BooksController < ApplicationController
  before_action :set_book, only: %i[edit update destroy]

  def index
    @books = Book.all.includes(:authors, :country, :prefecture).order(created_at: :desc).page(params[:page])
    set_areas
  end

  def new
    @book = Book.new
    @volume_info = params[:volumeInfo]
    set_area
    set_country
    set_prefecture
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save_with_author(authors_params[:authors])
      current_user.books << @book
      redirect_to books_path, success: t('defaults.message.created', item: t('defaults.post'))
    else
      set_area
      set_country
      set_prefecture
      set_volume_info
      flash.now[:danger] = t('defaults.message.not_created', item: t('defaults.post'))
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
    set_areas
  end

  def edit
    @book = Book.find(params[:id])
    set_areas
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), success: t('defaults.message.updated', item: t('defaults.post'))
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: t('defaults.post'))
      render :edit
    end
  end

  def destroy
    @book.destroy!
    redirect_to books_path, success: t('defaults.message.deleted', item: t('defaults.post'))
  end

  def search
    if params[:search].nil?
      return
    elsif params[:search].blank?
      flash.now[:danger] = '検索キーワードが入力されていません'
      return
    else
      url = "https://www.googleapis.com/books/v1/volumes"
      text = params[:search]
      res = Faraday.get(url, q: text, langRestrict: 'ja', maxResults: 20)
      @google_books = JSON.parse(res.body)
    end
  end

  private

  def book_params
    case action_name
    when 'create'
      params.require(:book).permit(:title, :body, :remote_book_image_url, :info_link, :published_date, :country_id, :prefecture_id, :user_id)
    when 'update'
      params.require(:book).permit(:body)
    end
  end

  def authors_params
    params.require(:book).permit(authors: [])
  end

  def set_volume_info
    @volume_info = {}
    @volume_info[:title] = params[:book][:title]
    @volume_info[:authors] = params[:book][:authors]
    @volume_info[:bookImage] = params[:book][:remote_book_image_url]
    @volume_info[:infoLink] = params[:book][:info_link]
    @volume_info[:publishedDate] = params[:book][:published_date]
  end

  def set_area
    @area = Area.pluck(:name, :id)
  end

  def set_country
    @country = Country.pluck(:name, :id)
  end

  def set_prefecture
    @prefecture = Prefecture.pluck(:name, :id)
  end

  def set_areas
    areas = Area.pluck(:id, :name)
    @area = areas.map { |area| area[1] }
  end

  def set_book
    @book = current_user.books.find(params[:id])
  end
end
