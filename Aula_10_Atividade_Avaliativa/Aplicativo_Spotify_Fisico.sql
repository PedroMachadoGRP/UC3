/* Aplicativo_Spotify_Logico: */

CREATE TABLE Usuario (
    ID_Usuario Number(10) PRIMARY KEY,
    Nome_Usuario char(80),
    Data_Criacao_Usuario Number(8),
    Email_Usuario char(80),
    fk_Assinatura_ID_Assinatura Number(10)
);

CREATE TABLE Conteudo (
    ID_Conteudo Number(10) PRIMARY KEY,
    Nome_Conteudo char(80),
    Data_Criacao_Conteudo Number(8),
    Classificacao_Indicativa char(5),
    fk_Artista_ID_Artista Number(10)
);

CREATE TABLE Artista (
    ID_Artista Number(10) PRIMARY KEY,
    Nome_Artista char(80),
    Data_Nasc_Artista Number(8),
    Tipo_Artista char(40)
);

CREATE TABLE Assinatura (
    ID_Assinatura Number(10) PRIMARY KEY,
    Tipo_Assiantura char(40),
    Preco_Assinatura Number(8)
);

CREATE TABLE Episodio (
    ID_Episodio Number(10) PRIMARY KEY,
    Titulo_Episodio char(80),
    Duracao_Episodio Number(7),
    fk_Podcast_fk_Conteudo_ID_Conteudo Number(10)
);

CREATE TABLE Playlist_Cria (
    ID_Playlist Number(10) PRIMARY KEY,
    Nome_Playlist char(80),
    Tipo_Playlist char(40),
    Data_Criacao_Playlist Number(8),
    fk_Usuario_ID_Usuario Number(10),
    fk_Conteudo_ID_Conteudo Number(10)
);

CREATE TABLE Musica (
    Tipo_Musica char(40),
    fk_Conteudo_ID_Conteudo Number(10) PRIMARY KEY,
    fk_Gravadora_ID_Gravadora Number(10)
);

CREATE TABLE Podcast (
    Duracao_Podcast Number(7),
    fk_Conteudo_ID_Conteudo Number(10) PRIMARY KEY
);

CREATE TABLE Gravadora (
    ID_Gravadora Number(10) PRIMARY KEY,
    Nome_Gravadora char(80),
    Localizacao char(80),
    Data_Criacao_Gravadora Number(8)
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Assinatura_ID_Assinatura)
    REFERENCES Assinatura (ID_Assinatura)
    ON DELETE RESTRICT;
 
ALTER TABLE Conteudo ADD CONSTRAINT FK_Conteudo_2
    FOREIGN KEY (fk_Artista_ID_Artista)
    REFERENCES Artista (ID_Artista)
    ON DELETE RESTRICT;
 
ALTER TABLE Episodio ADD CONSTRAINT FK_Episodio_2
    FOREIGN KEY (fk_Podcast_fk_Conteudo_ID_Conteudo)
    REFERENCES Podcast (fk_Conteudo_ID_Conteudo)
    ON DELETE RESTRICT;
 
ALTER TABLE Playlist_Cria ADD CONSTRAINT FK_Playlist_Cria_2
    FOREIGN KEY (fk_Usuario_ID_Usuario)
    REFERENCES Usuario (ID_Usuario);
 
ALTER TABLE Playlist_Cria ADD CONSTRAINT FK_Playlist_Cria_3
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo);
 
ALTER TABLE Musica ADD CONSTRAINT FK_Musica_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;
 
ALTER TABLE Musica ADD CONSTRAINT FK_Musica_3
    FOREIGN KEY (fk_Gravadora_ID_Gravadora)
    REFERENCES Gravadora (ID_Gravadora)
    ON DELETE RESTRICT;
 
ALTER TABLE Podcast ADD CONSTRAINT FK_Podcast_2
    FOREIGN KEY (fk_Conteudo_ID_Conteudo)
    REFERENCES Conteudo (ID_Conteudo)
    ON DELETE CASCADE;