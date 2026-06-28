CREATE TABLE chats (
    chat_id SERIAL PRIMARY KEY,
    workspace_id INT NOT NULL,
    chat_room_id INT NOT NULL,
    sender_id INT NOT NULL,
    role_id INT NOT NULL,
    message TEXT NOT NULL,
    chat_status VARCHAR(50) NOT NULL DEFAULT 'PENDING' CONSTRAINT chk_chat_status
                CHECK ( chat_status IN ('PENDING','SENT','DELIVERED','READ') ),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE chats
ADD CONSTRAINT fk_chats_workspaces
    FOREIGN KEY (workspace_id) REFERENCES workspaces(workspace_id) ON DELETE CASCADE,
ADD CONSTRAINT fk_chats_chat_rooms
    FOREIGN KEY (chat_room_id) REFERENCES chat_rooms(chat_room_id) ON DELETE CASCADE,
ADD CONSTRAINT fk_chats_users_sender
    FOREIGN KEY (sender_id) REFERENCES users(user_id) ON DELETE SET DEFAULT,
ADD CONSTRAINT fk_chats_roles
    FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE SET DEFAULT