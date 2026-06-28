CREATE TABLE workspace_invitations (
    invitation_id SERIAL PRIMARY KEY,
    workspace_id INT NOT NULL,
    email_to VARCHAR(255) NOT NULL,
    granted_role_id INT NOT NULL,
    invite_token UUID NOT NULL UNIQUE DEFAULT gen_random_uuid(),
    status VARCHAR(50) NOT NULL DEFAULT 'PENDING' CONSTRAINT chk_invitation_status
        CHECK ( status IN ('PENDING', 'ACCEPTED', 'DECLINED')),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (CURRENT_TIMESTAMP + INTERVAL '7 days')
);

ALTER TABLE workspace_invitations
ADD CONSTRAINT fk_workspace_invitations_workspaces
    FOREIGN KEY (workspace_id) REFERENCES workspaces(workspace_id) ON DELETE CASCADE,
ADD CONSTRAINT fk_workspace_invitations_roles
    FOREIGN KEY (granted_role_id) REFERENCES roles(role_id) ON DELETE CASCADE
