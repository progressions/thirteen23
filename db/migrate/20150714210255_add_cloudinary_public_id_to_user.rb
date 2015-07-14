class AddCloudinaryPublicIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :cloudinary_public_id, :string
  end
end
