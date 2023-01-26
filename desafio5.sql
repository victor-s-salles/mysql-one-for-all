SELECT
    can.nome AS cancao,
    COUNT(*) AS reproducoes
FROM SpotifyClone.cancao AS can
    INNER JOIN SpotifyClone.historico AS his ON can.cancao_id = his.cancao_id
GROUP BY his.cancao_id
ORDER BY
    reproducoes DESC,
    can.nome
LIMIT 2;