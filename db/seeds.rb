# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'securerandom'

admin = User.create! :email => 'admin@admin.com', :password => 'admin123', :password_confirmation => 'admin123'
test = User.create! :email => 'test@test.com', :password => 'test123', :password_confirmation => 'test123'
test2 = User.create! :email => 'test2@test.com', :password => 'test123', :password_confirmation => 'test123'

test.notes << Note.create(:title => 'public', :desc => 'test@test.com', :content => "An h1 header
============

Paragraphs are separated by a blank line.

2nd paragraph. *Italic*, **bold**, and `monospace`. Itemized lists
look like:

  * this one
  * that one
  * the other one

Note that --- not considering the asterisk --- the actual text
content starts at 4-columns in.

> Block quotes are
> written like so.
>
> They can span multiple paragraphs,
> if you like.

Use 3 dashes for an em-dash. Use 2 dashes for ranges (ex., 'it's all
in chapters 12--14'). Three dots ... will be converted to an ellipsis.
Unicode is supported. ☺", :permalink => SecureRandom.hex(8), :visibility => 2)
test.notes << Note.create(:title => 'unlisted', :desc => 'test@test.com', :content => ' ', :permalink => SecureRandom.hex(8), :visibility => 1)
test.notes << Note.create(:title => 'private', :desc => 'test@test.com', :content => ' ', :permalink => SecureRandom.hex(8), :visibility => 0)

test2.notes << Note.create(:title => 'public', :desc => 'test2@test.com', :content => ' ', :permalink => SecureRandom.hex(8), :visibility => 2)
test2.notes << Note.create(:title => 'unlisted', :desc => 'test2@test.com', :content => ' ', :permalink => SecureRandom.hex(8), :visibility => 1)
test2.notes << Note.create(:title => 'private', :desc => 'test2@test.com', :content => ' ', :permalink => SecureRandom.hex(8), :visibility => 0)