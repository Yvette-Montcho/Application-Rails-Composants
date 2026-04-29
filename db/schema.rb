# db/schema.rb — Schéma de la base de données SQLite3 généré par Rails
# Ce fichier représente l'état actuel de la base de données
# NE PAS modifier manuellement — utilisez les migrations (rails db:migrate)

# Encode toutes les chaînes en UTF-8 pour supporter les caractères spéciaux
# force: :cascade recrée la table si elle existe déjà lors d'un db:schema:load

ActiveRecord::Schema[7.1].define(version: 2024_01_01_000001) do

  # ── TABLE EVENTS ────────────────────────────────────────────────────────────
  # Stocke tous les événements créés dans EventFreeka
  create_table "events", force: :cascade do |t|

    # Titre de l'événement (obligatoire, 100 caractères max)
    t.string   "title",       null: false

    # Description détaillée de l'événement (obligatoire, 20 caractères min)
    t.text     "description", null: false

    # Lieu de l'événement (ville, salle, adresse)
    t.string   "location",    null: false

    # Date et heure de l'événement (datetime = date + heure)
    t.datetime "event_date",  null: false

    # Prix en euros — decimal(8, 2) = jusqu'à 999999.99 €
    t.decimal  "price",       precision: 8, scale: 2, default: "0.0", null: false

    # URL optionnelle vers l'image de couverture
    t.string   "image_url"

    # Timestamps automatiques créés par Rails : created_at et updated_at
    t.timestamps
  end

  # Index sur event_date pour accélérer les requêtes de tri par date
  add_index "events", ["event_date"], name: "index_events_on_event_date"
end
