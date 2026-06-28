CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY,
    workspace_id INT NOT NULL,
    task_name VARCHAR(255) NOT NULL,
    task_description TEXT,
    task_creator_id INT,
    task_assignee_id INT,
    task_status VARCHAR(50) NOT NULL CONSTRAINT chk_task_status
                CHECK ( task_status IN ('TO_DO', 'IN_PROGRESS', 'IN_REVIEW', 'DONE') ),
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE tasks
ADD CONSTRAINT fk_tasks_workspaces
    FOREIGN KEY (workspace_id) REFERENCES workspaces(workspace_id) ON DELETE CASCADE,
ADD CONSTRAINT fk_tasks_users_creator
    FOREIGN KEY (task_creator_id) REFERENCES users(user_id) ON DELETE SET NULL,
ADD CONSTRAINT fk_tasks_users_assignee
    FOREIGN KEY (task_assignee_id) REFERENCES users(user_id) ON DELETE SET NULL