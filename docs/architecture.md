# Architecture

## Proposed Components

1. **Frontend:** Collects institution/course details and displays guidance, sources, checklist items, and fee breakdowns.
2. **API backend:** Validates inputs and coordinates retrieval, rules, and report generation.
3. **Handbook processing:** Extracts text from selected official handbook pages and preserves page/section metadata.
4. **Retrieval and AI explanation:** Finds relevant passages and asks an LLM to explain only what the retrieved evidence supports.
5. **Rules engine:** Applies explicit, testable conditions to determine checklist items and calculate only verified fee components.
6. **Database:** Stores curated requirements, source metadata, and optionally saved user sessions.
7. **Report generator:** Exports a summary of user inputs, cited requirements, checklist, and fee breakdown.

## Design Principles

- Keep retrieval and fee calculation separate.
- Store the handbook edition, page, clause, and source for each curated requirement.
- Prefer deterministic rules for numeric calculations.
- If the source is missing or ambiguous, show a warning instead of guessing.
- Keep the first release narrow enough to test end-to-end.

## Initial API Ideas

- `GET /health` — service health check
- `POST /requirements` — return relevant requirements for submitted details
- `POST /ask` — answer a question using retrieved handbook passages
- `POST /checklist` — generate a tailored checklist
- `POST /fees/estimate` — calculate supported fee components
- `POST /report` — create a summary report

These endpoints are proposals and may be adjusted during implementation.
