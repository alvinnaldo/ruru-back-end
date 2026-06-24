CREATE TABLE user_oauths (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    provider_name VARCHAR(50) NOT NULL CONSTRAINT chk_provider_name CHECK ( provider_name IN ('Google') ),
    provider_user_id VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ENSURE ONE OAUTH PROVIDER = ONE PROVIDER USER ID
ALTER TABLE user_oauths
ADD CONSTRAINT unique_oauth_provider UNIQUE (provider_name, provider_user_id)