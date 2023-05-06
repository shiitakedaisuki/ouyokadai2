class FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    # 下のbook_idはここのbook_idのこと。下のbook.idのbookはここのbook=のbookのこと
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    #find_byは押すと消えたりついたりするシステムのこと。find_by(今から消そうとしている本の指定)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
