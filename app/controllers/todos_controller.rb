class TodosController < ApplicationController
  def index
    @todos = Todo.all
    json_response(@todos)
  end
end
