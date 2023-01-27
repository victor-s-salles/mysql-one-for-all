SELECT
    nome as nome_musica,
    CASE
        WHEN nome LIKE '%bard%' THEN
        REPLACE (nome, 'Bard', 'QA')
            WHEN nome LIKE '%Amar%' THEN
        REPLACE (nome, 'Amar', 'Code Review')
            WHEN nome LIKE '%Pais%' THEN
        REPLACE (nome, 'Pais', 'Pull Requests')
            WHEN nome LIKE '%SOUL%' THEN
        REPLACE (nome, 'SOUL', 'CODE')
            WHEN nome LIKE '%SUPERSTAR%' THEN
        REPLACE (nome, 'SUPERSTAR', 'SUPERDEV')
            ELSE nome
    END AS novo_nome
FROM SpotifyClone.cancao
WHERE
    nome LIKE '%Bard%'
    OR nome LIKE '%Amar%'
    OR nome LIKE '%Pais%'
    OR nome LIKE '%SOUL%'
    OR nome LIKE '%SUPERSTAR%'
ORDER BY nome DESC