SELECT
    user.nome AS usuario,
    COUNT(*) AS qt_de_musicas_ouvidas,
    ROUND(SUM(can.duracao) / 60, 2) AS total_minutos
FROM
    SpotifyClone.usuario AS user
    INNER JOIN SpotifyClone.historico AS his ON user.usuario_id = his.usuario_id
    INNER JOIN SpotifyClone.cancao AS can ON his.cancao_id = can.cancao_id
GROUP BY user.nome
ORDER BY user.nome;