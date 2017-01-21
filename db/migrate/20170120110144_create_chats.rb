class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.text :text
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
