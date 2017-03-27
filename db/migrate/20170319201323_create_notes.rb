class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.integer 'user_id'
      t.string 'title'
      t.text 'content'
      t.string 'permalink', :unique => true
      t.integer 'visibility', :limit => 2, :default => 2
      t.boolean 'require_login', :default => true
      t.timestamps
    end
    add_index(:notes, 'user_id')
  end
end
