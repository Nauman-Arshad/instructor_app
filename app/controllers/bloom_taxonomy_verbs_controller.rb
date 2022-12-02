class BloomTaxonomyVerbsController < ApplicationController
  before_action :validate_session
  def new
    btv_params = bloom_taxonomy_verb_params
    @bloom_taxonomy_level_id = btv_params[:bloom_taxonomy_level_id]
    @course_id = btv_params[:course_id]
    @bloom_taxonomy_level = BloomTaxonomyLevel.find_by(id: @bloom_taxonomy_level_id)
    @verb_name = @bloom_taxonomy_level.level
    @bloom_taxonomy_verbs = @bloom_taxonomy_level.bloom_taxonomy_verbs
    respond_to do |format|
      format.html
    end
  end

  def create
    btv_params = bloom_taxonomy_verb_params
    @bloom_taxonomy_level_id = btv_params[:bloom_taxonomy_level_id]
    @course_id = btv_params[:course_id]
    @bloom_taxonomy_verb_name = btv_params[:bloom_taxonomy_verb_id]
    bloom_taxonomy_verb = BloomTaxonomyVerb.find_or_create_by(name: @bloom_taxonomy_verb_name, bloom_taxonomy_level_id: @bloom_taxonomy_level_id)
    if bloom_taxonomy_verb
      @course = Course.find(@course_id)
      @topics = @course.topics
      @bloom_taxonomy_verb_id = bloom_taxonomy_verb.id
      render 'learning_objectives/create_learning_objective'
    else
      flash[:notice] = bloom_taxonomy_verb.errors.full_messages.join(', ')
      redirect_to courses_path
    end
  end

  def edit
  end

  def update
    if bloom_taxonomy_verb(bloom_taxonomy_verb_params)
      @course = Course.find(@course_id)
      @topics = @course.topics
      @bloom_taxonomy_verb_id = bloom_taxonomy_verb.id
      render 'learning_objectives/create_learning_objective'
    else
      flash[:notice] = bloom_taxonomy_verb.errors.full_messages.join(', ')
      redirect_to courses_path
    end
  end

  def bloom_taxonomy_verb_params
    params.require(:bloom_taxonomy_verb).permit(:bloom_taxonomy_level_id, :course_id, :bloom_taxonomy_verb_id)
  end

  private

  def validate_session
    redirect_to root_path unless session[:user].present?
  end

  def set_courses
    @courses = Course.where(user_id: session.dig(:user, 'id'))
  end
end
