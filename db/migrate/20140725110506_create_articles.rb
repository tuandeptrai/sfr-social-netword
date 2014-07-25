class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer  :user_id, null: false
      t.string :title
      t.text  :content
      t.datetime :created_at

      t.timestamps
    end
  end
end
