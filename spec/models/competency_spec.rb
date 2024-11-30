require 'rails_helper'

RSpec.describe Competency, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:course_competencies).dependent(:destroy) }
    it { should have_many(:courses).through(:course_competencies) }
  end
end
