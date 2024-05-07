pin "application", preload: true
pin "@hotwired/turbo-rails", to: "https://cdn.skypack.dev/@hotwired/turbo-rails@latest", preload: true
pin "@rails/ujs", to: "https://cdn.skypack.dev/@rails/ujs@latest", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
