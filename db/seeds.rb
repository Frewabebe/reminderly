# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Todo.destroy_all
Todo.create([
  {body: "finish WDI", author_first_name: "John", author_last_name: "Smith", completed: false},
  {body: "Get a job", author_first_name: "Bill", author_last_name: "Jones", completed: false},
  {body: "learn rails", author_first_name: "John", author_last_name: "Smith", completed: true},
  {body: "learn jQuery", author_first_name: "Amy", author_last_name: "Davis", completed: true}
  ])
