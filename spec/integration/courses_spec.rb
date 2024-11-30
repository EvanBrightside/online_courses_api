require 'swagger_helper'

RSpec.describe 'api/v1/courses', type: :request do
  path '/api/v1/courses' do
    get('list courses') do
      tags 'Courses'
      produces 'application/json'

      response(200, 'successful') do
        let!(:courses) { create_list(:course, 10) }
        run_test!
      end
    end

    post('create course') do
      tags 'Courses'
      consumes 'application/json'
      parameter name: :course, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          author_id: { type: :integer }
        },
        required: %w[title description author_id]
      }

      response(201, 'created') do
        let!(:author) { create(:author) }
        let(:course) { { title: 'Sample Course', description: 'Sample Description', author_id: author.id } }
        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:course) { { title: 'Sample Course' } }
        run_test!
      end
    end
  end

  path '/api/v1/courses/{id}' do
    get('show course') do
      tags 'Courses'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'Course ID'

      response(200, 'successful') do
        let(:id) { create(:course).id }

        run_test!
      end
    end

    put('update course') do
      tags 'Courses'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string, description: 'Course ID'
      parameter name: :course, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          description: { type: :string },
          author_id: { type: :integer }
        },
        required: %w[title description author_id]
      }

      response(200, 'successful') do
        let(:id) { create(:course).id }
        let(:course) { { title: 'Updated Title', description: 'Updated Description' } }

        run_test!
      end
    end

    delete('delete course') do
      tags 'Courses'
      parameter name: :id, in: :path, type: :string, description: 'Course ID'

      response(200, 'successful') do
        let(:id) { create(:course).id }

        run_test!
      end
    end
  end
end
