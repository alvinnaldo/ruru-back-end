CREATE TABLE workspace_members(
    id SERIAL PRIMARY KEY,
    workspace_id INT NOT NULL,
    user_id INT NOT NULL,
    role_id INT NOT NULL
);

ALTER TABLE workspace_members
    ADD CONSTRAINT unique_workspace_member UNIQUE (workspace_id, user_id, role_id),
    ADD CONSTRAINT fk_workspaces_members_workspaces
        FOREIGN KEY (workspace_id) REFERENCES workspaces(workspace_id) ON DELETE CASCADE,
    ADD CONSTRAINT fk_workspaces_members_users
        FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    ADD CONSTRAINT fk_workspaces_members_roles
        FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE