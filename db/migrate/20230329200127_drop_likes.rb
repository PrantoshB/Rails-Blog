class DropLikes < ActiveRecord::Migration[7.0]
  def up
    drop_table :likes
  end
end
