class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    @todos = Todo.all
    json_response(@todos)
  end

  def show
    json_response(@todo)
  end

  private
  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    # Params whitelist
    params.permit(:title, :created_by)
  end
end
