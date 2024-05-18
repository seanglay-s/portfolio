FROM --platform=linux/amd64 node:20.12.0-alpine3.19

WORKDIR /app

# Install pnpm globally
RUN npm install -g pnpm

COPY package.json pnpm-lock.yaml next.config.js ./

RUN pnpm install --production

COPY .next/standalone ./standalone
COPY .next/static ./standalone/.next/static
COPY public ./standalone/public

EXPOSE 4000
ENV PORT 4000

CMD ["npm", "start"]