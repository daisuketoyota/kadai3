class UsersController < ApplicationController
  def show
     @book = Book.new
     @books = Book.all
     @user = current_user
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @user = current_user
  end
  
  def update
    @users = current_user
    if @users.update(user_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to current_user
    else
    render :edit
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end
  
end
