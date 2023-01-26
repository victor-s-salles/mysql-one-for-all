SELECT
    user.nome AS usuario,
    IF ( (
            YEAR(MAX(his.data_reproducao)) >= 2021
        ),
        'Usuário ativo',
        'Usuário inativo'
    ) AS status_usuario
FROM
    SpotifyClone.usuario AS user
    INNER JOIN SpotifyClone.historico AS his ON user.usuario_id = his.usuario_id
GROUP BY user.nome
ORDER BY user.nome;