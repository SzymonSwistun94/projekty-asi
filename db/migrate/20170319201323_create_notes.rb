class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.integer 'author'
      t.string 'title'
      t.text 'content'
      t.string 'permalink', :unique => true
      t.integer 'visibility', :limit => 2, :default => 2
      t.boolean 'require_login', :default => true
      t.timestamps
    end
    add_index(:notes, 'author')
  end
end
