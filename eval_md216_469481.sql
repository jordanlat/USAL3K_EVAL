DROP DATABASE IF EXISTS usal37_legumos;
CREATE DATABASE IF NOT EXISTS usal37_legumos;
USE usal37_legumos;

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
) Engine=InnoDb;