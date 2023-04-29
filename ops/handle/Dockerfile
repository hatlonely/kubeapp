FROM node:20.0.0-alpine3.17

RUN apk add git
RUN npm install pnpm -g && pnpm config set registry https://registry.npmmirror.com/
RUN git clone --depth 1 --branch main https://github.com/antfu/handle.git
RUN cd handle && pnpm install
WORKDIR /handle
CMD ["pnpm", "dev"]
