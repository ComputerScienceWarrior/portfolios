class CreatePortfolios < ActiveRecord::Migration[7.1]
  def change
    create_table :portfolios do |t|
      t.string :name
      t.string :type
      t.string :template
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
