SELECT 
    l.titre AS Titre_Livre,
    a.nom AS Nom_Auteur,
    a.prenom AS Prenom_Auteur,
    e.date_emprunt AS Date_Emprunt
FROM emprunts AS e
JOIN livres AS l ON e.id_livre = l.id_livre
JOIN auteurs AS a ON l.auteur_id = a.id_auteur
WHERE l.type_livre = "Roman"
ORDER BY e.date_emprunt DESC;
