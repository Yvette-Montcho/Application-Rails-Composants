# EventFreeka — Application Rails & Composants

> Projet pédagogique illustrant le design atomique avec le système de **partials Rails**,
> la gestion des **alertes Flash Bootstrap**, et l'organisation moderne du front-end
> dans une application Ruby on Rails.

---

## Table des matières

1. [À propos du projet](#à-propos-du-projet)
2. [Fonctionnalités](#fonctionnalités)
3. [Architecture des partials](#architecture-des-partials)
4. [Prérequis](#prérequis)
5. [Installation et exécution](#installation-et-exécution)
6. [Exécution avec VS Code](#exécution-avec-vs-code)
7. [Extensions VS Code recommandées](#extensions-vs-code-recommandées)
8. [Structure du projet](#structure-du-projet)
9. [Nom du repository GitHub](#nom-du-repository-github)

---

## À propos du projet

**EventFreeka** est une application web de gestion d'événements construite avec **Ruby on Rails 7**.
Elle démontre comment décomposer le front-end d'une application Rails en **partials réutilisables**
selon les principes du **design atomique** et de la philosophie **DRY** (Don't Repeat Yourself).

### Concepts illustrés

| Concept | Description |
|---|---|
| **Partials Rails** | Bouts de code HTML encapsulés et appelables depuis n'importe quelle view |
| **application.html.erb** | Layout principal appelant header, flash et footer sur toutes les pages |
| **Flash Bootstrap** | Système d'alertes stylées avec correspondance automatique des classes CSS |
| **Design atomique** | Organisation du code par composants (atomes → molécules → organismes) |
| **DRY** | Formulaire partagé entre `new` et `edit` via une seule partial `_form` |

---

## Fonctionnalités

- ✅ **Liste des événements** avec grille responsive (Bootstrap)
- ✅ **Création** d'un événement avec formulaire validé
- ✅ **Modification** d'un événement (réutilise la même partial de formulaire)
- ✅ **Suppression** avec confirmation JavaScript
- ✅ **Alertes Flash** stylées automatiquement avec Bootstrap (succès, erreur, info, warning)
- ✅ **Thème Bootswatch Lux** pour un rendu professionnel
- ✅ **Bannière partagée** avec variables locales (titre, sous-titre, couleur)
- ✅ **Responsive** : fonctionne sur mobile, tablette et desktop

---

## Architecture des partials

```
80% du HTML dans des partials — les views ne font qu'assembler des composants
```

| Partial | Emplacement | Rôle |
|---|---|---|
| `_header` | `app/views/layouts/` | Barre de navigation (toutes les pages) |
| `_footer` | `app/views/layouts/` | Pied de page (toutes les pages) |
| `_flash` | `app/views/layouts/` | Alertes Flash Bootstrap (toutes les pages) |
| `_banner` | `app/views/shared/` | Bannière hero réutilisable avec variables locales |
| `_event` | `app/views/events/` | Carte d'événement (index) |
| `_form` | `app/views/events/` | Formulaire partagé (new + edit) |

**Appel dans `application.html.erb` :**
```erb
<%= render 'layouts/header' %>
<%= render 'layouts/flash' %>
<%= yield %>
<%= render 'layouts/footer' %>
```

---

## Prérequis

Avant d'installer le projet, assurez-vous d'avoir :

| Outil | Version | Vérification |
|---|---|---|
| **Ruby** | 3.2.2+ | `ruby -v` |
| **Rails** | 7.1+ | `rails -v` |
| **Bundler** | 2.x | `bundle -v` |
| **SQLite3** | 3.x | `sqlite3 --version` |
| **Git** | 2.x | `git --version` |

### Installation de Ruby et Rails (si non installés)

```bash
# Avec rbenv (recommandé)
rbenv install 3.2.2
rbenv global 3.2.2
gem install rails
```

---

## Installation et exécution

### 1. Cloner le repository

```bash
git clone https://github.com/VOTRE_USERNAME/eventfreeka-rails-components.git
cd eventfreeka-rails-components
```

### 2. Installer les dépendances Ruby

```bash
bundle install
```

### 3. Créer et migrer la base de données

```bash
# Crée la base SQLite3, exécute les migrations et peuple avec des données de test
rails db:setup
```

> Équivalent à `rails db:create + rails db:migrate + rails db:seed`

### 4. Lancer le serveur de développement

```bash
rails server
# ou la forme courte :
rails s
```

### 5. Ouvrir l'application dans le navigateur

```
http://localhost:3000
```

---

## Exécution avec VS Code

### Méthode 1 : Terminal intégré VS Code (recommandée)

1. **Ouvrir le projet** dans VS Code :
   ```
   Fichier → Ouvrir le dossier → sélectionner le dossier `eventfreeka`
   ```

2. **Ouvrir le terminal intégré** :
   - Raccourci : `` Ctrl + ` `` (backtick)
   - Ou menu : `Terminal → Nouveau terminal`

3. **Exécuter les commandes** dans le terminal :
   ```bash
   bundle install
   rails db:setup
   rails server
   ```

4. **Ouvrir dans le navigateur** : cliquer sur le lien `http://localhost:3000`
   qui apparaît dans le terminal (il est cliquable avec `Ctrl + clic`)

### Méthode 2 : Tâches VS Code (tasks.json)

Créez le fichier `.vscode/tasks.json` pour lancer le serveur en un clic :

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Rails Server",
      "type": "shell",
      "command": "rails server",
      "group": {
        "kind": "build",
        "isDefault": true
      },
      "presentation": {
        "reveal": "always",
        "panel": "new"
      }
    },
    {
      "label": "Rails DB Setup",
      "type": "shell",
      "command": "rails db:setup"
    }
  ]
}
```

Puis lancez avec : `Ctrl + Shift + B` (tâche de build par défaut).

### Méthode 3 : Bouton Run and Debug

1. Créez `.vscode/launch.json` :
   ```json
   {
     "version": "0.2.0",
     "configurations": [
       {
         "name": "Rails Server",
         "type": "ruby_lsp",
         "request": "launch",
         "program": "${workspaceFolder}/bin/rails",
         "args": ["server", "-b", "localhost"]
       }
     ]
   }
   ```
2. Appuyez sur `F5` pour lancer avec le débogueur.

---

## Extensions VS Code recommandées

Installez ces extensions pour une expérience de développement Rails optimale :

### Indispensables

| Extension | ID | Description |
|---|---|---|
| **Ruby LSP** | `Shopify.ruby-lsp` | Autocomplétion, navigation et refactoring Ruby (officiel Shopify) |
| **ERB Helper Tags** | `rayhanw.erb-helper-tags` | Snippets et coloration syntaxique pour les fichiers `.html.erb` |
| **Rails** | `bung345.rails` | Navigation rapide entre models, views et controllers (Ctrl+clic) |

### Fortement recommandées

| Extension | ID | Description |
|---|---|---|
| **GitLens** | `eamodio.gitlens` | Historique Git enrichi directement dans VS Code |
| **Prettier** | `esbenp.prettier-vscode` | Formatage automatique du code HTML/CSS/JS |
| **Bootstrap 5 Quick Snippets** | `AnbuselvanRocky.bootstrap5-vscode` | Snippets Bootstrap 5 (cards, buttons, grid…) |
| **Auto Rename Tag** | `formulahendry.auto-rename-tag` | Renomme automatiquement les balises HTML ouvrantes/fermantes |
| **Indent Rainbow** | `oderwat.indent-rainbow` | Colorise les niveaux d'indentation (très utile en ERB) |

### Optionnelles (confort)

| Extension | ID | Description |
|---|---|---|
| **Material Icon Theme** | `PKief.material-icon-theme` | Icônes de fichiers colorées selon le type |
| **One Dark Pro** | `zhuangtongfa.material-theme` | Thème sombre très populaire pour VS Code |
| **Path IntelliSense** | `christian-kohler.path-intellisense` | Autocomplétion des chemins de fichiers |

### Installation rapide (toutes en une commande)

```bash
code --install-extension Shopify.ruby-lsp \
     --install-extension rayhanw.erb-helper-tags \
     --install-extension bung345.rails \
     --install-extension eamodio.gitlens \
     --install-extension esbenp.prettier-vscode \
     --install-extension AnbuselvanRocky.bootstrap5-vscode \
     --install-extension formulahendry.auto-rename-tag \
     --install-extension oderwat.indent-rainbow \
     --install-extension PKief.material-icon-theme
```

---

## Structure du projet

```
eventfreeka/
├── app/
│   ├── controllers/
│   │   ├── application_controller.rb   # Contrôleur de base (gestion 404)
│   │   └── events_controller.rb        # CRUD complet avec flash messages
│   ├── helpers/
│   │   └── application_helper.rb       # bootstrap_class_for_flash + page_title
│   ├── models/
│   │   └── event.rb                    # Modèle avec validations et scopes
│   └── views/
│       ├── events/
│       │   ├── _event.html.erb         # Partial : carte d'un événement
│       │   ├── _form.html.erb          # Partial : formulaire (new + edit)
│       │   ├── edit.html.erb           # View : modification
│       │   ├── index.html.erb          # View : liste des événements
│       │   ├── new.html.erb            # View : création
│       │   └── show.html.erb           # View : détail
│       ├── layouts/
│       │   ├── _flash.html.erb         # Partial : alertes Bootstrap
│       │   ├── _footer.html.erb        # Partial : pied de page
│       │   ├── _header.html.erb        # Partial : barre de navigation
│       │   └── application.html.erb    # Layout principal
│       └── shared/
│           └── _banner.html.erb        # Partial : bannière réutilisable
├── config/
│   └── routes.rb                       # 7 routes RESTful + root
├── db/
│   ├── migrate/
│   │   └── 20240101000001_create_events.rb
│   ├── schema.rb
│   └── seeds.rb                        # 5 événements de démonstration
├── Gemfile
└── README.md
```

---

## Nom du repository GitHub

> **Nom recommandé : `eventfreeka-rails-components`**

Ce nom est :
- **Descriptif** : il indique clairement le projet (EventFreeka) et le concept principal (Rails + composants/partials)
- **SEO-friendly** : les mots-clés Rails et components sont reconnus par GitHub
- **Convention GitHub** : kebab-case (minuscules + tirets), sans espaces ni accents

### Commandes pour publier sur GitHub

```bash
# Dans le dossier du projet
git init
git add .
git commit -m "Initial commit: EventFreeka Rails components project"
git branch -M main
git remote add origin https://github.com/VOTRE_USERNAME/eventfreeka-rails-components.git
git push -u origin main
```

---

## Licence

Ce projet est réalisé dans un cadre pédagogique — libre d'utilisation et de modification.
