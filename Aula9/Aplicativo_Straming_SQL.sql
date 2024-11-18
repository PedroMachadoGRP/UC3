/* Aplicativo_Straming_Logico: */

CREATE TABLE Usuario (
    ID_Usuario Number(10) PRIMARY KEY,
    Data_Criacao Number(8),
    Faixa_etaria Number(2),
    Nome_Usuario String(80)
);

CREATE TABLE Genero (
    ID_Genero Number(10) PRIMARY KEY,
    Publico_Alvo String(50),
    Nome_Genero String(80)
);

CREATE TABLE Episodio (
    ID_Episodio Number(10) PRIMARY KEY,
    Titulo_Episodio String(50),
    Temporada_Episodio Number(5),
    Duracao_Episodio Number(5),
    fk_Serie_fk_Conteudo_ID_Conteudo Number(10)
);

CREATE TABLE Franquia (
    ID_Franquia Number(10) PRIMARY KEY,
    Nome_Franquia String(80),
    Distribuidora String(80),
    Data_Criacao Number(8)
);

CREATE TABLE Avaliacao_Assiste (
    Data_Avalicao Number(8),
    Nota_Avaliacao Number(3),
    Resenha String(200),
    fk_Usuario_ID_Usuario Number(10),
    fk_Conteudo_ID_Conteudo Number(10)
);

CREATE TABLE Lista_Desejos_assistira (
    Programas_Desejados String(80),
    Data_Criacao_Lista Number(8),
    Quantidade_Programas_Desejados Number(5),
    fk_Conteudo_ID_Conteudo Number(10),
    fk_Usuario_ID_Usuario Number(10)
);

CREATE TABLE Conteudo (
    ID_Conteudo Number(10) PRIMARY KEY,
    Nome_Conteudo String(80),
    Classificacao_Indicativa Number(3),
    Data_Lancamento Number(8),
    fk_Franquia_ID_Franquia Number(10),
    fk_Genero_ID_Genero Number(10)
);

CREATE TABLE Filme (
    Duracao Number(5),
    fk_Conteudo_ID_Conteudo Number(10) PRIMARY KEY
);

CREATE TABLE Serie (
    Temporadas Number(3),
    fk_Conteudo_ID_Conteudo Number(10) PRIMARY KEY
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