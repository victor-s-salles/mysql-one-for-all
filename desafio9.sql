SELECT
    COUNT(*) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.usuario AS user
    INNER JOIN SpotifyClone.historico AS his ON user.usuario_id = his.usuario_id
WHERE
    user.nome = 'Barbara Liskov';