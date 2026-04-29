# db/migrate/20240101000001_create_events.rb — Migration de création de la table events
# Exécuter avec : rails db:migrate
# Cette migration crée la structure de la base de données pour les événements

class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    # Crée la table "events" en base de données SQLite3
    create_table :events do |t|

      # Titre de l'événement — string = VARCHAR (255 par défaut), null: false = obligatoire
      t.string :title, null: false

      # Description — text (taille illimitée) pour stocker de longs textes
      t.text :description, null: false

      # Lieu de l'événement — string courte
      t.string :location, null: false

      # Date et heure — datetime stocke les deux en un seul champ
      t.datetime :event_date, null: false

      # Prix — decimal avec 2 décimales pour les centimes, défaut à 0 (gratuit)
      t.decimal :price, precision: 8, scale: 2, default: 0.0, null: false

      # URL de l'image de couverture — optionnel (pas de null: false)
      t.string :image_url

      # Génère automatiquement les colonnes created_at et updated_at
      # Rails les met à jour automatiquement à chaque création/modification
      t.timestamps
    end

    # Ajoute un index sur la colonne event_date pour accélérer les recherches triées par date
    add_index :events, :event_date
  end
end
