# Gemfile — Déclare toutes les dépendances Ruby du projet EventFreeka
# Exécuter `bundle install` après toute modification de ce fichier

# Spécifie la source officielle pour télécharger les gems
source "https://rubygems.org"

# Version de Ruby requise pour faire tourner l'application
ruby "3.2.2"

# Framework principal : Ruby on Rails (version 7.1)
gem "rails", "~> 7.1"

# Adaptateur de base de données SQLite3 (idéal pour le développement local)
gem "sqlite3", "~> 1.4"

# Serveur web Puma utilisé par Rails en développement et en production
gem "puma", ">= 5.0"

# Permet de compiler et servir les assets CSS/JS via le pipeline Rails
gem "sprockets-rails"

# Gestion des imports CSS/JS modernes via importmap (sans Node.js)
gem "importmap-rails"

# Intégration de Turbo Drive et Turbo Frames pour des navigations rapides sans rechargement de page
gem "turbo-rails"

# Stimulus : framework JavaScript léger pour enrichir le HTML côté client
gem "stimulus-rails"

# Générateur de JSONs élégant et performant pour les APIs Rails
gem "jbuilder"

# Bootsnap : accélère le démarrage de l'application en mettant en cache les fichiers compilés
gem "bootsnap", require: false

# Groupe de gems utilisées uniquement en développement et en test
group :development, :test do
  # Débogueur interactif intégré à Rails (permet les breakpoints avec `debugger`)
  gem "debug", platforms: %i[ mri windows ]
end

# Groupe de gems utilisées uniquement en développement
group :development do
  # Barre de débogage affichée dans le navigateur (temps de requête, SQL, etc.)
  gem "web-console"
end

# Groupe de gems utilisées uniquement en test
group :test do
  # Capybara : simule les interactions utilisateur dans les tests d'intégration
  gem "capybara"
  # Selenium WebDriver : pilote un vrai navigateur pour les tests système
  gem "selenium-webdriver"
end
