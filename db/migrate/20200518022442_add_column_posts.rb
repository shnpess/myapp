class AddColumnPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :vaccination, :string
    add_column :posts, :age, :string
  end
end
