class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :commenter, index: true
      t.text :content
      t.references :post, index: true

      t.timestamps
    end
  end
end
