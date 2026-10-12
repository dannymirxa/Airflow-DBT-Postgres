SELECT
    customer_id,
    username,
    email,
    (profile->>'age')::INT AS age,
    (profile->>'country')::VARCHAR AS country,
    profile->'preferences' AS preferences,
    profile->'tags' AS tags
FROM {{ source('public', 'customers') }}