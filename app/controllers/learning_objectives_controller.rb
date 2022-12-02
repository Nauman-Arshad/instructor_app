class LearningObjectivesController < ApplicationController
  before_action :validate_session
  before_action :set_bloom_taxonomy_levels, only: [:new, :edit]

  def new
    @course_id = params[:course_id]
    @course = Course.find(@course_id)
    @topics = @course.topics
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    course = Course.find(learning_objective_params[:course_id])
    topic_ids = []
    new_params = learning_objective_params
    params[:learning_objective].keys.each do |key|
      topic_ids = topic_ids << key.split('_').last if key.include?('topic_') && params[:learning_objective][key] == '1'
    end
    required_verb = BloomTaxonomyVerb.find(new_params[:bloom_taxonomy_verb_id])&.name
    new_params[:description] = "#{required_verb} #{new_params[:description]}"
    # binding.pry
    learning_objective = LearningObjective.new(new_params)
    if course.present? && learning_objective.save!
      topic_ids.each do |topic_id|
        LearningObjectiveTopic.create(topic_id: topic_id, learning_objective_id: learning_objective.id)
      end
      flash[:success] = 'Learning Objective Successfully Created!'
      redirect_to course_path(course.id)
    else
      flash[:notice] = learning_objective.errors.full_messages.join("; ")
      render :create_learning_objective
    end
  end

  def destroy
    @learning_object = LearningObjective.find_by_id(params[:id])
    if @learning_object.present?
      @course = @learning_object.course
      @learning_object.destroy
    end
    flash[:success] = 'Learning objective successfully delete!'
    redirect_to @course
  end

  def update
    course = Course.find(learning_objective_params[:course_id])
    @learning_object = LearningObjective.find(params[:id])
    if @learning_object.update(learning_objective_params)
      flash[:success] = 'Learning objective successfully updated!'
      redirect_to course_path(course.id)
    else
      flash[:notice] = learning_objective.errors.full_messages.join(',')
      render :edit, status: :unprocessable_entity
    end
  end

  def learning_objective_params
    params.require(:learning_objective).permit(:description, :bloom_taxonomy_level_id, :bloom_taxonomy_verb_id, :course_id, :key, :category)
  end

  def validate_session
    redirect_to root_path unless session[:user].present?
  end

  def set_bloom_taxonomy_levels
    @bloom_taxonomy_levels = BloomTaxonomyLevel.all
  end

end

