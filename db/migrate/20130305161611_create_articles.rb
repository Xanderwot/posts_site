class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :title
    	t.text :body
    	t.integer :user_id
    	t.boolean :featured, :default => false	

      t.timestamps
    end
  end
end
