DROP DATABASE IF EXISTS usal37_legumos;
CREATE DATABASE IF NOT EXISTS usal37_legumos;
USE usal37_legumos;


/* Création des tables */
CREATE TABLE Vegetables 
(
   `Id` INT PRIMARY KEY AUTO_INCREMENT,
   `Name` VARCHAR(50) NOT NULL,
   `Variety` VARCHAR(50) NOT NULL,
   `PrimaryColor` VARCHAR(20) NOT NULL,
   `LifeTime` INT NOT NULL,
   `Fresh` INT NOT NULL
) Engine=InnoDb;

CREATE TABLE Sales 
(
   `SaleId` INT PRIMARY KEY AUTO_INCREMENT,
   `SaleDate` DATE NOT NULL,
   `SaleWeight` INT NOT NULL,
   `SaleUnitPrice` DECIMAL(5,2) NOT NULL,
   `SaleActive` INT NOT NULL,
   `Id` INT NOT NULL,
   FOREIGN KEY (Id) REFERENCES Vegetables(Id) 
) Engine=INNODB;


/* Insertion de lot de données */
INSERT INTO Vegetables 
(`Name`,         `Variety`,       `PrimaryColor`, `LifeTime`, `Fresh`) 
VALUES 
('Aubergine','Aubergine_variety'     ,'violet'       ,1         ,0),
('Betterave','Betterave_variety'     ,'violet'       ,2         ,0),
('Carotte'  ,'Carotte_variety'       ,'Orange'       ,3         ,0),
('Daikon'   ,'Daikon_variety'        ,'bleu'         ,4         ,0),
('Endive'   ,'Endive_variety'        ,'blanc'        ,5         ,0),
('Fenouil'  ,'Fenouil_variety'       ,'vert'         ,6         ,0),
('Gingembre','Gingembre_variety'     ,'brun'         ,7         ,0),
('Haricot'  ,'Haricot_variety'       ,'marron'       ,8         ,0),
('Igname'   ,'Igname_variety'        ,'brun'         ,9         ,0),
('Jujube'   ,'Jujube_variety'        ,'jaune'        ,10        ,0),
('Kancon'   ,'Kancon_variety'        ,'ultraviolet'  ,11        ,0),
('Lentille' ,'Lentille_variety'      ,'vert'         ,12        ,0),
('Manioc'   ,'Manioc_variety'        ,'brun'         ,13        ,0),
('Navet'    ,'Navet_variety'         ,'vert'         ,14        ,0),
('Oignon'   ,'Oignon_variety'        ,'vert'         ,15        ,0),
('Potiron'  ,'Potiron_variety'       ,'orange'       ,16        ,0),
('Raifort'  ,'Raifort_variety'       ,'rose'         ,17        ,0),
('Soja'     ,'Soja_variety'          ,'blanc'        ,18        ,0),
('Taro'     ,'Taro_variety'          ,'blanc'        ,19        ,0),
('Udo'      ,'Udo_variety'           ,'jenesaispas'  ,20        ,0);


INSERT INTO Sales 
(`SaleDate`, `SaleWeight`, `SaleUnitPrice`, `SaleActive`, `Id`) 
VALUES 
('2019-01-14',    5      ,        1.2     ,       1      , 20),
('2023-02-25',    8      ,        2       ,       2      , 14),
('2021-03-26',    2      ,        1       ,       3      , 16),
('2014-05-31',    1      ,        2.5     ,       4      , 14),
('2015-06-02',   10      ,        1       ,       5      , 12),
('2021-09-03',    7      ,        2       ,       6      , 10),
('2016-05-14',    8      ,        0.5     ,       7      , 1),
('2018-07-15',    8      ,        1       ,       8      , 1),
('2002-05-12',    10     ,        2       ,       9      , 1),
('2001-12-16',    4      ,        1       ,       10     , 1);


/* Afficher toutes les ventes avec le nom du légume associé à la vente */
SELECT `Name`,`SaleDate`, `SaleWeight`, `SaleUnitPrice`, `SaleActive`  FROM Vegetables JOIN Sales  ON Vegetables.Id = Sales.Id;

/* Afficher le nombre de ventes par légume */
SELECT `Name`, COUNT(Sales.Id) AS `nombre de vente` FROM Vegetables JOIN Sales  ON Vegetables.Id = Sales.Id GROUP BY Sales.Id ORDER BY `nombre de vente` DESC;



/*
*	Procédure stockés
*/

/* «Tous les légumes dont le temps de conservation est strictement inférieur à 7 jours doivent être conservés au frais » */
DELIMITER $$

CREATE PROCEDURE set_fresh()

BEGIN

	START TRANSACTION;
	SELECT * FROM Vegetables;
   UPDATE Vegetables SET Fresh = 1 WHERE Vegetables.LifeTime < 7;
	COMMIT;


END $$
DELIMITER ; 

/*
CALL `set_fresh`();
*/



/* « Appliquer une réduction de 20% sur le prix unitaire de toutes les ventes dont le poids excède 10kgs. »  */
DELIMITER $$

CREATE PROCEDURE set_reduction()

BEGIN

	START TRANSACTION;
	SELECT * FROM Sales;
   UPDATE Sales SET SaleUnitPrice = SaleUnitPrice - (SaleUnitPrice*0.2) WHERE Sales.SaleWeight > 10;
	COMMIT;


END $$
DELIMITER ; 