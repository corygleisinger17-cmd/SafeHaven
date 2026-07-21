# ADR-002: Deterministic Rules Before Artificial Intelligence

**Status:** Accepted

**Date:** July 2026

**Decision Drivers**

- Reliability
- Explainability
- Repeatability
- Testability
- Lower operational cost
- Easier debugging

---

# Context

SafeHaven's Intelligence Engine must identify Manufacturers and Item Types using information entered by users.

Artificial Intelligence can provide powerful inference capabilities but introduces uncertainty, higher operating costs, and reduced explainability.

The project required a solution that could be trusted before introducing probabilistic AI recommendations.

---

# Decision

The first implementation of the Intelligence Engine will use deterministic rules driven entirely by normalized reference data.

Examples include:

- Manufacturer aliases
- Item Type aliases
- Categories
- Future reference tables

The engine will evaluate evidence using explicit scoring rules.

Artificial Intelligence will augment—not replace—the deterministic engine in future releases.

---

# Consequences

## Positive

- Completely explainable recommendations
- Predictable results
- Easier testing
- Lower infrastructure costs
- Easier debugging
- No dependency on external AI providers

## Tradeoffs

- Requires more reference data
- More manual rule maintenance
- Less flexible than AI in ambiguous situations

---

# Alternatives Considered

## AI First

Rejected.

Building the first implementation around AI would increase complexity, reduce explainability, increase operating costs, and make testing significantly more difficult.

---

# Future Considerations

Future AI capabilities may include:

- OCR interpretation
- Product recognition
- Warranty extraction
- Model number inference
- Natural language understanding
- Recommendation refinement

All AI recommendations should continue to produce structured evidence and confidence values.

---

# Related Components

- Reference Knowledge Platform
- Suggestion Engine
- AI Platform

---

# Related Sprints

Sprint 006B – Suggestion Engine Foundation
