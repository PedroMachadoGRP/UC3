CREATE TABLE Usuario (
    ID_Usuario numeric(10) PRIMARY KEY,
    Data_Criacao numeric(8),
    Faixa_etaria numeric(2),
    Nome_Usuario varchar(80)
);

CREATE TABLE Genero (
    ID_Genero numeric(10) PRIMARY KEY,
    Publico_Alvo varchar(50),
    Nome_Genero varchar(80)
);

CREATE TABLE Episodio (
    ID_Episodio numeric(10) PRIMARY KEY,
    Titulo_Episodio varchar(50),
    Temporada_Episodio numeric(5),
    Duracao_Episodio numeric(5),
    fk_Serie_fk_Conteudo_ID_Conteudo numeric(10)
);

CREATE TABLE Franquia (
    ID_Franquia numeric(10) PRIMARY KEY,
    Nome_Franquia varchar(80),
    Distribuidora varchar(80),
    Data_Criacao numeric(8)
);

CREATE TABLE Avaliacao_Assiste (
    Data_Avalicao numeric(8),
    Nota_Avaliacao numeric(3),
    Resenha varchar(200),
    fk_Usuario_ID_Usuario numeric(10),
    fk_Conteudo_ID_Conteudo numeric(10)
);

CREATE TABLE Lista_Desejos_assistira (
    Programas_Desejados varchar(80),
    Data_Criacao_Lista numeric(8),
    Quantidade_Programas_Desejados numeric(5),
    fk_Conteudo_ID_Conteudo numeric(10),
    fk_Usuario_ID_Usuario numeric(10)
);

CREATE TABLE Conteudo (
    ID_Conteudo numeric(10) PRIMARY KEY,
    Nome_Conteudo varchar(80),
    Classificacao_Indicativa numeric(3),
    Data_Lancamento numeric(8),
    fk_Franquia_ID_Franquia numeric(10),
    fk_Genero_ID_Genero numeric(10)
);

CREATE TABLE Filme (
    Duracao numeric(5),
    fk_Conteudo_ID_Conteudo numeric(10) PRIMARY KEY
);

CREATE TABLE Serie (
    Temporadas numeric(3),
    fk_Conteudo_ID_Conteudo numeric(10) PRIMARY KEY
);
 
ALTER TABLE Episodio ADD CONSTRAINT FK_Episodio_2
    FOREIGN KEY (fk_Serie_fk_Conteudo_ID_Conteudo)
    REFERENCES Serie (fk_Conteudo_ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Avaliacao_Assiste ADD CONSTRAINT FK_Avaliacao_Assiste_1
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Avaliacao_Assiste ADD CONSTRAINT FK_Avaliacao_Assiste_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Lista_Desejos_assistira ADD CONSTRAINT FK_Lista_Desejos_assistira_1
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Lista_Desejos_assistira ADD CONSTRAINT FK_Lista_Desejos_assistira_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Conteudo ADD CONSTRAINT FK_Conteudo_2
    FOREIGN KEY (fk_Franquia_ID_Franquia)
    REFERENCES Franquia (ID_Franquia)
    ON DELETE RESTRICT;
 
ALTER TABLE Conteudo ADD CONSTRAINT FK_Conteudo_3
    FOREIGN KEY (fk_Genero_ID_Genero)
    REFERENCES Genero (ID_Genero)
    ON DELETE RESTRICT;
 
ALTER TABLE Filme ADD CONSTRAINT FK_Filme_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Serie ADD CONSTRAINT FK_Serie_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;