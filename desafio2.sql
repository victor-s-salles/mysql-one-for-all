SELECT
    COUNT(DISTINCT can.cancao_id) AS cancoes,
    COUNT(DISTINCT art.artista_id) AS artistas,
    COUNT(DISTINCT alb.album_id) AS albuns
FROM
    SpotifyClone.cancao AS can
    INNER JOIN SpotifyClone.artista AS art
    INNER JOIN SpotifyClone.album AS alb;