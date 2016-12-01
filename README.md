# README #

#ARCHITECTURE#
- MVC, pour un projet plus conséquent j'aurais utilisé MVVM, un pattern inspiré par le .NET qui permet de séparer les logiques et facilite l'implémentation des test unitaires.

#Tets unitaires#
- Pattern factory pour mocker les objects métiers
- Pour le cas pratique et vu le timing j'ai préféré faire le développement directement puis la test unitaires plus tard. En temps normal j'aurais fais du Test Driven Development, qui reste pour moi la meilleures façon de produire du code scalable et robuste, et de garder une productivité exponentielle durant un projet.

## WebServices ##
- pattern router : Principe -> Avoir une structure qui prend un type d'enum et des paramètre afin de renvoyer une url construire selon la méthode appelée.
- Serialisation: Le but est de créer une extension qui aux requête qui renvoie des objects métiers au lieu d'une réponse json brute.

## Mode offline ##
Implémentation de Nscoding qui va permettre encodé les objects en un format compréhensible par les userDefault. Je n'ai pas eu besoin d'utiliser une base de données car le model relationnel n'est pas nécessaire pour stocker les users. Dans le contraire j'aurais utiliser CoreData ou Realm, en fonction de la complexité du model.

## UI ##
TableViewController avec transition en segue, pas besoin de plusieurs storyboard, nous avons un seul workflow
Je suis partie sur des vues assez basiques, donc pas besoin de créer des sous classes pour les cellules, ou des presentations control pour découper les vues.
En temps normal il est recommandé de créer une extension pour chaque protocol implémenté, par exemple pour un tableviewController X, créeer une extension X+datasource et X+delegate pour séparer les logiques et répondre au Single Responsability Principle
j'ai aussi rajouté un pull to refresh pour recharger els données

#Outils#
- gestion des dépendances avec cocoapods
- Git pour la gestion de version


#Frameworks#
Alamofire et swiftyjson: Requêtes webservice et exploitation json
Reachability : test connexion internet
OhHttpStubs: Applications de bouchons réseaux , utiles pour les test unitaires
       

#Difficultés#
Ecrire la classe response serializer

pourcentage : 30%