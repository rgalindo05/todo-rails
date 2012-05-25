class TodosController < ApplicationController
  before_filter :authenticate

  def index
    @todo = Todo.new
    @incomplete_todos = current_user.todos.incomplete
    @complete_todos = current_user.todos.complete
  end

  def create
    @todo = Todo.new(params[:todo].merge(user: current_user))

    if @todo.save
      redirect_to todos_path
    else
      @incomplete_todos = current_user.todos.incomplete
      @complete_todos = current_user.todos.complete
      render :index
    end
  end
end
