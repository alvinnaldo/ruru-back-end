CREATE TABLE chat_rooms (
    chat_room_id SERIAL PRIMARY KEY,
    chat_room_name VARCHAR(50) NOT NULL,
    workspace_id INT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE chat_rooms
ADD CONSTRAINT fk_chat_rooms_workspaces
    FOREIGN KEY (workspace_id) REFERENCES workspaces(workspace_id) ON DELETE CASCADE