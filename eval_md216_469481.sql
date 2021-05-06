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
(`Name`, `Variety`, `PrimaryColor`, `LifeTime`, `Fresh`) 
VALUES 
('Aubergine','Aubergine_variety','violet'     ,1,1),
('Betterave','Betterave_variety','violet'     ,2,1),
('Carotte'  ,'Carotte_variety'  ,'Orange'     ,3,1),
('Daikon'   ,'Daikon_variety'   ,'bleu'       ,4,1),
('Endive'   ,'Endive_variety'   ,'blanc'      ,5,1),
('Fenouil'  ,'Fenouil_variety'  ,'vert'       ,6,1),
('Gingembre','Gingembre_variety','brun'       ,7,1),
('Haricot'  ,'Haricot_variety'  ,'marron'     ,8,1),
('Igname'   ,'Igname_variety'   ,'brun'       ,9,1),
('Jujube'   ,'Jujube_variety'   ,'jaune'      ,10,1),
('Kancon'   ,'Kancon_variety'   ,'ultraviolet',11,1),
('Lentille' ,'Lentille_variety' ,'vert'       ,12,1),
('Manioc'   ,'Manioc_variety'   ,'brun'       ,13,1),
('Navet'    ,'Navet_variety'    ,'vert'       ,14,1),
('Oignon'   ,'Oignon_variety'   ,'vert'       ,15,1),
('Potiron'  ,'Potiron_variety'  ,'orange'     ,16,1),
('Raifort'  ,'Raifort_variety'  ,'rose'       ,17,1),
('Soja'     ,'Soja_variety'     ,'blanc'      ,18,1),
('Taro'     ,'Taro_variety'     ,'blanc'      ,19,1),
('Udo'      ,'Udo_variety'      ,'jenesaispas',20,1);


INSERT INTO Sales 
(`SaleDate`, `SaleWeight`, `SaleUnitPrice`, `SaleActive`, `Id`) 
VALUES 
('2019-01-14', 5, 1.2   ,1,20),
('2023-02-25', 8, 2     ,2,14),
('2021-03-26', 2, 1     ,3,16),
('2014-05-31', 1, 2.5   ,4,14),
('2015-06-02', 2, 1     ,5,12),
('2021-09-03', 7, 2     ,6,10),
('2016-05-14', 8, 0.5   ,7,1),
('2018-07-15', 8, 1     ,8,1),
('2002-05-12', 9, 2     ,9,1),
('2001-12-16', 4, 1     ,10,1);


/* Afficher toutes les ventes avec le nom du légume associé à la vente */
SELECT `Name`,`SaleDate`, `SaleWeight`, `SaleUnitPrice`, `SaleActive`  FROM Vegetables JOIN Sales  ON Vegetables.Id = Sales.Id;

/* Afficher le nombre de ventes par légume */
SELECT `Name`, COUNT(*) AS `nombre de vente` FROM Vegetables JOIN Sales  ON Vegetables.Id = Sales.Id GROUP BY Sales.Id ORDER BY `nombre de vente` DESC;