SELECT
    MIN(plan.valor) AS faturamento_minimo,
    MAX(plan.valor) AS faturamento_maximo,
    ROUND(AVG(plan.valor), 2) AS faturamento_medio,
    ROUND(SUM(plan.valor), 2) AS faturamento_total
FROM
    SpotifyClone.usuario AS user
    INNER JOIN SpotifyClone.plano AS plan ON user.plano_id = plan.plano_id