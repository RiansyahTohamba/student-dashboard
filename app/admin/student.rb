require 'csv'

ActiveAdmin.register Student do
  permit_params :nim, :name, :git_repo, :account_git, :commits, :code_commits, :lines_added, :lines_deleted, :course_id

  action_item :import_csv, only: :index do
    link_to 'Import CSV', action: 'upload_csv'
  end

  collection_action :upload_csv do
    render 'admin/csv/upload'
  end

  collection_action :import_csv, method: :post do
    csv_file = params[:file]
    
    if csv_file.present?
      CSV.foreach(csv_file.path, headers: true) do |row|
        # Mengasumsikan ada kolom yang sesuai di CSV
        Student.create! row.to_hash
      end
      redirect_to admin_students_path, notice: "Students imported successfully!"
    else
      redirect_to admin_students_path, alert: "Please upload a CSV file."
    end
  end
end
