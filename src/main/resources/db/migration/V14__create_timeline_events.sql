CREATE TABLE timeline_events (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    workspace_id INT NOT NULL,
    event_type VARCHAR(50) NOT NULL,
    event_payload TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE timeline_events
ADD CONSTRAINT fk_timeline_events_users
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET DEFAULT,
ADD CONSTRAINT fk_timeline_events_roles
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE SET DEFAULT,
ADD CONSTRAINT fk_timeline_events_workspaces
    FOREIGN KEY (workspace_id) REFERENCES workspaces(workspace_id) ON DELETE SET DEFAULT;

CREATE INDEX idx_timeline_events_workspaces ON timeline_events(workspace_id);