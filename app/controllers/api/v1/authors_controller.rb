class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]

  def index
    authors = Author.all
    render json: authors.to_json(include: :courses), status: :ok
  end

  def show
    render json: @author.to_json(include: :courses), status: :ok
  end

  def create
    author = Author.new(author_params)
    if author.save
      render json: author, status: :created
    else
      render json: { errors: author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      render json: @author, status: :ok
    else
      render json: { errors: @author.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @author.destroy
    render json: { message: 'Author deleted successfully' }, status: :ok
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end

  def set_author
    author = Author.find(params[:id])
    if author
      @author = author
    else
      render json: { message: 'Author not found' }, status: :not_found
    end
  end
end
