class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save!
      flash[:notice] = "Book was successfully created."
      redirect_to current_user
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to current_user
    else
    render :edit
    end
  end
  
  def update
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to current_user
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end