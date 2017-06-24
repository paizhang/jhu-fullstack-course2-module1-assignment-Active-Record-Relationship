# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all
Profile.destroy_all

User.create! [
    {username: "Fiorina", password_digest: "1234"},
    {username: "Trump", password_digest: "2345"},
    {username: "Carson", password_digest: "3456"},
    {username: "Clinton", password_digest: "4567"}
             ]

User.find_by!(username: "Fiorina").create_profile(gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina")
User.find_by!(username: "Trump").create_profile(gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump")
User.find_by!(username: "Carson").create_profile(gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson")
User.find_by!(username: "Clinton").create_profile(gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton")

list_id = 1
User.all.each { |user|
  user.todo_lists.create! [{list_name: "list_" + list_id.to_s, list_due_date: Date.today + 1.year}]
  list_id += 1
}

item_id = 1
TodoList.all.each { |list|
  i = 0;
  while (i < 5)
    list.todo_items.create! [{due_date: Date.today + 1.year, title: "title_" + item_id.to_s, description: "des_" + item_id.to_s, completed: false}];
    item_id += 1;
    i += 1;
  end
}



