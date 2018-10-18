require 'rails_helper'

RSpec.describe 'Todos API', type: :request do
  # Initialize test data
  let!(:todos) {create_list(:todo, 10)}
  let(:todo_id) {todos.first.id}

  # Test suite for GET /todos
  describe 'GET /todos' do
    # make HTTP get req before each example
    before {get '/todos'}

    it 'returns todos' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'return 200 status code' do
      expect(response).to have_http_status(200)
    end
  end
end