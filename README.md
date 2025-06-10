# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

j'ai suivi toutes les instructions de wott pour afficher un popup de confirmation JS sur le bouton delete :

- ajouté le data: { confirm: 'Are you sure?' } dans mon button_to
- installé @hotwired/turbo-rails et @rails/ujs comme conseillé (via package.json)
- tenté d'importer Rails UJS et Turbo dans application.js avec :
    import Rails from '@rails/ujs';
    import Turbo from '@hotwired/turbo-rails';
    Rails.start();
    Turbo.start();

malgré ça, j'ai toujours l'erreur :
Uncaught TypeError: Failed to resolve module specifier "@rails/ujs". Relative references must start with either "/", "./", or "../".

le bouton delete marche (il supprime la tâche), mais il n'affiche jamais la popup de confirmation attendue.
je suis bien en mode importmap (rails 7 sans webpacker).

pour voir les détail, tout est dans l'historique des messages précédents (cf. Wott)

---

**prochaine étape : tester une solution avec Stimulus pour déclencher la confirmation JS, vu que la solution rails-ujs officielle de wott ne marche pas**
