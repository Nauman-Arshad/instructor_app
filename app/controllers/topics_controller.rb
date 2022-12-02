class TopicsController < ApplicationController
  before_action :validate_session

  def new
    @course_id = params[:course_id] || params[:format]
    @course = Course.find(@course_id)
    @learning_objectives = @course.learning_objectives
    respond_to do |format|
      format.html
    end
  end

  def create
    course = Course.find(topic_params[:course_id])
    if params[:topic][:file]
      csv_import(params[:topic][:file], course.id)
      return redirect_to course_path(course.id)
    else
      topic = Topic.new(topic_params)
      learning_objective_ids = []
      params[:topic].keys.each do |key|
        learning_objective_ids = learning_objective_ids << key.split('_').last if key.include?('obj_') && params[:topic][key] == '1'
      end
      if course.present? && topic.save
        flash[:success] = 'Topic Successfully Created!'
        learning_objective_ids.each do |learning_objective_id|
          LearningObjectiveTopic.create(topic_id: topic.id, learning_objective_id: learning_objective_id)
        end
        return redirect_to course_path(course.id)
      else
        flash[:notice] = 'Could not able to create topic!'
        render :new
      end
    end
  end

  def csv_import(file, course_id)
    return redirect_to new_topics_path, notice: 'Only CSV please' unless file.content_type == 'text/csv'
    CsvImportTopic.call(file, course_id)
  end

  def topic_params
    params.require(:topic).permit(:description, :course_id, :map_topics)
  end

  def validate_session
    return redirect_to root_path unless session[:user].present?
  end
end
