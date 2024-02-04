FROM node:21-alpine
# ARG NODE_ENV=production
# ENV NODE_ENV=${NODE_ENV}
ENV VITE_PROMO=Hati
ENV VITE_ENV=dev

# Setting up the work directory
WORKDIR /app

# Copying all the files in our project
COPY . .
RUN npm install
# Starting our application

EXPOSE 5173
CMD npm run dev