class UsersController < ApplicationController

  def create
    user[:password] = BCrypt::Password.create(user[:password]) if user[:password].present?
    if user.save
      session[:user] = user
      flash[:success] = 'Instructor Successfully Created!'
      redirect_to courses_path
    else
      flash[:notice] = user.errors.full_messages.join('')
      render 'home/index'
    end
  end

  def login
    user_attributes = user_params
    user = User.find_by(name: user_attributes[:name])
    encrypted_password = BCrypt::Password.new(user.password)
    if user.present? && user.password == encrypted_password
      session[:start_time] = Time.now
      session[:login_user_id] = user.id
      session[:user] = user
      flash[:success] = 'Instructor Logged In!'
      redirect_to courses_path
    else
      flash[:notice] = 'Invalid Credentials'
      render 'home/index'
    end
  end

  def logout
    # binding.pry
    time1 = Time.now
    user_id = session[:login_user_id]
    user = User.find_by_id(user_id)
    time2 = session[:start_time].to_time
    minutes = time_diff(time1, time2)
    time = (minutes / 60).round(2)
    per_time = user.total_time.to_f
    updated_time = (time + per_time)
    user.update(total_time: updated_time)
    user.save
    session.delete(:user)
    session.delete(:login_user_id)
    session.delete(:start_time)
    redirect_to root_path

  end

  def time_diff(start_time, end_time)
    (start_time - end_time) / 60
  end

  def user_params
    params.require(:user).permit(:name, :address, :office_hours_up, :office_hours_to, :phone_no, :password, :total_time)
  end

end
