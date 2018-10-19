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

    it 'returns 200 ok' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe 'GET /todos/:id' do 
    before {get "/todos/#{todo_id}"}

    context 'when the record exists' do
      it 'returns the todo' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(todo_id)
      end

      it 'returns 200 ok' do 
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:todo_id) {1000}
      it 'returns 404 not found' do 
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)
      end
    end

  end
  # Test suite for POST /todos
  describe 'POST /todos' do
    # Valid payload in a static attribute
    let(:valid_payload) {{title: 'Testing with Rspec', created_by: '1'}}

    context 'When resquest is valid' do
      before {post '/todos', params: valid_payload}

      it 'creates a todo' do
        expect(json['title']).to eq('Testing with Rspec')
      end

      it 'returns 201 created' do 
        expect(response).to have_http_status(201)
      end
    end

    context 'When resquest is invalid' do
      before {post '/todos', params: {title: 'Loco'}}

      it 'returns 422 Unprocessable Entity' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /todos/:id
end