# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
# pin "chart.js" # @4.4.4
# pin "datatables.net" # @2.1.7
pin "@kurkle/color", to: "@kurkle--color.js" # @0.3.2
pin "chart.js", to: "https://cdn.jsdelivr.net/npm/chart.js"
pin "datatables.net", to: "https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"
pin "jquery" # @3.7.1
