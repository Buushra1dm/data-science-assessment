-- ADD YOUR SQL QUERY HERE

SELECT
    inv.investor_id,
    s.sector_name,
    ROUND(
        (inv.no_of_shares * 100.0) / SUM(inv.no_of_shares) OVER (PARTITION BY inv.investor_id),
        2
    ) AS share_percentage
FROM investor_transactions inv
JOIN sectors s
    ON inv.sector_id = s.sector_id
ORDER BY
    inv.investor_id,
    share_percentage DESC;
