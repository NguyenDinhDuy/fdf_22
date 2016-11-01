class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.references :classify, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
