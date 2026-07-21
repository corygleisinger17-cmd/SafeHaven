# ADR-001: Persist Intelligence Suggestions

**Status:** Accepted

**Date:** July 2026

**Decision Drivers**

- Fast user experience
- Explainable recommendations
- Historical tracking
- Future AI enhancements
- Background processing
- Auditability

---

# Context

The SafeHaven Intelligence Engine generates recommendations for Item Types and Manufacturers based on deterministic matching against the Reference Knowledge Platform.

Two architectural approaches were considered:

1. Generate recommendations on demand every time an item is viewed.
2. Persist generated suggestions within the database.

Generating suggestions on demand minimizes storage but prevents historical analysis, versioning, and efficient background processing.

---

# Decision

SafeHaven will persist generated suggestions in the database.

The Intelligence Engine will create a suggestion record containing:

- Suggested Manufacturer
- Suggested Item Type
- Confidence Scores
- Supporting Evidence
- Engine Version
- Generation Timestamp
- Suggestion Status

Future user interfaces will display these persisted suggestions for review.

Only one active suggestion should exist per item at a time. Older suggestions should be retained for historical reference by marking them as superseded rather than deleting them.

---

# Consequences

## Positive

- Fast UI response times
- Complete audit history
- Historical comparison between engine versions
- Easier debugging
- Enables background processing
- Supports future AI improvements
- Simplifies analytics

## Tradeoffs

- Additional database storage
- Additional maintenance logic
- Suggestion lifecycle management required

---

# Alternatives Considered

## Generate Suggestions On Demand

Rejected.

Although simpler initially, this approach eliminates historical tracking, prevents version comparisons, increases processing load, and makes future AI enhancements more difficult.

---

# Future Considerations

Future releases may include:

- Automatic reprocessing when engine versions change
- Bulk household suggestion generation
- AI-enhanced recommendations
- Suggestion analytics
- Recommendation quality metrics

---

# Related Components

- Suggestion Engine
- Intelligence Platform
- Reference Knowledge Platform

---

# Related Sprints

Sprint 006B – Suggestion Engine Foundation
