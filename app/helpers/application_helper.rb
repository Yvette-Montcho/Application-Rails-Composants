# app/helpers/application_helper.rb — Méthodes utilitaires disponibles dans toutes les views
# Les helpers sont des méthodes Ruby accessibles directement dans les fichiers .html.erb

module ApplicationHelper
  # Convertit le type d'un flash Rails en classe CSS Bootstrap correspondante
  # Appelé dans la partial _flash.html.erb pour styler dynamiquement les alertes
  #
  # Exemples de correspondances :
  #   flash[:notice]  => "alert-info"    (bleu  — message informatif)
  #   flash[:success] => "alert-success" (vert  — opération réussie)
  #   flash[:error]   => "alert-danger"  (rouge — erreur)
  #   flash[:alert]   => "alert-warning" (orange — avertissement)
  def bootstrap_class_for_flash(type)
    # La structure case/when retourne la classe Bootstrap selon le type reçu
    case type.to_s          # .to_s garantit que le type est bien une chaîne de caractères
    when "notice"  then "alert-info"      # Info : fond bleu clair
    when "success" then "alert-success"   # Succès : fond vert
    when "error"   then "alert-danger"    # Erreur : fond rouge
    when "alert"   then "alert-warning"   # Alerte : fond orange
    else                    "alert-secondary" # Valeur par défaut si le type est inconnu
    end
  end

  # Retourne le titre de la page avec le nom de l'application en suffixe
  # Permet d'avoir un <title> cohérent dans toutes les pages
  def page_title(title = nil)
    # Si un titre est passé en argument, on le concatène au nom de l'app
    title.present? ? "#{title} | EventFreeka" : "EventFreeka"
  end
end
