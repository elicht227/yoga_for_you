class StudentsController < ApplicationController
  before_action :current_user_must_be_student_user,
                only: %i[edit update destroy]

  before_action :set_student, only: %i[show edit update destroy]

  def index
    @q = Student.ransack(params[:q])
    @students = @q.result(distinct: true).includes(:user, :written_reviews,
                                                   :attendee_ids, :events_attending).page(params[:page]).per(10)
  end

  def show
    @attendee = Attendee.new
    @review = Review.new
  end

  def new
    @student = Student.new
  end

  def edit; end

  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student, notice: "Student was successfully created."
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: "Student was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url, notice: "Student was successfully destroyed."
  end

  private

  def current_user_must_be_student_user
    set_student
    unless current_user == @student.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:user_id)
  end
end
