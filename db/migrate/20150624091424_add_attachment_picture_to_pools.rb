class AddAttachmentPictureToPools < ActiveRecord::Migration
  def self.up
    change_table :pools do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :pools, :picture
  end
end
