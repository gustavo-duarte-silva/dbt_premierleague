SELECT 
    AWAY AS TEAM,
    SUM(RESULTADO) AS RESULTADO
FROM (
    SELECT 
        AWAY,
        SUM(CASE 
            WHEN AWAY_SCORE > HOME_SCORE THEN 3
            WHEN AWAY_SCORE = HOME_SCORE THEN 1
            ELSE 0 
        END) AS RESULTADO
    FROM {{ ref("stg_fixtures") }}
    GROUP BY AWAY
    
    UNION ALL
    
    SELECT 
        HOME,
        SUM(CASE 
            WHEN HOME_SCORE > AWAY_SCORE THEN 3
            WHEN HOME_SCORE = AWAY_SCORE THEN 1
            ELSE 0 
        END) AS RESULTADO
    FROM {{ ref("stg_fixtures") }}
    GROUP BY HOME)
    
GROUP BY TEAM
ORDER BY RESULTADO DESC