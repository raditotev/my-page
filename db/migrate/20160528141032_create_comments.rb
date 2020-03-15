class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :author
      t.string :email
      t.string :content
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
