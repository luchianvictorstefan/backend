FROM oven/bun:1
COPY bun.lockb package.json ./
RUN bun install --frozen-lockfile

COPY src ./src

EXPOSE 8080

CMD ["bun", "start"]