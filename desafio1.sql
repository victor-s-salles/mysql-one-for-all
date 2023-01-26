DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE
    SpotifyClone.plano(
        plano_id INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(30) NOT NULL,
        valor DECIMAL(5, 2)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.artista(
        artista_id INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(200) NOT NULL
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.album(
        album_id INT PRIMARY KEY AUTO_INCREMENT,
        artista_id INT NOT NULL,
        ano_lancamento YEAR(4),
        FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.cancao(
        cancao_id INT PRIMARY KEY AUTO_INCREMENT,
        album_id INT NOT NULL,
        duracao INT NOT NULL,
        FOREIGN KEY (album_id) REFERENCES album (album_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.usuario(
        usuario_id INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(200) NOT NULL,
        idade INT NOT NULL,
        plano_id INT NOT NULL,
        FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.historico(
        usuario_id INT NOT NULL,
        cancao_id INT NOT NULL,
        CONSTRAINT PRIMARY KEY (usuario_id, cancao_id),
        FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
        FOREIGN KEY (cancao_id) REFERENCES cancao (cancao_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.seguindo(
        usuario_id INT NOT NULL,
        artista_id INT NOT NULL,
        CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
        FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
        FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
    ) engine = InnoDB;