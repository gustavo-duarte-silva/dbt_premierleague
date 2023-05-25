WITH teams as (

    SELECT DISTINCT HOME, HOME_SHORT, COUNTRY_CODE  FROM {{ ref('stg_fixtures') }}

)

SELECT * FROM teams