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
        nome VARCHAR(200) NOT NULL,
        artista_id INT NOT NULL,
        ano_lancamento YEAR(4),
        FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.cancao(
        cancao_id INT PRIMARY KEY AUTO_INCREMENT,
        nome VARCHAR(200) NOT NULL,
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
        data_assinatura DATE,
        FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
    ) engine = InnoDB;

CREATE TABLE
    SpotifyClone.historico(
        usuario_id INT NOT NULL,
        cancao_id INT NOT NULL,
        data_reproducao DATE,
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

INSERT INTO
    SpotifyClone.plano (nome, valor)
VALUES ('gratuito', '0.00'), ('universitário', '5.99'), ('pessoal', '6.99'), ('familiar', '7.99');

INSERT INTO
    SpotifyClone.artista (nome)
VALUES ('Beyoncé'), ('Queen'), ('Elis Regina'), ('Baco Exu do Blues'), ('Blind Guardian'), ('Nina Simone');

INSERT INTO
    SpotifyClone.album (
        nome,
        artista_id,
        ano_lancamento
    )
VALUES ('Renaissance', 1, 2022), ('Jazz', 2, 1978), ('Hot Space', 2, 1982), ('Falso Brilhante', 3, 1998), ('Vento de Maio', 3, 2001), ('QVVJFA?', 4, 2003), (
        'Somewhere Far Beyond',
        5,
        2007
    ), (
        'I Put A Spell On You',
        6,
        2012
    );

INSERT INTO
    SpotifyClone.cancao (nome, album_id, duracao)
VALUES ('BREAK MY SOUL', 1, 279), ('VIRGO’S GROOVE', 1, 369), ('ALIEN SUPERSTAR', 1, 116), ('Don’t Stop Me Now', 2, 203), ('Under Pressure', 3, 152), ('Como Nossos Pais', 4, 105), (
        'O Medo de Amar é o Medo de Ser Livre',
        5,
        207
    ), ('Samba em Paris', 6, 267), ('The Bard’s Song', 7, 244), ('Feeling Good', 8, 100);

INSERT INTO
    SpotifyClone.usuario (
        nome,
        idade,
        plano_id,
        data_assinatura
    )
VALUES (
        'Barbara Liskov',
        82,
        1,
        '2019-10-20'
    ), (
        'Robert Cecil Martin',
        58,
        1,
        '2017-01-06'
    ), (
        'Ada Lovelace',
        37,
        4,
        '2017-12-30'
    ), (
        'Martin Fowler',
        46,
        4,
        '2017-01-17'
    ), (
        'Sandi Metz',
        58,
        4,
        '2018-04-29'
    ), (
        'Paulo Freire',
        19,
        2,
        '2018-02-14'
    ), (
        'Bell Hooks',
        26,
        2,
        '2018-01-05'
    ), (
        'Christopher Alexander',
        85,
        3,
        '2019-06-05'
    ), (
        'Judith Butler',
        45,
        3,
        '2020-05-13'
    ), (
        'Jorge Amado',
        58,
        3,
        '2017-02-17'
    );