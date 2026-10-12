# AutoLoc Pro

AutoLoc Pro est une application web de location de voitures.

## Prérequis

- Docker Engine avec Docker Compose v2
- Git
- Un terminal compatible avec `make`

## Installation en 5 étapes

1. **Récupérer le projet et préparer sa configuration**

   ```sh
   git clone <url-du-depot> autoloc-pro
   cd autoloc-pro
   cp .env.example .env
   ```

   Remplacez au minimum `POSTGRES_PASSWORD`, `SECRET_KEY` et `JWT_SECRET_KEY`
   par des valeurs locales. Compose construit l’URL PostgreSQL à partir des
   variables `POSTGRES_*` ; choisissez un mot de passe PostgreSQL compatible
   avec une URL (par exemple, lettres, chiffres, `-` et `_`). Les clés Stripe
   peuvent rester fictives tant que les paiements ne sont pas implémentés.

2. **Vérifier les manifests applicatifs**

   Les répertoires `backend/` et `frontend/` doivent contenir respectivement
   `requirements.txt` et `package.json`. Ils seront ajoutés avec les squelettes
   applicatifs de la phase 1. Compose installe ensuite les dépendances au démarrage.

3. **Démarrer les services de développement**

   ```sh
   make dev
   ```

   PostgreSQL et Redis écoutent sur `localhost:5432` et `localhost:6379`. Le
   backend Flask écoute sur `http://localhost:5000` avec le reloader activé ;
   Vite écoute sur `http://localhost:5173` avec le HMR.

4. **Initialiser la base de données**

   Une fois le backend démarré et ses migrations ajoutées, exécutez :

   ```sh
   make migrate
   make seed
   ```

   `make seed` requiert une commande Flask `seed`, qui sera fournie avec les
   données de développement.

5. **Lancer les contrôles**

   ```sh
   make test
   make lint
   ```

   Les cibles `test`, `migrate`, `seed` et `lint` s’exécutent dans les services
   Docker actifs. `make clean` arrête les conteneurs sans supprimer les volumes
   persistants ; `make logs` suit les journaux des services.

## Configuration

Toutes les variables d’environnement de développement sont documentées dans
[`.env.example`](./.env.example). Ne versionnez jamais `.env`, de vrais secrets,
des clés Stripe ou des données de production. Pour le déploiement, configurez
les variables séparément dans Render et Vercel.

## Développement

Le plan de réalisation, réparti en six phases avec les agents responsables, se
trouve dans [`DEVELOPMENT_PLAN.md`](./DEVELOPMENT_PLAN.md).
