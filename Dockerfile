# Utiliser une image Node.js officielle depuis Docker Hub
FROM node:16

# Créer un répertoire de travail dans le conteneur
WORKDIR ./index
# Copier votre fichier JavaScript dans le conteneur
COPY index.js .

# Exposer un port si nécessaire (par exemple, si votre app.js écoute sur un port)
EXPOSE 	55000

# Lancer le fichier JavaScript avec Node.js
CMD ["node", "index.js"]
