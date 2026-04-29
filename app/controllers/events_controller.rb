# app/controllers/events_controller.rb — Contrôleur CRUD pour la ressource Event
# Gère toutes les actions liées aux événements : liste, détail, création, modification, suppression

class EventsController < ApplicationController
  # ─── BEFORE ACTIONS ─────────────────────────────────────────────────────────

  # Exécute set_event avant les actions show, edit, update et destroy
  # Évite la répétition du find dans chaque action (principe DRY)
  before_action :set_event, only: %i[show edit update destroy]

  # ─── INDEX — GET /events ────────────────────────────────────────────────────

  # Liste tous les événements à venir, triés par date croissante
  def index
    # Récupère uniquement les événements futurs grâce au scope :upcoming défini dans le modèle
    @events = Event.upcoming
  end

  # ─── SHOW — GET /events/:id ─────────────────────────────────────────────────

  # Affiche le détail d'un événement précis
  # @event est déjà chargé par le before_action set_event
  def show
    # Aucune logique supplémentaire : @event est disponible grâce au before_action
  end

  # ─── NEW — GET /events/new ──────────────────────────────────────────────────

  # Prépare un événement vide pour le formulaire de création
  def new
    # Instancie un nouvel objet Event non persisté (pas encore en base)
    @event = Event.new
  end

  # ─── CREATE — POST /events ──────────────────────────────────────────────────

  # Traite la soumission du formulaire de création et tente l'enregistrement en base
  def create
    # Instancie un nouvel Event avec les paramètres filtrés par event_params (strong params)
    @event = Event.new(event_params)

    if @event.save
      # Succès : stocke un message de confirmation dans le flash
      # flash[:success] survit à la redirection (une seule page suivante)
      flash[:success] = "L'événement « #{@event.title} » a bien été créé !"

      # Redirige vers la page de détail du nouvel événement
      redirect_to @event
    else
      # Échec : les erreurs de validation sont dans @event.errors
      # flash.now[:error] n'est visible que sur le render courant (pas de redirection)
      flash.now[:error] = @event.errors.full_messages.to_sentence

      # Réaffiche le formulaire en conservant les valeurs saisies par l'utilisateur
      render :new, status: :unprocessable_entity
    end
  end

  # ─── EDIT — GET /events/:id/edit ────────────────────────────────────────────

  # Prépare le formulaire de modification avec les données de l'événement existant
  # @event est déjà chargé par le before_action set_event
  def edit
    # Aucune logique supplémentaire : @event est disponible grâce au before_action
  end

  # ─── UPDATE — PATCH /events/:id ─────────────────────────────────────────────

  # Traite la soumission du formulaire de modification et met à jour l'enregistrement
  def update
    if @event.update(event_params)
      # Succès : message de confirmation dans le flash persistant (redirection)
      flash[:success] = "L'événement « #{@event.title} » a bien été modifié !"

      # Redirige vers la page de détail de l'événement mis à jour
      redirect_to @event
    else
      # Échec : message d'erreur visible uniquement sur la page en cours (render)
      flash.now[:error] = @event.errors.full_messages.to_sentence

      # Réaffiche le formulaire d'édition avec les erreurs
      render :edit, status: :unprocessable_entity
    end
  end

  # ─── DESTROY — DELETE /events/:id ───────────────────────────────────────────

  # Supprime définitivement l'événement de la base de données
  def destroy
    # Mémorise le titre avant la destruction pour l'afficher dans le message flash
    event_title = @event.title

    # Supprime l'enregistrement de la base de données
    @event.destroy

    # Stocke un message d'information dans le flash (survit à la redirection)
    flash[:notice] = "L'événement « #{event_title} » a été supprimé."

    # Redirige vers la liste des événements
    redirect_to events_path
  end

  # ─── MÉTHODES PRIVÉES ───────────────────────────────────────────────────────

  private

  # Charge l'événement correspondant à l'ID passé dans l'URL
  # find! lève ActiveRecord::RecordNotFound si l'ID n'existe pas (géré dans ApplicationController)
  def set_event
    @event = Event.find(params[:id])
  end

  # Filtre et autorise uniquement les paramètres attendus (Strong Parameters)
  # Protège contre les attaques de type mass assignment
  def event_params
    params.require(:event)                  # Exige la clé :event dans les params
          .permit(                          # N'autorise que ces attributs
            :title,                         # Titre de l'événement
            :description,                   # Description détaillée
            :location,                      # Lieu de l'événement
            :event_date,                    # Date et heure
            :price,                         # Prix en euros
            :image_url                      # URL de l'image de couverture
          )
  end
end
