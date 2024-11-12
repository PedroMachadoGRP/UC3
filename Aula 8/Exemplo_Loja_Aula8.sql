/* Exemplo_Loja_Aula8: */

CREATE TABLE Order (
    ID_Order Number(10) PRIMARY KEY,
    Canceled Boolean,
    Ready_Pickup Boolean,
    Delivered Boolean,
    Dispatched Boolean,
    Placed Boolean,
    Payment_Method String(5),
    Order_Date Number(8),
    fk_Client_ID_Client Number(10)
);

CREATE TABLE Product (
    ID_Product Number(10) PRIMARY KEY,
    Product_Name String(80),
    Price Number(5),
    fk_Stock_ID_Stock Number(10),
    fk_Category_ID_Category Number(10)
);

CREATE TABLE Place_Have (
    Quantity Number(5),
    fk_Order_ID_Order Number(10),
    fk_Product_ID_Product Number(10)
);

CREATE TABLE Client (
    ID_Client Number(10) PRIMARY KEY,
    Client_Name String(80),
    Email String(80),
    Delivered_Address Number(20)
);

CREATE TABLE Regular (
    Register_Date Number(8),
    Loyalty_Discount Number(2),
    fk_Client_ID_Client Number(10) PRIMARY KEY
);

CREATE TABLE Coorp (
    CNPJ String(12),
    Credit_Limit Number(5),
    Company_Name String(80),
    fk_Client_ID_Client Number(10) PRIMARY KEY
);

CREATE TABLE Vip (
    Register_Date Number(8),
    Vip_Level Number(5),
    fk_Client_ID_Client Number(10) PRIMARY KEY
);

CREATE TABLE Provider (
    ID_Provider Number(10) PRIMARY KEY,
    Provider_name String(80),
    Contact Number(12)
);

CREATE TABLE Stock (
    ID_Stock Number(10) PRIMARY KEY,
    Available_Quantity Number(5)
);

CREATE TABLE Category (
    ID_Category Number(10) PRIMARY KEY,
    Category_Name String(80)
);

CREATE TABLE Supply (
    fk_Product_ID_Product Number(10),
    fk_Provider_ID_Provider Number(10)
);
 
ALTER TABLE Order ADD CONSTRAINT FK_Order_2
    FOREIGN KEY (fk_Client_ID_Client)
    REFERENCES Client (ID_Client)
    ON DELETE RESTRICT;
 
ALTER TABLE Product ADD CONSTRAINT FK_Product_2
    FOREIGN KEY (fk_Stock_ID_Stock)
    REFERENCES Stock (ID_Stock)
    ON DELETE RESTRICT;
 
ALTER TABLE Product ADD CONSTRAINT FK_Product_3
    FOREIGN KEY (fk_Category_ID_Category)
    REFERENCES Category (ID_Category)
    ON DELETE RESTRICT;
 
ALTER TABLE Place_Have ADD CONSTRAINT FK_Place_Have_1
    FOREIGN KEY (fk_Order_ID_Order)
    REFERENCES Order (ID_Order);
 
ALTER TABLE Place_Have ADD CONSTRAINT FK_Place_Have_2
    FOREIGN KEY (fk_Product_ID_Product)
    REFERENCES Product (ID_Product);
 
ALTER TABLE Regular ADD CONSTRAINT FK_Regular_2
    FOREIGN KEY (fk_Client_ID_Client)
    REFERENCES Client (ID_Client)
    ON DELETE CASCADE;
 
ALTER TABLE Coorp ADD CONSTRAINT FK_Coorp_2
    FOREIGN KEY (fk_Client_ID_Client)
    REFERENCES Client (ID_Client)
    ON DELETE CASCADE;
 
ALTER TABLE Vip ADD CONSTRAINT FK_Vip_2
    FOREIGN KEY (fk_Client_ID_Client)
    REFERENCES Client (ID_Client)
    ON DELETE CASCADE;
 
ALTER TABLE Supply ADD CONSTRAINT FK_Supply_1
    FOREIGN KEY (fk_Product_ID_Product)
    REFERENCES Product (ID_Product)
    ON DELETE RESTRICT;
 
ALTER TABLE Supply ADD CONSTRAINT FK_Supply_2
    FOREIGN KEY (fk_Provider_ID_Provider)
    REFERENCES Provider (ID_Provider)
    ON DELETE RESTRICT;