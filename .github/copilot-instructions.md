# AutoLoc Pro — Instructions Globales Copilot

## Identité du projet

 Application web de location de voitures en ligne.
 Backend : Python 3.14 + Flask 3 (répertoire backend/)
 Frontend : React 18 + TypeScript + Vite (répertoire frontend/)
 Base de données : PostgreSQL 16 + SQLAlchemy 2.x + Alembic
 Cache : Redis 7
 Paiements : Stripe
 Auth : JWT tokens dans HTTPOnly cookies (JAMAIS localStorage)

## Conventions Python

- snake_case pour variables et fonctions
- PascalCase pour les classes
- Type hints partout (obligatoire)
- Docstrings Google style sur toutes les fonctions
- Toute logique métier dans services/ (jamais dans les routes)
- Validation via Pydantic sur tous les inputs

## Conventions TypeScript/React

- camelCase pour variables et fonctions
- PascalCase pour composants et interfaces
- TypeScript strict : pas de 'any' sans justification
- Composants fonctionnels uniquement
- Logique dans les hooks/ (jamais dans les composants)

## Format des commits (Conventional Commits)

 feat: | fix: | test: | docs: | refactor: | perf: | chore: | security:

## Règles de sécurité NON-NÉGOCIABLES

- JAMAIS de secret dans le code → toujours os.getenv()
- JAMAIS de SQL brut avec f-string → SQLAlchemy ORM uniquement
- CORS : origines explicites, jamais '*' en production
- Logs : jamais logger password, token, numéro de carte

## Format des réponses API

 Succès : { data: T, meta?: PaginationMeta }
 Erreur : { error: string, code: string, details?: object }

## Agents disponibles

 @agent:squad-leader | @agent:backend | @agent:frontend
 @agent:qa | @agent:security | @agent:doc | @agent:reviewer
