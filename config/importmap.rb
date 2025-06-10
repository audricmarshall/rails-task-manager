# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @8.0.16
pin "@hotwired/turbo", to: "@hotwired--turbo.js" # @8.0.13
pin "@rails/actioncable/src", to: "@rails--actioncable--src.js" # @8.0.200

# documentation pour pin sinon stimulus ne marche pas
# obligé de rajouter stimulus sinon les controllers js (confirm_controller.js pour la pop-up delete) marchent pas
# obligdé de pin car ca plante avec l’erreur "Failed to resolve module specifier '@hotwired/stimulus'"
# vu dans la doc officielle stimulus-rails : https://github.com/hotwired/stimulus-rails#installation
# et sur stackoverflow : https://stackoverflow.com/questions/72142193/how-to-use-stimulus-components-with-rails-import-maps
# pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2

# comme bin/importmap ne trouve pas les packages, on utilise un CDN temporaire
# source : https://stimulus.hotwired.dev/handbook/installing#cdn
pin "@hotwired/stimulus", to: "https://cdn.jsdelivr.net/npm/@hotwired/stimulus@3.2.2/dist/stimulus.js"

# pin tous les controllers stimulus dans app/javascript/controllers pour que rails les voie tout seul
# par ex si on met confirm_controller.js, il sera accessible dans "controllers"
# (vu dans la doc officielle importmap-rails : https://github.com/rails/importmap-rails#pinning-a-directory-of-files)

pin_all_from "app/javascript/controllers", under: "controllers"

# Local modules
# If you want to import local js module files from app/javascript/src or other sub-folders of app/javascript
# (such as channels),
# you must pin these to be able to import them. You can use pin_all_from to pick all files in a specific folder,
# so you don't have to pin each module individually.

# config/importmap.rb
# pin_all_from 'app/javascript/src', under: 'src', to: 'src'
# The :to parameter is only required if you want to change the destination logical import name. If you drop the :to option,
# you must place the :under option directly after the first parameter. =end
