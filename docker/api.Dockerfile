FROM node:18

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nodejs
USER nodejs

RUN mkdir /home/nodejs/app-mysql

WORKDIR /home/nodejs/app-mysql

COPY ./package.json ./yarn.lock* ./package-lock.json* ./pnpm-lock.yaml* ./

RUN \
  if [ -f yarn.lock ]; then yarn --frozen-lockfile; \
  elif [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then yarn global add pnpm && pnpm i; \
  else echo "Lockfile not found." && exit 1; \
  fi

COPY ./src ./src
COPY ./nodemon.json ./nodemon.json
COPY ./.env ./.env

CMD npm run dev
