CREATE TYPE CARDSTATUS AS ENUM ('todo', 'in-progress', 'done');

CREATE TABLE IF NOT EXISTS tasks (
    id UUID PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    status CARDSTATUS NOT NULL DEFAULT 'todo',
    due_data TIMESTAMPTZ NOT NULL,
    board_id UUID NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'UTC'),
    FOREIGN KEY (board_id) REFERENCES boards (id)
);