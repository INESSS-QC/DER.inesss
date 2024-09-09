SELECT 
    e.nom AS Nom_Employe,
    e.prenom AS Prenom_Employe,
    p.nom_projet AS Nom_Projet,
    a.date_attribution AS Date_Attribution
FROM attributions AS a
JOIN employes AS e ON a.id_employe = e.id_employe
JOIN projets AS p ON a.id_projet = p.id_projet
JOIN departements AS d ON p.id_departement = d.id_departement
WHERE d.budget > 50000
ORDER BY p.nom_projet ASC, e.nom ASC, e.prenom ASC;
