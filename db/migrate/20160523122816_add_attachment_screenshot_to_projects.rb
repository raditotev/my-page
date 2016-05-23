class AddAttachmentScreenshotToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :screenshot
    end
  end

  def self.down
    remove_attachment :projects, :screenshot
  end
end
