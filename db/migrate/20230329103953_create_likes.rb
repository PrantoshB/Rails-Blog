class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :AuthorId
      t.integer :PostId
      t.datetime :CreatedAt
      t.datetime :UpdatedAt

      t.timestamps
    end
  end
end
