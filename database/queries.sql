-- Example queries for the initial schema.

-- List curated requirements with their source references:
SELECT r.requirement_id, r.title, r.plain_language_summary,
       h.handbook_edition, h.section_reference, h.page_reference, h.source_url
FROM requirements AS r
JOIN handbook_sources AS h ON h.source_id = r.source_id
ORDER BY h.handbook_edition, h.section_reference;

-- List checklist items for one application session (replace ? with session_id):
SELECT c.checklist_item_id, c.item_status, c.notes, r.title
FROM checklist_items AS c
JOIN requirements AS r ON r.requirement_id = c.requirement_id
WHERE c.session_id = ?;
