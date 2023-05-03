class RemoveBookImageIdFromBookComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :book_comments, :book_image_id, :integer
  end
end
