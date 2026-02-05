SELECT *
FROM demonstrativos;


SELECT
    denom_cia,
    dt_refer,
    vl_conta AS ativo_total
FROM demonstrativos
WHERE ds_conta = 'Ativo Total'
ORDER BY vl_conta DESC;

SELECT
    denom_cia,
    dt_refer,
    vl_conta AS caixa
FROM demonstrativos
WHERE ds_conta = 'Caixa e Equivalentes de Caixa'
ORDER BY vl_conta DESC;


SELECT
    denom_cia,
    MAX(CASE WHEN dt_refer = '2025-03-31' THEN vl_conta END) AS valor_atual,
    MAX(CASE WHEN dt_refer = '2024-03-31' THEN vl_conta END) AS valor_anterior,
    (
        MAX(CASE WHEN dt_refer = '2025-03-31' THEN vl_conta END) -
        MAX(CASE WHEN dt_refer = '2024-03-31' THEN vl_conta END)
    ) AS variacao_valor
FROM demonstrativos
WHERE ds_conta = 'Ativo Total'
GROUP BY denom_cia;


SELECT
    a.denom_cia,
    a.dt_refer,
    ROUND(c.vl_conta / a.vl_conta, 2) AS indice_caixa_ativo
FROM demonstrativos a
JOIN demonstrativos c
    ON a.cnpj_cia = c.cnpj_cia
   AND a.dt_refer = c.dt_refer
WHERE a.ds_conta = 'Ativo Total'
  AND c.ds_conta = 'Caixa e Equivalentes de Caixa';



SELECT
    denom_cia,
    dt_refer,
    vl_conta AS caixa
FROM demonstrativos
WHERE ds_conta = 'Caixa e Equivalentes de Caixa'
ORDER BY vl_conta DESC
LIMIT 10;

