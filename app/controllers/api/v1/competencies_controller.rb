class Api::V1::CompetenciesController < ApplicationController
  before_action :set_competency, only: [:show, :update, :destroy]

  def index
    competencies = Competency.all
    render json: competencies.to_json(include: :courses), status: :ok
  end

  def show
    render json: @competency.to_json(include: :courses), status: :ok
  end

  def create
    competency = Competency.new(competency_params)
    if competency.save
      render json: competency, status: :created
    else
      render json: { errors: competency.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @competency.update(competency_params)
      render json: @competency
    else
      render json: { errors: @competency.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @competency.destroy
    render json: { message: 'Competency deleted' }, status: :ok
  end

  private

  def set_competency
    competency = Competency.find(params[:id])

    if competency
      @competency = competency
    else
      render json: { message: 'Competency not found' }, status: :not_found
    end
  end

  def competency_params
    params.require(:competency).permit(:name)
  end
end
