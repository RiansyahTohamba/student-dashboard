# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { "UHO Student Performance Dashboard" } do

    columns do
      column do
        panel "Mata kuliah diasuh" do
          ul do
            Course.all.map do |cr|
              li link_to(cr.name, course_path(cr))
            end
          end
        end
      end
    end
  end # content
end