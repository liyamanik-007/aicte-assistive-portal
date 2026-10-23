# Problem Statement

## Title
AI-Based Assistive Portal for Stakeholders in the AICTE Approval Process

## Background
The AICTE approval process involves handbook-based requirements, supporting documents, and fee conditions. Stakeholders may find it difficult to identify which requirements apply to a particular institution or proposed course.

## Problem
The project aims to reduce the effort required to interpret selected approval-handbook requirements and organise the related documentation and fee information.

## Proposed Objective
Build a web portal that accepts selected institution/course details and presents relevant, source-backed guidance, a tailored document checklist, and a fee breakdown where verified rules are available.

## Scope for the Initial Prototype
- Support one clearly defined approval scenario.
- Use a selected, verified subset of the applicable handbook.
- Display the source section/page for each requirement.
- Generate a checklist from explicit conditions.
- Calculate only fee components supported by verified source data.
- Mark missing, ambiguous, or unverified information for human review.

## Out of Scope
- Replacing the official AICTE application or approval process.
- Making official eligibility or approval decisions.
- Claiming complete coverage of every handbook clause.
- Presenting unverified fee amounts as authoritative.

## Success Criteria
1. Users can enter the chosen scenario's required details.
2. The portal retrieves relevant handbook passages with source references.
3. Explanations remain grounded in the retrieved source.
4. Checklist conditions can be tested with known examples.
5. Fee calculations match a team-verified test set.
6. The system clearly reports when it cannot provide a reliable answer.
