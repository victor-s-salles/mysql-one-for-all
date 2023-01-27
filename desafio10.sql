SELECT
    can.nome AS nome,
    COUNT(*) AS reproducoes
FROM
    SpotifyClone.usuario AS user
    INNER JOIN SpotifyClone.plano AS plan ON user.plano_id = plan.plano_id
    INNER JOIN SpotifyClone.historico AS his ON user.usuario_id = his.usuario_id
    INNER JOIN SpotifyClone.cancao AS can ON his.cancao_id = can.cancao_id
WHERE
    plan.nome = 'gratuito'
    OR plan.nome = 'pessoal'
GROUP BY nome
ORDER BY nome;