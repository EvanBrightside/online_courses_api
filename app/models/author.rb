class Author < ApplicationRecord
  has_many :courses

  before_destroy :assign_random_author_to_courses

  validates :name, presence: true, uniqueness: true

  private

  def assign_random_author_to_courses
    random_author = Author.where.not(id: self.id).sample
    if random_author
      courses.each do |course|
        course.update!(author_id: random_author.id)
      end
    else
      errors.add(:base, "Cannot delete the last author with associated courses")
      raise ActiveRecord::RecordInvalid.new(self)
    end
  end
end
