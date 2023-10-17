const express = require('express');
const app = express();
const port = 80;

// Définir le chemin du fichier JSON
const fichierJSON = 'expensydata.json';

// Endpoint pour servir le fichier JSON
app.get('/', (req, res) => {
    res.sendFile(fichierJSON, { root: __dirname });
});

// Démarrer le serveur sur le port 80
app.listen(port, () => {
    console.log(`Serveur en cours d'exécution sur le port ${port}`);
});
