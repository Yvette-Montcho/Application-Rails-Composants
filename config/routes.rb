# config/routes.rb — Définit toutes les routes URL de l'application EventFreeka
# Ce fichier fait le lien entre une URL et une action de contrôleur

Rails.application.routes.draw do
  # Génère automatiquement les 7 routes RESTful pour la ressource "events" :
  # GET    /events           => events#index   (liste des événements)
  # GET    /events/new       => events#new     (formulaire de création)
  # POST   /events           => events#create  (enregistrement en base)
  # GET    /events/:id       => events#show    (détail d'un événement)
  # GET    /events/:id/edit  => events#edit    (formulaire de modification)
  # PATCH  /events/:id       => events#update  (mise à jour en base)
  # DELETE /events/:id       => events#destroy (suppression)
  resources :events

  # Définit la page d'accueil de l'application (root = chemin "/")
  # Pointe vers l'action `index` du contrôleur EventsController
  root "events#index"
end
