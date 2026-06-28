CREATE TABLE invitation_links (
    invitation_link_id SERIAL PRIMARY KEY,
    workspace_id INT NOT NULL,
    granted_role_id INT NOT NULL,
    link_token UUID NOT NULL UNIQUE DEFAULT gen_random_uuid(),
    link_status VARCHAR(50) NOT NULL DEFAULT 'VALID' CONSTRAINT chk_invitation_link_status
        CHECK ( link_status IN ('VALID', 'REVOKED')),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (CURRENT_TIMESTAMP + INTERVAL '7 days')
);

ALTER TABLE invitation_links
    ADD CONSTRAINT fk_invitation_links_workspaces
        FOREIGN KEY (workspace_id) REFERENCES workspaces(workspace_id) ON DELETE CASCADE,
    ADD CONSTRAINT fk_invitation_links_roles
        FOREIGN KEY (granted_role_id) REFERENCES roles(role_id) ON DELETE CASCADE