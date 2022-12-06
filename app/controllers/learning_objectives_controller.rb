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
    @learning_object = LearningObjective.find(params[:id])
    @course_id = @learning_object.course_id
  end

  def create
    course = Course.find(learning_objective_params[:course_id])
    topic_ids = []
    new_params = learning_objective_params
    params[:learning_objective].keys.each do |key|
      topic_ids = topic_ids << key.split('_').last if key.include?('topic_') && params[:learning_objective][key] == '1'
    end
    learning_objective = LearningObjective.new(new_params)
    if course.present? && learning_objective.save
      params[:topic].each do |d|
        topic = Topic.find_by_id(d)
        @map_topic = topic[:map_topics] << learning_objective.key
        topic.update(map_topics: @map_topic)
      end
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
    topic_ids = []
    params[:learning_objective].keys.each do |key|
      topic_ids = topic_ids << key.split('_').last if key.include?('topic_') && params[:learning_objective][key] == '1'
    end
    @learning_objective = LearningObjective.find(params[:id])
    course = Course.find(@learning_objective.course_id)
    if @learning_objective.update(update_params)
      params[:topic]&.each do |d|
        topic = Topic.find_by_id(d)
        @map_topic = topic[:map_topics] << @learning_objective.key
        topic.update(map_topics: @map_topic)
      end
      topic_ids.each do |topic_id|
        LearningObjectiveTopic.create(topic_id: topic_id, learning_objective_id: @learning_objective.id)
      end
      flash[:success] = 'Learning objective successfully updated!'
      redirect_to course
    else
      flash[:notice] = @learning_objective.errors.full_messages.join("; ")
      render :create_learning_objective
    end
  end

  def learning_objective_params
    params.require(:learning_objective).permit(:description, :bloom_taxonomy_level_id, :bloom_taxonomy_verb_id, :course_id, :key, :category, :chosen_verb)
  end

  def validate_session
    redirect_to root_path unless session[:user].present?
  end

  def update_params
    params.require(:learning_objective).permit(:description, :bloom_taxonomy_level_id, :bloom_taxonomy_verb_id, :course_id, :key, :category, :chosen_verb)
  end

  def set_bloom_taxonomy_levels
    @bloom_taxonomy_levels = BloomTaxonomyLevel.all
  end

end

