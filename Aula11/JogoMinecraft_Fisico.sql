/* JogoMinecraft_Logico: */

CREATE TABLE Jogo (
    ID_jogo int PRIMARY KEY,
    nome_jogo varchar(80),
    categoria varchar(40),
    data_de_lancamento int
);

CREATE TABLE Usuario (
    Id_usuario int PRIMARY KEY,
    Usuario_Nome varchar(80),
    coracoes int,
    fome int,
    fk_Inventario_ID_inventario numeric(10)
);

CREATE TABLE Inventario (
    ID_inventario numeric(10) PRIMARY KEY,
    Quantidade int
);

CREATE TABLE Item (
    Id_Item int PRIMARY KEY,
    item_nome varchar(80),
    fk_Inventario_ID_inventario numeric(10)
);

CREATE TABLE Biomas (
    ID_biomas numeric(10) PRIMARY KEY,
    Nome_bioma varchar(80),
    localizacao varchar(40),
    fk_Mundo_ID_mundo int,
    fk_Mundo_ID_mob int,
    fk_Mundo_ID_mob_inteligente int
);

CREATE TABLE Mundo (
    ID_mundo int,
    Tipo_mundo varchar(40),
    Modo_Jogo varchar(40),
    ID_mob int,
    Nome_mob varchar(80),
    vida_mob int,
    Agressividade varchar(40),
    tipo_mob varchar(40),
    Mob_dano int,
    ID_mob_inteligente int,
    mob_inteligente_nome varchar(80),
    Vida_mob_inteligente int,
    Tipo_mob_inteligente varchar(40),
    Mundo_TIPO varchar(40),
    PRIMARY KEY (ID_mundo, ID_mob, ID_mob_inteligente)
);

CREATE TABLE Dimensoes (
    ID_dimensao int PRIMARY KEY,
    Nome_dimensao varchar(80),
    localizacao varchar(80),
    fk_Mundo_ID_mundo int,
    fk_Mundo_ID_mob int,
    fk_Mundo_ID_mob_inteligente int
);

CREATE TABLE Boss (
    ID_boss numeric(10) PRIMARY KEY,
    Nome_boss varchar(80),
    Vida_boss int,
    Boss_dano int,
    fk_Dimensoes_ID_dimensao int
);

CREATE TABLE Inventario_mob (
    ID_inventario_mob numeric(10) PRIMARY KEY,
    quantidade int,
    fk_Mundo_ID_mundo int,
    fk_Mundo_ID_mob int,
    fk_Mundo_ID_mob_inteligente int
);

CREATE TABLE tem (
    fk_Jogo_ID_jogo int,
    fk_Usuario_Id_usuario int
);

CREATE TABLE contem (
    fk_Usuario_Id_usuario int,
    fk_Mundo_ID_mundo int,
    fk_Mundo_ID_mob int,
    fk_Mundo_ID_mob_inteligente int
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Inventario_ID_inventario)
    REFERENCES Inventario (ID_inventario)
    ON DELETE RESTRICT;
 
ALTER TABLE Item ADD CONSTRAINT FK_Item_2
    FOREIGN KEY (fk_Inventario_ID_inventario)
    REFERENCES Inventario (ID_inventario)
    ON DELETE RESTRICT;
 
ALTER TABLE Biomas ADD CONSTRAINT FK_Biomas_2
    FOREIGN KEY (fk_Mundo_ID_mundo, fk_Mundo_ID_mob, fk_Mundo_ID_mob_inteligente)
    REFERENCES Mundo (ID_mundo, ID_mob, ID_mob_inteligente)
    ON DELETE RESTRICT;
 
ALTER TABLE Dimensoes ADD CONSTRAINT FK_Dimensoes_2
    FOREIGN KEY (fk_Mundo_ID_mundo, fk_Mundo_ID_mob, fk_Mundo_ID_mob_inteligente)
    REFERENCES Mundo (ID_mundo, ID_mob, ID_mob_inteligente)
    ON DELETE RESTRICT;
 
ALTER TABLE Boss ADD CONSTRAINT FK_Boss_2
    FOREIGN KEY (fk_Dimensoes_ID_dimensao)
    REFERENCES Dimensoes (ID_dimensao)
    ON DELETE RESTRICT;
 
ALTER TABLE Inventario_mob ADD CONSTRAINT FK_Inventario_mob_2
    FOREIGN KEY (fk_Mundo_ID_mundo, fk_Mundo_ID_mob, fk_Mundo_ID_mob_inteligente)
    REFERENCES Mundo (ID_mundo, ID_mob, ID_mob_inteligente)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_Jogo_ID_jogo)
    REFERENCES Jogo (ID_jogo)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_Usuario_Id_usuario)
    REFERENCES Usuario (Id_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE contem ADD CONSTRAINT FK_contem_1
    FOREIGN KEY (fk_Usuario_Id_usuario)
    REFERENCES Usuario (Id_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE contem ADD CONSTRAINT FK_contem_2
    FOREIGN KEY (fk_Mundo_ID_mundo, fk_Mundo_ID_mob, fk_Mundo_ID_mob_inteligente)
    REFERENCES Mundo (ID_mundo, ID_mob, ID_mob_inteligente)
    ON DELETE RESTRICT;