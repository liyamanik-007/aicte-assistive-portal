# Initial ER Diagram

This is a proposed starting model. Adjust it after the team confirms the exact scenario and data requirements.

```mermaid
erDiagram
    USER ||--o{ APPLICATION_SESSION : creates
    APPLICATION_SESSION ||--o{ CHECKLIST_ITEM : contains
    REQUIREMENT ||--o{ CHECKLIST_ITEM : informs
    HANDBOOK_SOURCE ||--o{ REQUIREMENT : supports
    APPLICATION_SESSION ||--o{ FEE_ESTIMATE : has
    HANDBOOK_SOURCE ||--o{ FEE_RULE : supports
    FEE_RULE ||--o{ FEE_ESTIMATE : used_by

    USER {
        int user_id PK
        string display_name
        string role
    }
    APPLICATION_SESSION {
        int session_id PK
        int user_id FK
        string institution_type
        string course
        string application_category
        string status
    }
    HANDBOOK_SOURCE {
        int source_id PK
        string handbook_edition
        string section
        string page_reference
        string source_url
    }
    REQUIREMENT {
        int requirement_id PK
        int source_id FK
        string title
        string plain_language_summary
        string applicability_rule
    }
    CHECKLIST_ITEM {
        int checklist_item_id PK
        int session_id FK
        int requirement_id FK
        string status
        string notes
    }
    FEE_RULE {
        int fee_rule_id PK
        int source_id FK
        string rule_name
        decimal amount
        string applicability_rule
        string verified_on
    }
    FEE_ESTIMATE {
        int estimate_id PK
        int session_id FK
        int fee_rule_id FK
        decimal calculated_amount
        string assumptions
    }
```

## Notes

- `amount` should only be populated from a verified applicable source.
- Consider storing fee values in integer paise or using a suitable decimal type in the application to avoid floating-point rounding errors.
- This model is illustrative, not a claim about AICTE's official data model.
