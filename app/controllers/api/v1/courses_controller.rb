class Api::V1::CoursesController < ApplicationController
  before_action :set_course, only: %i[show update destroy]

  def index
    courses = Course.all
    render json: courses.to_json(include: [:author, :course_competencies]), status: :ok
  end

  def create
    course = Course.new(course_params)

    if course.save
      render json: course, status: :created
    else
      render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @course.to_json(include: [:author, :course_competencies]), status: :ok
  end

  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @course.destroy
    render json: { message: 'Course deleted' }, status: :ok
  end

  private

  def set_course
    course = Course.find(params[:id])
    if course
      @course = course
    else
      render json: { message: 'Course not found' }, status: :not_found
    end
  end

  def course_params
    params.require(:course).permit(:title, :description, :author_id)
  end
end
