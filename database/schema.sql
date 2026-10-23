-- Initial illustrative schema for the academic prototype.
-- Review and adapt after the target approval scenario is confirmed.
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS handbook_sources (
    source_id INTEGER PRIMARY KEY AUTOINCREMENT,
    handbook_edition TEXT NOT NULL,
    section_reference TEXT,
    page_reference TEXT,
    source_url TEXT,
    verified_on TEXT
);

CREATE TABLE IF NOT EXISTS requirements (
    requirement_id INTEGER PRIMARY KEY AUTOINCREMENT,
    source_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    plain_language_summary TEXT NOT NULL,
    applicability_rule TEXT,
    FOREIGN KEY (source_id) REFERENCES handbook_sources(source_id)
);

CREATE TABLE IF NOT EXISTS fee_rules (
    fee_rule_id INTEGER PRIMARY KEY AUTOINCREMENT,
    source_id INTEGER NOT NULL,
    rule_name TEXT NOT NULL,
    amount_paise INTEGER,
    currency TEXT NOT NULL DEFAULT 'INR',
    applicability_rule TEXT NOT NULL,
    verified_on TEXT,
    notes TEXT,
    FOREIGN KEY (source_id) REFERENCES handbook_sources(source_id)
);

CREATE TABLE IF NOT EXISTS application_sessions (
    session_id INTEGER PRIMARY KEY AUTOINCREMENT,
    institution_type TEXT NOT NULL,
    proposed_course TEXT,
    application_category TEXT,
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status TEXT NOT NULL DEFAULT 'draft'
);

CREATE TABLE IF NOT EXISTS checklist_items (
    checklist_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    session_id INTEGER NOT NULL,
    requirement_id INTEGER NOT NULL,
    item_status TEXT NOT NULL DEFAULT 'pending',
    notes TEXT,
    FOREIGN KEY (session_id) REFERENCES application_sessions(session_id),
    FOREIGN KEY (requirement_id) REFERENCES requirements(requirement_id)
);
