class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :caption
      t.string :description
      t.string :thumbnail_url
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
