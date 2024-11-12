/* MOBA_Aula_7: */

CREATE TABLE Team (
    ID_Team Number(10) PRIMARY KEY,
    Name_Team String(80)
);

CREATE TABLE Player (
    ID_Player Number(10) PRIMARY KEY,
    Level Number(2),
    Score Number(3),
    Region String(10),
    User_Name String(80)
);

CREATE TABLE Player_Match (
    Player_Points Number(3),
    Team_Points Number(3),
    FK_Player Number(10),
    FK_Match Number(10)
);

CREATE TABLE Match (
    ID_Match Number(10) PRIMARY KEY,
    Date_Time Number(8),
    Duration Number(4),
    Results String(10)
);

CREATE TABLE Item (
    ID_Item Number(10) PRIMARY KEY,
    Cost Number(6),
    Description String(80),
    Effect String(10),
    Item_Name String(80)
);

CREATE TABLE Offensive_Item (
    Physic_Damage Number(10),
    Magic_Damage Number(10),
    FK_Item_Offensive Number(10)
);

CREATE TABLE Defensive_Item (
    Armor Number(10),
    Res_Magic Number(10),
    FK_Item_Defensive Number(10)
);

CREATE TABLE Consumable (
    HP Number(10),
    Damage Number(5),
    FK_Item_Consumable Number(10)
);

CREATE TABLE Champion (
    ID_Champion Number(10) PRIMARY KEY,
    Name_Champion String(80),
    Abillity String(10),
    Damage_Type String(10),
    Function String(10)
);
 
ALTER TABLE Player ADD CONSTRAINT FK_Player_2
    FOREIGN KEY (ID_Player)
    REFERENCES Team (ID_Team);
 
ALTER TABLE Player_Match ADD CONSTRAINT FK_Player_Match_1
    FOREIGN KEY (FK_Player)
    REFERENCES Player (ID_Player);
 
ALTER TABLE Player_Match ADD CONSTRAINT FK_Player_Match_2
    FOREIGN KEY (FK_Match)
    REFERENCES Match (ID_Match);
 
ALTER TABLE Offensive_Item ADD CONSTRAINT FK_Offensive_Item_1
    FOREIGN KEY (FK_Item_Offensive)
    REFERENCES Item (ID_Item);
 
ALTER TABLE Defensive_Item ADD CONSTRAINT FK_Defensive_Item_1
    FOREIGN KEY (FK_Item_Defensive)
    REFERENCES Item (ID_Item);
 
ALTER TABLE Consumable ADD CONSTRAINT FK_Consumable_1
    FOREIGN KEY (FK_Item_Consumable)
    REFERENCES Item (ID_Item);