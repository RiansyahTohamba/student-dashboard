class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :nim
      t.string :name
      t.string :git_repo
      t.string :account_git
      t.integer :commits
      t.integer :code_commits
      t.integer :lines_added
      t.integer :lines_deleted
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
