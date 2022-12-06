class BloomTaxonomyVerbsController < ApplicationController
  before_action :validate_session

  def new
    btv_params = bloom_taxonomy_verb_params
    @bloom_taxonomy_level_id = btv_params[:bloom_taxonomy_level_id]
    @course_id = btv_params[:course_id]
    @bloom_taxonomy_level = BloomTaxonomyLevel.find_by(id: @bloom_taxonomy_level_id)
    @verb_name = @bloom_taxonomy_level.level
    @bloom_taxonomy_verbs = @bloom_taxonomy_level.bloom_taxonomy_verbs
  end

  def create
    btv_params = bloom_taxonomy_verb_params
    @bloom_taxonomy_level_id = btv_params[:bloom_taxonomy_level_id]
    @course_id = btv_params[:course_id]
    @bloom_taxonomy_verb_name = btv_params[:bloom_taxonomy_verb_id]
    @bloom_taxonomy_verb = BloomTaxonomyVerb.find_or_create_by(name: @bloom_taxonomy_verb_name, bloom_taxonomy_level_id: @bloom_taxonomy_level_id)
    if @course = Course.find(@course_id)
      @topics = @course.topics
      @bloom_taxonomy_verb_id = @bloom_taxonomy_verb.id
      render 'learning_objectives/create_learning_objective'
    else
      flash[:notice] = @bloom_taxonomy_verb.errors.full_messages.join(', ')
      redirect_to cours @bloom_taxonomy_verbes_path
    end
  end

  def edit
    btv_params = bloom_taxonomy_verb_params
    @bloom_taxonomy_level_id = btv_params[:bloom_taxonomy_level_id]
    @course_id = btv_params[:course_id]
    @bloom_taxonomy_level = BloomTaxonomyLevel.find_by(id: @bloom_taxonomy_level_id)
    @verb_name = @bloom_taxonomy_level.level
    @bloom_taxonomy_verbs = @bloom_taxonomy_level.bloom_taxonomy_verbs
  end

  def update
    btv_params = bloom_taxonomy_verb_params
    @bloom_taxonomy_level_id = btv_params[:bloom_taxonomy_level_id]
    @course_id = btv_params[:course_id]
    if @course = Course.find(@course_id)
      @topics = @course.topics
      @bloom_taxonomy_verb_name = btv_params[:bloom_taxonomy_verb_id]
      @bloom_taxonomy_verb_id = BloomTaxonomyVerb.find_by(name: @bloom_taxonomy_verb_name).id
      render 'learning_objectives/update_learning_objective'
    else
      flash[:notice] = @bloom_taxonomy_verb.errors.full_messages.join(', ')
      redirect_to cours @bloom_taxonomy_verbes_path
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
