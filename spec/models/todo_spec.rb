require 'rails_helper'

RSpec.describe Todo, type: :model do

  subject(:todo) do
    todo = Todo.create!(body: "finish WDI", author_first_name: "John", author_last_name: "Smith", completed: false)
  end

  describe "index page has ", :type => :feature do
    it "lists top label" do
      visit '/'
      expect(page).to have_content('All Todos')
    end

    it "contains name of todo" do
      new_todo = Todo.create!(body: "Lift weights", author_first_name: "Bill", author_last_name: "Flacco", completed: false)
      visit '/'
      expect(page).to have_content(new_todo.body)
    end
  end


  describe "attributes of a todo" do

    it "has class todo" do
      expect(todo).to be_a(Todo)
    end

    it "has a String for body" do
      expect(todo.body).to be_a(String)
    end

    it "has a String for author_first_name" do
      expect(todo.author_first_name).to be_a(String)
    end

    it "has a String for author_last_name" do
      expect(todo.author_last_name).to be_a(String)
    end

    it "has a Boolean for completed" do
      expect(todo).to have_attributes(:completed => false)
    end
  end

  describe "#full_name" do
    it "concatenates author_first_name and author_last_name" do
      expect(todo.full_name).to eq("John Smith")
    end
  end
end
