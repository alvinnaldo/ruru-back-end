BEGIN;

ALTER TABLE user_oauths DROP CONSTRAINT chk_provider_name;
ALTER TABLE user_oauths ADD CONSTRAINT chk_provider_name CHECK (provider_name IN ('GOOGLE'));

COMMIT;