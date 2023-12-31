class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    if my_post?(book)
      favorite = current_user.favorites.new(book_id: book.id)
      favorite.save
    end
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    if my_post?(book)
      favorite = current_user.favorites.find_by(book_id: book.id)
      favorite.destroy
    end
    redirect_to request.referer
  end


  def my_post?(book)
    book.user != current_user
  end
end
