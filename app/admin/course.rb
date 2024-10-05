ActiveAdmin.register Course do
  permit_params :name

  form do |f|
    f.inputs 'Course Details' do
      f.input :name
    end
    f.actions
  end
end
