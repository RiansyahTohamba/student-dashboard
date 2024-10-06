class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
    @total_commits = 10
    @average_commits = 100
    @top_performer = { name: "bionda", commits: 100}

    @students = Student.where(course_id: params[:id])
    @bottom_students = Student.where("commits < ?", 5)
    # results = db_orm.execute("SELECT SUM(commits) AS total_commits, AVG(commits) AS average_commits, MAX(commits) AS top_performer, MAX(lines_added - lines_deleted) AS top_contributor FROM students")
    # result_arr  =  results.to_a[0]
    # @total_commits = result_arr[0]
    # @average_commits = result_arr[1]
    # @bottom_students = db_orm[:students].where(Sequel[:commits] < LOW_COMMIT_THRESHOLD).order(:commits).to_a
    # top_commit = result_arr[2]
    # @top_performer = db_orm[:students].where(commits: top_commit).first
    # Assuming you have a `Student` model and necessary columns in the database

    # # Query to calculate total, average, and maximum commits and contributions
    # results = Student.select(
    #   'SUM(commits) AS total_commits',
    #   'AVG(commits) AS average_commits',
    #   'MAX(commits) AS top_performer',
    #   'MAX(lines_added - lines_deleted) AS top_contributor'
    # ).first

    # # Extract the results
    # @total_commits = results.total_commits
    # @average_commits = results.average_commits

    # # Define the threshold for low commits (adjust LOW_COMMIT_THRESHOLD)
    # @bottom_students = Student.where("commits < ?", LOW_COMMIT_THRESHOLD).order(:commits)

    # # Find the top performer based on commit count
    # top_commit = results.top_performer
    # @top_performer = Student.find_by(commits: top_commit)

  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to courses_path, status: :see_other, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:name)
    end
end
