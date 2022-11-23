class AddMyimageToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :myimage, :string
  end
end
