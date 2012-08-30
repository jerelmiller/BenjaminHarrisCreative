# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create!( :name => 'admin',
              :description => 'Administrator role in the system')

User.create!([{ :first_name => 'Ben',
                :last_name => 'Harris',
                :email => 'benjamin.harris123@gmail.com',
                :password => 'default',
                :role_id => Role.find_by_name('admin').id
              },
              { :first_name => 'Jerel',
                :last_name => 'Miller',
                :email => 'jerelmiller@gmail.com',
                :password => 'default',
                :role_id => Role.find_by_name('admin').id
              }])