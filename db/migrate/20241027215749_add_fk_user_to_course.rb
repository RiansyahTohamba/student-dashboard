class AddFkUserToCourse < ActiveRecord::Migration[7.1]
  def change
    add_reference :courses, :user, foreign_key: true
  end
end
