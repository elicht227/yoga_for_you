class TeachersController < ApplicationController
  before_action :current_user_must_be_teacher_user,
                only: %i[edit update destroy]

  before_action :set_teacher, only: %i[show edit update destroy]

  def index
    @q = Teacher.ransack(params[:q])
    @teachers = @q.result(distinct: true).includes(:user, :teaching_events,
                                                   :reviews).page(params[:page]).per(10)
  end

  def show
    @review = Review.new
    @event = Event.new
  end

  def new
    @teacher = Teacher.new
  end

  def edit; end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to @teacher, notice: "Teacher was successfully created."
    else
      render :new
    end
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: "Teacher was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: "Teacher was successfully destroyed."
  end

  private

  def current_user_must_be_teacher_user
    set_teacher
    unless current_user == @teacher.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:user_id)
  end
end
