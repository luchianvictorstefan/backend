FROM oven/bun:1
COPY bun.lockb package.json ./
RUN bun install --frozen-lockfile

COPY src ./src

EXPOSE 3000

CMD ["bun", "start"]