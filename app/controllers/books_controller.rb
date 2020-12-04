class BooksController < ApplicationController

   before_action :authenticate_user!, only: [:show,:new,:create,:index, :edit,:destroy,:update]

  def about
  end

  def home
  end

  def new
    @book = Book.new
  end

  def create
    @book= Book.new(book_params)
    @book.user_id = current_user.id
    @books= Book.all
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path
    else
      render :index
    end
  end

  def index
    @books= Book.all
    @book=Book.new
  end

  def show
    @book=Book.new
    @book2 = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
