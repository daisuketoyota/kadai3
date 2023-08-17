class UsersController < ApplicationController
  def show
     @book = Book.new
     @books = Book.all
     @users = User.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to user_paths
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
end
