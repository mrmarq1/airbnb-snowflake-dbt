SELECT
  *
FROM {{ ref('dim_listings_cleaned') }}
WHERE created_at > updated_at
LIMIT 10