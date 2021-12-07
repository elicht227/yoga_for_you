class StudentsController < ApplicationController
  before_action :current_user_must_be_student_user, only: [:edit, :update, :destroy] 

  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  def index
    @q = Student.ransack(params[:q])
    @students = @q.result(:distinct => true).includes(:user, :written_reviews, :attendee_ids, :events_attending).page(params[:page]).per(10)
  end

  # GET /students/1
  def show
    @attendee = Attendee.new
    @review = Review.new
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'Student was successfully destroyed.'
  end

  private

  def current_user_must_be_student_user
    set_student
    unless current_user == @student.user
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def student_params
      params.require(:student).permit(:user_id)
    end
end
