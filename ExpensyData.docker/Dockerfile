# Utiliser une image légère de Node.js comme base
FROM node:alpine

# Créer un répertoire de travail dans le conteneur
WORKDIR /app

# Copier le fichier JSON dans le répertoire de travail
COPY expensydata.json /app

# Installer un serveur Web simple (express) via npm
RUN npm install express

# Copier le script pour le serveur Web
COPY server.js /app

# Exposer le port 80 pour les connexions HTTP
EXPOSE 80

# Commande pour démarrer le serveur Web
CMD ["node", "server.js"]
