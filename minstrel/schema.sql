-- Initialize the database.
-- Drop any existing data and create empty tables.

DROP TABLE IF EXISTS command;
DROP TABLE IF EXISTS instrument;
DROP TABLE IF EXISTS state;
DROP TABLE IF EXISTS sequence;

CREATE TABLE command (
    id INTEGER PRIMARY KEY,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT NULL,
    slug TEXT UNIQUE NOT NULL,
    title TEXT UNIQUE NOT NULL,
    scpi TEXT UNIQUE NOT NULL
);

CREATE TABLE instrument (
    id INTEGER PRIMARY KEY,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT NULL,
    slug TEXT UNIQUE NOT NULL,
    title TEXT UNIQUE NOT NULL,
    host TEXT UNIQUE NOT NULL,
    port INTEGER NOT NULL
);

CREATE TABLE state (
    id INTEGER PRIMARY KEY,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT NULL,
    slug TEXT UNIQUE NOT NULL,
    title TEXT UNIQUE NOT NULL
);

CREATE TABLE sequence (
    id INTEGER PRIMARY KEY,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT NULL,
    command_id INTEGER NOT NULL,
    instrument_id INTEGER NOT NULL,
    state_id INTEGER NOT NULL,
    FOREIGN KEY(command_id) REFERENCES command(id) ON DELETE NO ACTION ON UPDATE NO ACTION
    FOREIGN KEY(instrument_id) REFERENCES instrument(id) ON DELETE NO ACTION ON UPDATE NO ACTION
    FOREIGN KEY(state_id) REFERENCES state(id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
