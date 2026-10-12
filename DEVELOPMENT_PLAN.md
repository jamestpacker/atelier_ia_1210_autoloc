# Plan de développement — AutoLoc Pro

Les agents mentionnés ci-dessous correspondent aux profils du répertoire
`.github/agents/`. Le squad leader coordonne les dépendances et valide les
choix d’architecture.

## Phase 1 — Fondations et environnement de développement

**Responsables :** `squad-leader`, `backend-architect`, `frontend-crafter`,
`doc-scribe`

- Stabiliser l’architecture, les conventions et les contrats API.
- Ajouter les manifests backend/frontend et les squelettes de démarrage Flask/Vite.
- Valider Compose, `.env.example`, les commandes Make et les ports locaux.
- Documenter l’installation et la configuration.

**Sortie attendue :** démarrage local reproductible avec PostgreSQL, Redis,
Flask et Vite.

## Phase 2 — Modèle de données et API backend

**Responsable :** `backend-architect` ; **validation :** `code-reviewer`

- Concevoir les modèles, migrations et relations SQLAlchemy.
- Implémenter les services métier et les routes Flask versionnées.
- Ajouter validation d’entrée, pagination, gestion d’erreurs et documentation API.

**Sortie attendue :** API documentée et migrations applicables sur PostgreSQL.

## Phase 3 — Interface et socle frontend

**Responsable :** `frontend-crafter` ; **validation :** `code-reviewer`

- Configurer React, TypeScript strict, Tailwind et shadcn/ui.
- Ajouter navigation, composants partagés, accès API et gestion des états.
- Construire les parcours de recherche et de consultation des véhicules.

**Sortie attendue :** interface responsive connectée aux premiers endpoints.

## Phase 4 — Comptes, réservations et paiements

**Responsables :** `backend-architect`, `frontend-crafter`,
`security-sentinel`

- Ajouter inscription, connexion et sessions JWT en cookies HTTPOnly.
- Implémenter disponibilités, réservations et règles de tarification côté serveur.
- Intégrer Stripe avec validation des webhooks et traitement idempotent.
- Ne jamais exposer de secret ou de montant de confiance côté navigateur.

**Sortie attendue :** parcours de réservation et paiement testable en mode Stripe test.

## Phase 5 — Tests, intégration et sécurité

**Responsables :** `qa-guardian`, `security-sentinel` ; corrections par
`backend-architect` et `frontend-crafter`

- Écrire tests unitaires, intégration API et tests frontend/E2E.
- Vérifier authentification, autorisations, validation, concurrence et webhooks.
- Exécuter lint, migrations et tests sur une base de test isolée.
- Corriger les régressions et vulnérabilités avant validation.

**Sortie attendue :** résultats de tests reproductibles et revue sécurité documentée.

## Phase 6 — Préproduction, déploiement et documentation finale

**Responsables :** `doc-scribe`, `qa-guardian`, `code-reviewer`,
`squad-leader`

- Configurer les environnements Render et Vercel sans secrets dans le dépôt.
- Vérifier CORS, HTTPS, cookies sécurisés, migrations et observabilité.
- Finaliser les guides d’exploitation, de déploiement et de dépannage.
- Effectuer la revue finale et valider les critères de mise en production.

**Sortie attendue :** application prête pour un déploiement contrôlé et maintenable.
