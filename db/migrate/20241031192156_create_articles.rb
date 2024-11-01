class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.references :creator, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
