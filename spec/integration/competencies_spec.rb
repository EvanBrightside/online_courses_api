require 'swagger_helper'

RSpec.describe 'api/v1/competencies', type: :request do
  path '/api/v1/competencies' do
    get('list competencies') do
      tags 'Competencies'
      produces 'application/json'

      response(200, 'successful') do
        let!(:competencies) { create_list(:competency, 10) }

        run_test!
      end
    end

    post('create competency') do
      tags 'Competencies'
      consumes 'application/json'
      parameter name: :competency, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: %w[name]
      }

      response(201, 'created') do
        let(:competency) { { name: 'Sample Competency' } }

        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:competency) { { name: '' } }

        run_test!
      end
    end
  end

  path '/api/v1/competencies/{id}' do
    get('show competency') do
      tags 'Competencies'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'Competency ID'

      response(200, 'successful') do
        let(:id) { create(:competency).id }

        run_test!
      end
    end

    put('update competency') do
      tags 'Competencies'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'Competency ID'
      parameter name: :competency, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: %w[name]
      }

      response(200, 'successful') do
        let(:id) { create(:competency).id }
        let(:competency) { { name: 'Updated Competency' } }

        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:id) { create(:competency).id }
        let(:competency) { { name: '' } }

        run_test!
      end
    end

    delete('delete competency') do
      tags 'Competencies'
      parameter name: :id, in: :path, type: :string, description: 'Competency ID'

      response(200, 'no content') do
        let(:id) { create(:competency).id }

        run_test!
      end
    end
  end
end
