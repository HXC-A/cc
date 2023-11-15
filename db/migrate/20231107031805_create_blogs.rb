class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.boolean :is_public, default: true
      t.belongs_to :user
      t.timestamps
    end

    unless index_exists?(:blogs, [:user_id])
      add_index :blogs, [:user_id]
    end
    
  end
end
