

CREATE SCHEMA IF NOT EXISTS `GiddyGoat`;
USE `GiddyGoat` ;

-- FabricType table
CREATE TABLE IF NOT EXISTS `GiddyGoat`.`FabricType` (
  `FabricType_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`FabricType_ID`),
  UNIQUE INDEX `ID_UNIQUE` (`FabricType_ID` ASC))
;

-- NotionType table
CREATE TABLE IF NOT EXISTS `GiddyGoat`.`NotionType` (
  `Notion_type_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Notion_type_ID`),
  UNIQUE INDEX `Id_UNIQUE` (`Notion_type_ID` ASC))
;

-- Fabric table
CREATE TABLE IF NOT EXISTS `GiddyGoat`.`Fabric` (
  `Fabric_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Cost` DOUBLE NOT NULL,
  `PrimaryColour` VARCHAR(7) NOT NULL,
  `SecondaryColour` VARCHAR(7) NOT NULL,
  `TernaryColour` VARCHAR(7) NOT NULL,
  `Image` BLOB NOT NULL,
  `FabricType_ID` INT NOT NULL,
  PRIMARY KEY (`Fabric_ID`),
  UNIQUE INDEX `ID_UNIQUE` (`Fabric_ID` ASC),
  CONSTRAINT `fk_Fabric_FabricType`
    FOREIGN KEY (`FabricType_ID`)
    REFERENCES `GiddyGoat`.`FabricType` (`FabricType_ID`)
	)
;

-- Class table
CREATE TABLE IF NOT EXISTS `GiddyGoat`.`Class` (
  `Class_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Price` DOUBLE NOT NULL,
  `ClassDate` DATETIME NOT NULL,
  `ClassTime` DATETIME NOT NULL,
  `Size` INT NOT NULL,
  PRIMARY KEY (`Class_ID`))
;

-- Member table
CREATE TABLE IF NOT EXISTS `GiddyGoat`.`Member` (
  `Member_ID` INT NOT NULL AUTO_INCREMENT,
  `Firstname` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `PhoneNo` VARCHAR(9) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Address1` VARCHAR(45) NOT NULL,
  `NewsLetterSub` ENUM('Y', 'N') NOT NULL DEFAULT 'Y',
  `Address2` VARCHAR(45) NOT NULL,
  `Address3` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `county` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Member_ID`))
;

-- ClassBooking table
CREATE TABLE IF NOT EXISTS `GiddyGoat`.`ClassBooking` (
  `Class_ID` INT NOT NULL,
  `Member_ID` INT NOT NULL,
  `Paid` TINYINT(1) NOT NULL,
  PRIMARY KEY (`Class_ID`, `Member_ID`),
  CONSTRAINT `fk_Class_has_Member_Class1`
    FOREIGN KEY (`Class_ID`)
    REFERENCES `GiddyGoat`.`Class` (`Class_ID`),
  CONSTRAINT `fk_Class_has_Member_Member1`
    FOREIGN KEY (`Member_ID`)
    REFERENCES `GiddyGoat`.`Member` (`Member_ID`)
	)
;

-- Purchase table
CREATE TABLE IF NOT EXISTS `GiddyGoat`.`Purchase` (
  `Purchase_ID` INT NOT NULL,
  `DateOfPurchase` DATETIME NOT NULL,
  `Member_ID` INT NOT NULL,
  PRIMARY KEY (`Purchase_ID`),
  CONSTRAINT `fk_Purchase_Member1`
    FOREIGN KEY (`Member_ID`)
    REFERENCES `GiddyGoat`.`Member` (`Member_ID`)
	)
;

-- Notion table
CREATE TABLE IF NOT EXISTS `GiddyGoat`.`Notion` (
  `Notion_ID` INT NOT NULL AUTO_INCREMENT,
  `Description` VARCHAR(255) NOT NULL,
  `Cost` DOUBLE NOT NULL,
  `Image` BLOB NOT NULL,
  `NotionType_ID` INT NOT NULL,
  PRIMARY KEY (`Notion_ID`),
  UNIQUE INDEX `ID_UNIQUE` (`Notion_ID` ASC),
  CONSTRAINT `fk_Notion_NotionType1`
    FOREIGN KEY (`NotionType_ID`)
    REFERENCES `GiddyGoat`.`NotionType` (`Notion_type_ID`)
	)
;

-- PurchaseDetail table
CREATE TABLE IF NOT EXISTS `GiddyGoat`.`PurchaseDetail` (
  `PurchaseDetail_ID` INT NOT NULL,
  `Purchase_ID` INT NOT NULL,
  `Quantity` INT NOT NULL DEFAULT '1',
  `Cost` DOUBLE NOT NULL,
  `Fabric_ID` INT NOT NULL,
  `Notion_Id` INT NOT NULL,
  `Class_ID` INT NOT NULL,
  PRIMARY KEY (`PurchaseDetail_ID`, `Purchase_ID`),
  CONSTRAINT `fk_PurchaseDetail_Purchase1`
    FOREIGN KEY (`Purchase_ID`)
    REFERENCES `GiddyGoat`.`Purchase` (`Purchase_ID`),
  CONSTRAINT `fk_PurchaseDetail_Fabric1`
    FOREIGN KEY (`Fabric_ID`)
    REFERENCES `GiddyGoat`.`Fabric` (`Fabric_ID`),
  CONSTRAINT `fk_PurchaseDetail_Notion1`
    FOREIGN KEY (`Notion_Id`)
    REFERENCES `GiddyGoat`.`Notion` (`Notion_ID`),
  CONSTRAINT `fk_PurchaseDetail_Class1`
    FOREIGN KEY (`Class_ID`)
    REFERENCES `GiddyGoat`.`Class` (`Class_ID`)
	)
;

-- ShoppingCart table
CREATE TABLE IF NOT EXISTS `GiddyGoat`.`ShoppingCart` (
  `DateOfPurchase` DATETIME NULL,
  `ShoppingCart_ID` INT NOT NULL,
  `SessionID` INT NOT NULL,
  PRIMARY KEY (`ShoppingCart_ID`))
;

-- ShoppingCartItem table
CREATE TABLE IF NOT EXISTS `GiddyGoat`.`ShoppingCartItem` (
  `ShoppingCartItem_ID` INT NOT NULL,
  `Quantity` VARCHAR(45) NOT NULL,
  `Cost` VARCHAR(45) NOT NULL,
  `Product_ID` INT NOT NULL,
  `ShoppingCart_Id` INT NOT NULL,
  PRIMARY KEY (`ShoppingCartItem_ID`, `ShoppingCart_Id`),
  CONSTRAINT `fk_ShoppingCartItem_ShoppingCart1`
    FOREIGN KEY (`ShoppingCart_Id`)
    REFERENCES `GiddyGoat`.`ShoppingCart` (`ShoppingCart_ID`)
	)
;


