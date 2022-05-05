class RemoveReadFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :read, :boolean
  end
end
