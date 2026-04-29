# db/seeds.rb — Données de test pour peupler la base de données en développement
# Exécuter avec : rails db:seed (ou rails db:setup pour migrate + seed en une commande)

# Supprime tous les événements existants pour repartir d'un état propre
puts "🌱 Suppression des anciens événements..."
Event.destroy_all

# Tableau de données pour les événements de test
events_data = [
  {
    title:       "Concert de jazz au Parc Monceau",
    description: "Une soirée magique sous les étoiles avec les meilleurs jazzmen de Paris. " \
                 "Au programme : standards de jazz, bossa nova et improvisations live. " \
                 "Ambiance chaleureuse garantie, venez avec votre pique-nique !",
    location:    "Parc Monceau, Paris 8e",
    event_date:  1.month.from_now,  # Dans 1 mois à partir d'aujourd'hui
    price:       15.00,
    image_url:   "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?w=800"
  },
  {
    title:       "Atelier Rails pour débutants",
    description: "Apprenez Ruby on Rails en une journée ! Cet atelier pratique vous guidera " \
                 "de l'installation jusqu'au déploiement d'une première application web. " \
                 "Aucune expérience Rails requise, seules des bases en HTML/CSS sont nécessaires.",
    location:    "Le Wagon, 16 Villa Gaudelet, Paris 11e",
    event_date:  2.weeks.from_now,  # Dans 2 semaines
    price:       0.00,              # Événement gratuit
    image_url:   "https://images.unsplash.com/photo-1587620962725-abab19836100?w=800"
  },
  {
    title:       "Exposition : Art Numérique & IA",
    description: "Découvrez les œuvres générées par intelligence artificielle dans cette " \
                 "exposition unique qui questionne les frontières de la créativité. " \
                 "Des artistes du monde entier présentent leurs créations hybrides, " \
                 "entre technologie et expression artistique.",
    location:    "Centre Pompidou, Paris 4e",
    event_date:  3.weeks.from_now,  # Dans 3 semaines
    price:       12.00,
    image_url:   "https://images.unsplash.com/photo-1547826039-bfc35e0f1ea8?w=800"
  },
  {
    title:       "Marathon de Paris 2025",
    description: "Le plus grand marathon de France vous attend ! 42,195 km à travers les " \
                 "plus beaux monuments de la capitale. Tous les niveaux sont les bienvenus, " \
                 "que vous visiez le podium ou simplement l'arrivée. L'inscription comprend " \
                 "le dossard, le t-shirt officiel et le ravitaillement.",
    location:    "Place de l'Étoile, Paris 8e",
    event_date:  2.months.from_now,  # Dans 2 mois
    price:       80.00,
    image_url:   "https://images.unsplash.com/photo-1513593771513-7b58b6c4af38?w=800"
  },
  {
    title:       "Conférence Tech : Le futur du Web",
    description: "Les meilleurs experts du domaine vous parleront des tendances qui vont " \
                 "façonner le développement web de demain : WebAssembly, Edge Computing, " \
                 "IA générative dans le navigateur, et bien plus encore. Networking et " \
                 "buffet inclus dans le billet.",
    location:    "Station F, 5 Parvis Alan Turing, Paris 13e",
    event_date:  10.days.from_now,  # Dans 10 jours
    price:       25.00,
    image_url:   "https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=800"
  }
]

# Crée chaque événement en base et affiche un message de confirmation
events_data.each do |event_attrs|
  event = Event.create!(event_attrs)  # create! lève une exception si invalide (fail fast)
  puts "  ✅ Créé : #{event.title} — #{event.formatted_price}"
end

# Affiche un résumé final
puts "\n🎉 #{Event.count} événements créés avec succès !"
