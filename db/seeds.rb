require 'dotenv/rails'
AdminUser.create!(email: 'admin@uho.ac.id', password: ENV['admin_password'], password_confirmation: ENV['admin_password'])
Course.create!(name: 'Komputasi Paralel & Terdistribusi')
Course.create!(name: 'Sistem Operasi')

