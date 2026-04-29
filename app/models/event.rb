# app/models/event.rb — Modèle représentant un événement dans EventFreeka
# Hérite d'ApplicationRecord qui fournit les méthodes Active Record (save, find, etc.)

class Event < ApplicationRecord
  # ─── VALIDATIONS ────────────────────────────────────────────────────────────

  # Le titre est obligatoire et limité à 100 caractères maximum
  validates :title, presence: true, length: { maximum: 100 }

  # La description est obligatoire et doit contenir au moins 20 caractères
  validates :description, presence: true, length: { minimum: 20 }

  # Le lieu est obligatoire
  validates :location, presence: true

  # La date de l'événement est obligatoire
  validates :event_date, presence: true

  # Le prix est obligatoire, numérique, et ne peut pas être négatif
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }

  # L'URL de l'image est optionnelle mais doit être une URL valide si présente
  validates :image_url,
            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]),
                      message: "doit être une URL valide (http/https)" },
            allow_blank: true

  # ─── SCOPES ─────────────────────────────────────────────────────────────────

  # Scope pour récupérer uniquement les événements à venir (date >= aujourd'hui)
  scope :upcoming, -> { where("event_date >= ?", Date.today).order(:event_date) }

  # Scope pour trier les événements du plus récent au plus ancien
  scope :recent, -> { order(created_at: :desc) }

  # ─── MÉTHODES UTILITAIRES ───────────────────────────────────────────────────

  # Retourne "Gratuit" si le prix est 0, sinon formate le prix en euros
  def formatted_price
    price.zero? ? "Gratuit" : "#{price} €"
  end

  # Retourne l'URL par défaut si aucune image n'est renseignée
  def display_image
    image_url.presence || "https://via.placeholder.com/800x400?text=EventFreeka"
  end
end
