FROM node:20-alpine AS builder
WORKDIR /usr/src/app

COPY package*.json tsconfig*.json ./
RUN npm install

COPY prisma ./prisma
COPY src ./src
RUN npm run build
RUN npx prisma generate


FROM node:20-alpine AS runner
WORKDIR /usr/src/app
ENV NODE_ENV=production

COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY --from=builder /usr/src/app/dist ./dist
COPY --from=builder /usr/src/app/prisma ./prisma
COPY package*.json ./

# expose backend port
EXPOSE 5006

CMD ["node", "dist/app.js"]
