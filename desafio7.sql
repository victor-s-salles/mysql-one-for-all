SELECT
    art.nome AS artista,
    al.nome AS album,
    COUNT(*) AS seguidores
FROM
    SpotifyClone.artista AS art
    INNER JOIN SpotifyClone.album AS al ON art.artista_id = al.artista_id
    INNER JOIN SpotifyClone.seguindo AS seg ON art.artista_id = seg.artista_id
GROUP BY album, artista
ORDER BY
    seguidores DESC,
    artista,
    album