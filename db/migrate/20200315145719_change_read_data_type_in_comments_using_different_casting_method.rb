class ChangeReadDataTypeInCommentsUsingDifferentCastingMethod < ActiveRecord::Migration[5.2]
	def change
		change_column :comments, :read, 'USING read::integer'
  end
end
