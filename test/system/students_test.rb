require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "should create student" do
    visit students_url
    click_on "New student"

    fill_in "Account git", with: @student.account_git
    fill_in "Code commits", with: @student.code_commits
    fill_in "Commits", with: @student.commits
    fill_in "Course", with: @student.course_id
    fill_in "Git repo", with: @student.git_repo
    fill_in "Lines added", with: @student.lines_added
    fill_in "Lines deleted", with: @student.lines_deleted
    fill_in "Name", with: @student.name
    fill_in "Nim", with: @student.nim
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "should update Student" do
    visit student_url(@student)
    click_on "Edit this student", match: :first

    fill_in "Account git", with: @student.account_git
    fill_in "Code commits", with: @student.code_commits
    fill_in "Commits", with: @student.commits
    fill_in "Course", with: @student.course_id
    fill_in "Git repo", with: @student.git_repo
    fill_in "Lines added", with: @student.lines_added
    fill_in "Lines deleted", with: @student.lines_deleted
    fill_in "Name", with: @student.name
    fill_in "Nim", with: @student.nim
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "should destroy Student" do
    visit student_url(@student)
    click_on "Destroy this student", match: :first

    assert_text "Student was successfully destroyed"
  end
end
