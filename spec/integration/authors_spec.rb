require 'swagger_helper'

RSpec.describe 'api/v1/authors', type: :request do
  path '/api/v1/authors' do
    get('list authors') do
      tags 'Authors'
      produces 'application/json'

      response(200, 'successful') do
        let!(:authors) { create_list(:author, 10) }

        run_test!
      end
    end

    post('create author') do
      tags 'Authors'
      consumes 'application/json'
      parameter name: :author, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: %w[name]
      }

      response(201, 'created') do
        let(:author) { { name: 'Sample Author' } }

        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:author) { { name: '' } }

        run_test!
      end
    end
  end

  path '/api/v1/authors/{id}' do
    get('show author') do
      tags 'Authors'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'Author ID'

      response(200, 'successful') do
        let(:id) { create(:author).id }

        run_test!
      end
    end

    put('update author') do
      tags 'Authors'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'Author ID'
      parameter name: :author, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: %w[name]
      }

      response(200, 'successful') do
        let(:id) { create(:author).id }
        let(:author) { { name: 'Updated Author' } }

        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:id) { create(:author).id }
        let(:author) { { name: '' } }

        run_test!
      end
    end

    delete('delete author') do
      tags 'Authors'
      parameter name: :id, in: :path, type: :string, description: 'Author ID'

      response(200, 'successful') do
        let!(:other_author) { create(:author) }
        let(:id) { create(:author).id }
    
        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:id) { create(:author).id }

        run_test!
      end
    end
  end
end