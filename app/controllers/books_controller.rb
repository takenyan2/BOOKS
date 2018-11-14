class BooksController < ApplicationController
  def top
  	@books = Book.all
  end

  def show
  	@books = Book.find(params[:id])
  end

  def index
  	@book = Book.new
  	@books = Book.all.order(created_at: :asc)
  end

  def new
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	book.save
  	flash[:created] = "投稿しました！(Book was successfully created.) "
  	redirect_to book_path(book)
  end

  def edit
  	@books = Book.find(params[:id])
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path(book)
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	flash[:notice] = "更新しました！(Book was successfully updated.) "
  	redirect_to book_path(book)
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
