-- Ensure only Spring Jpa side that generate uuid
-- Minor fix (workspace leader id should allow null)

ALTER TABLE workspace_invitations
    ALTER COLUMN invite_token DROP DEFAULT;

ALTER TABLE invitation_links
    ALTER COLUMN link_token DROP DEFAULT;

ALTER TABLE workspaces
    ALTER COLUMN leader_id DROP NOT NULL;
