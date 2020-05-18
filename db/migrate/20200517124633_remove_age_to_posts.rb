class RemoveAgeToPosts < ActiveRecord::Migration[5.2]
  def change

    remove_column :posts, :age, :integer
  end
end
