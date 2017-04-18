class AddAttachmentPhotoToEscapes < ActiveRecord::Migration
  def self.up
    change_table :escapes do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :escapes, :photo
  end
end
