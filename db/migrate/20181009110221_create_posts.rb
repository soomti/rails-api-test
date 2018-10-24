class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :tag
      t.references :user, polymorphic: { default: 'Usser' }
      t.timestamps null: false
    end
  end
end
