require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:author_id) }
  end

  describe 'associations' do
    it { should belong_to(:author) }
  end
end