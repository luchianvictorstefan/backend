## A simple service with express and drizzle

### How to run locally?
- Create .env file from .env.example

- Create docker-compose.yml file and run it
  ```yml
  services:
  postgres:
    image: postgis/postgis:16-3.4-alpine
    volumes:
      - postgres-data:/var/lib/postgresql
    restart: on-failure
    ports:
      - "5432:5432"
    environment:
      POSTGRES_PASSWORD: ${DB_PASSWORD}
      POSTGRES_USER: ${DB_USER}
      POSTGRES_DB: ${DB_NAME}
  volumes:
    postgres-data:
  ```

- Generate dbml schema
  `npx pg-to-dbml --c=postgresql://postgres:pass@localhost:5432/postgres --sep=true`
- `pnpm install`
- `pnpm run dev`