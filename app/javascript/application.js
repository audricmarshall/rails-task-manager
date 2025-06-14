/* // Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// ces lignes de codes ont été effacée car j'ai voulu suivre les commande du lien plus haut, donc je les ai
// remis
// import "@hotwired/turbo-rails"
// import "controllers"

// ajout de l'import et du démarrage de Rails UJS recommandé par Wott
// ca permet d'activer les fonctionnalités JavaScript comme les dialogues de confirmation (data-confirm)
// et la gestion des méthodes HTTP comme DELETE ou PUT via les liens/formulaires
// sans ça, les confirmations ne fonctionnent pas et les liens de suppression n'envoient pas la bonne méthode HTTP
import Rails from "@rails/ujs"
Rails.start()
 */

// j'ai commenté les anciens imports et ajouté rails ujs + turbo comme conseillé par wott
// sans ça, la confirmation javascript (data-confirm) ne marche pas sur les liens delete
// il faut importer rails/ujs et lancer rails.start() pour activer les confirmations et la bonne méthode HTTP
// aussi turbo doit être lancé avec turbo.start() pour que tout fonctionne bien avec rails 7 + turbo

// j'enleve car j'utilise stimulus maintenant

/* import Rails from '@rails/ujs';
import Turbo from '@hotwired/turbo-rails';

Rails.start();
Turbo.start(); */

// j'enleve app/javascript/controllers/application.js et app/javascript/controllers/index.js
// et je fais tout ici car je ne trouve pas de CDN hotwire stimulus loading valide

import "@hotwired/turbo-rails"
// pas besoin de import "@hotwired/stimulus" ni de "./controllers" ici
import { Application } from "@hotwired/stimulus"
import ConfirmController from "./controllers/confirm_controller"

// initialise stimulus
const application = Application.start()
application.debug = false
window.Stimulus = application

// declare le controller pour confirm
application.register("confirm", ConfirmController)
