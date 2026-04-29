# app/controllers/application_controller.rb — Contrôleur de base de l'application
# Tous les autres contrôleurs héritent de celui-ci, ce qui permet de partager
# des méthodes communes (authentification, gestion des erreurs, etc.)

class ApplicationController < ActionController::Base
  # ActiveSupport::SecurityUtils::MaskTime n'est pas nécessaire ici
  # ActionController::Base fournit déjà la protection CSRF et les sessions

  # ─── PROTECTION CONTRE LES ERREURS 404 ─────────────────────────────────────

  # Intercepte les exceptions de type ActiveRecord::RecordNotFound
  # levées quand un find! ne trouve pas l'enregistrement en base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  # Méthode appelée automatiquement quand un enregistrement est introuvable
  # Redirige vers la page d'accueil avec un message d'erreur
  def record_not_found
    # Stocke un message d'erreur dans le flash (visible une seule page)
    flash[:alert] = "L'événement demandé n'existe pas ou a été supprimé."

    # Redirige vers la liste des événements (root_path = "/")
    redirect_to root_path
  end
end
