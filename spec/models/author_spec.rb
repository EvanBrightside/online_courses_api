require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:courses) }
  end

  describe 'callbacks' do
    let!(:author) { create(:author) }
    let!(:other_author) { create(:author) }
    let!(:course) { create(:course, author: author) }

    it 'assigns a random author to the course' do
      expect { author.destroy }.to change { course.reload.author }.from(author).to(other_author)
    end

    it 'raises an error when trying to delete the last author with courses' do
      other_author.destroy

      expect { author.destroy }.to raise_error(ActiveRecord::RecordInvalid, /Cannot delete the last author/)
    end
  end
end