require 'rails_helper'

RSpec.describe TodosController, type: :controller do
  describe 'GET #index' do
    it "renders template" do
      todo = Todo.create!(body: "finish WDI", author_first_name: "John", author_last_name: "Smith", completed: false)
      todo2 = Todo.create!(body: "Get a job", author_first_name: "Bill", author_last_name: "Jones", completed: false)
      get :index
      expect(response).to render_template :index
    end
    it "assigns todos instance to have all created todos" do
      todo = Todo.create!(body: "finish WDI", author_first_name: "John", author_last_name: "Smith", completed: false)
      todo2 = Todo.create!(body: "Get a job", author_first_name: "Bill", author_last_name: "Jones", completed: false)
      get :index
      #assigns: Instance variables assigned in the action that are available for the view.
      expect(assigns(:todos).include? todo).to eq(true)
      expect(assigns(:todos).include? todo2).to eq(true)
    end
  end

  describe 'GET #show' do
    it "renders template" do
      todo = Todo.create!(body: "finish WDI", author_first_name: "John", author_last_name: "Smith", completed: false)
      #to_param: Returns a String, which Action Pack uses for constructing an URL to this object -basically an id
      get :show, {id: todo.to_param}
      expect(response).to render_template :show
    end
    it "assigns todo instance to input id" do
      todo = Todo.create!(body: "finish WDI", author_first_name: "John", author_last_name: "Smith", completed: false)
      todo2 = Todo.create!(body: "Get a job", author_first_name: "Bill", author_last_name: "Jones", completed: false)
      get :show, {id: todo2.to_param}
      expect(assigns(:todo).body).to eq("Get a job")
    end
  end

  describe 'GET #incomplete' do
    it "returns todos where completed is false" do
      todo = Todo.create!(body: "finish WDI", author_first_name: "John", author_last_name: "Smith", completed: true)
      todo2 = Todo.create!(body: "Get a job", author_first_name: "Bill", author_last_name: "Jones", completed: false)
      get :incomplete
      expect(assigns(:incomplete_todos).include? todo2).to eq(true)
    end
  end
end
