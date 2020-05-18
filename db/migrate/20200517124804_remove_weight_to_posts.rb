class RemoveWeightToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :weight, :integer
    add_column :posts, :type, :string
  end
end
