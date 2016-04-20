class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.completed = false
    if @todo.save
      redirect_to @todo, notice: "Todo was successfully saved."
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to @todo, notice: "Todo was successfully updated."
    else
      render :new
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  def incomplete
    @incomplete_todos = Todo.where(completed: false)
  end

  def mark_complete
    @todo = Todo.find(params[:id])
    @todo.update(completed: true)

    redirect_to incomplete_todos_path
  end

  private
  def todo_params
    params.require(:todo).permit(:body, :author)
  end

end
