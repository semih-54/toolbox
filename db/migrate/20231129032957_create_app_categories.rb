class CreateAppCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :app_categories do |t|
      t.references :app, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
