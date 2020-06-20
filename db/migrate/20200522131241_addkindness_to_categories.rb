class AddkindnessToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :kindness, :string
  end
end
