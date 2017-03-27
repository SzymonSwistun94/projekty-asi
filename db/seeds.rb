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

test.notes << Note.create(:title => 'public', :content => 'test@test.com', :permalink => SecureRandom.hex(8), :visibility => 2)
test.notes << Note.create(:title => 'unlisted', :content => 'test@test.com', :permalink => SecureRandom.hex(8), :visibility => 1)
test.notes << Note.create(:title => 'private', :content => 'test@test.com', :permalink => SecureRandom.hex(8), :visibility => 0)

test2.notes << Note.create(:title => 'public', :content => 'test2@test.com', :permalink => SecureRandom.hex(8), :visibility => 2)
test2.notes << Note.create(:title => 'unlisted', :content => 'test2@test.com', :permalink => SecureRandom.hex(8), :visibility => 1)
test2.notes << Note.create(:title => 'private', :content => 'test2@test.com', :permalink => SecureRandom.hex(8), :visibility => 0)