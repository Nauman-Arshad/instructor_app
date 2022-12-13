class CoursesController < ApplicationController
  before_action :validate_session
  before_action :set_courses, only: [:index]

  def index
    respond_to do |format|
      format.html
    end
  end

  def new
    respond_to do |format|
      format.html
    end
  end

  def create
    course = Course.new(course_params)
    course.days = params[:days]
    if course.save
      flash[:success] = 'Course Successfully Created!'
      redirect_to courses_path
    else
      flash[:notice] = course.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
    # @Objective = LearningObjective.where(course_id: params[:id])
    @topics = @course.topics
    @blooms = BloomTaxonomyLevel.all
    @learning_objectives = LearningObjective.where(course_id: params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :code, :credit_hours, :user_id, :start_time, :end_time, :days, :location)
  end

  private

  def validate_session
    redirect_to root_path unless session[:user].present?
  end

  def set_courses
    @courses = Course.where(user_id: session.dig(:user, 'id'))
  end
end
