class AddColumnReadInComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :read, :integer, default: 0
  end
end
