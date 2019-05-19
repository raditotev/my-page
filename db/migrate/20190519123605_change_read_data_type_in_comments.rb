class ChangeReadDataTypeInComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :read, :integer
  end
end
