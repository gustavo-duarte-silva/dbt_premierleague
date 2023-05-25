SELECT *
FROM {{ source('soccer_results', 'fixtures') }}