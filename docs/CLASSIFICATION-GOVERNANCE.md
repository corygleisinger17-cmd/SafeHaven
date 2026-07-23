# Classification Governance

> **Version:** 1.0  
> **Status:** Engineering Standard  
> **Audience:** Engineering, Product, Data Governance, QA  
> **Last Updated:** July 2026

---

# Purpose

SafeHaven's intelligence depends on the quality of its reference data.

Poor reference data creates poor recommendations.

This document defines how categories, manufacturers, item types, aliases, and relationships are governed to ensure the platform remains accurate, explainable, and trustworthy.

Reference data is one of SafeHaven's most valuable assets.

It should be managed with the same discipline as application code.

---

# Scope

This document governs:

- Categories
- Item Types
- Manufacturers
- Manufacturer Aliases
- Item Type Aliases
- Manufacturer ↔ Item Type Relationships
- Classification Rules
- Confidence Thresholds

Future versions will also govern:

- Accessories
- Consumables
- Replacement Parts
- Product Families
- Maintenance Templates
- Warranty Defaults

---

# Guiding Principles

## 1. Reference Data Is Product Code

Reference data is not user content.

It is part of the platform.

Changes should be:

- Reviewed
- Versioned
- Tested
- Auditable
- Deployable through migrations

Reference data should never be edited directly in production.

---

## 2. Human-Curated First

SafeHaven may suggest new knowledge.

Humans approve it.

Examples include:

- New manufacturers
- Alias corrections
- Item types
- Product relationships

AI proposes.

People curate.

---

## 3. Deterministic Before AI

Whenever deterministic rules can solve a problem reliably, they should be preferred over AI.

Example:

```
Model begins with:

DWX-

↓

Known DeWalt model prefix

↓

Deterministic match
```

Deterministic rules are:

- Faster
- Explainable
- Repeatable
- Easier to test

AI should enhance—not replace—deterministic classification.

---

## 4. Never Break Existing Classifications

Changes to reference data must not silently invalidate previously accepted ownership records.

Historical classifications remain part of the ownership record.

New intelligence should improve future recommendations without rewriting history.

---

## 5. Explainability Is Required

Every recommendation should be traceable.

Examples:

Manufacturer determined because:

- Exact alias match
- Model prefix
- OCR from receipt

Item Type determined because:

- Asset name
- Manufacturer relationship
- Manual metadata

If the platform cannot explain a recommendation, confidence should be reduced.

---

# Reference Data Hierarchy

```text
Category
    │
    ▼
Item Type
    │
    ▼
Manufacturer
```

Examples:

```
Power Tools
    ↓
Cordless Drill
    ↓
DeWalt
```

```
Kitchen Appliances
    ↓
Microwave
    ↓
Panasonic
```

Relationships should always flow downward.

Cross-links should be represented explicitly.

---

# Alias Management

Aliases improve recognition without changing canonical names.

Example:

Canonical:

```
DeWalt
```

Aliases:

```
dewalt
DEWALT
De Walt
Dewalt Tools
```

The canonical value should always remain consistent.

Aliases should never become canonical records.

---

# Relationship Governance

Relationships should represent reusable business knowledge.

Examples:

Manufacturer → Item Type

```
DeWalt

supports

Cordless Drill
```

Item Type → Maintenance Template

```
Lawn Tractor

requires

Oil Change
```

Manufacturer → Product Family

```
Milwaukee

supports

M18
```

Relationships should be normalized and reusable.

---

# Confidence Thresholds

Suggested defaults:

| Confidence | Action |
|------------|--------|
| Very High | Recommend prominently |
| High | Recommend |
| Medium | Present for review |
| Low | Suggest cautiously |
| Insufficient | Do not recommend |

Thresholds may evolve as the platform improves.

---

# Change Process

Every reference data change should follow this lifecycle.

```text
Proposal
     │
     ▼
Review
     │
     ▼
Approval
     │
     ▼
Migration
     │
     ▼
Validation
     │
     ▼
Production
```

Reference data should evolve deliberately.

---

# Testing Requirements

Every change should verify:

- Existing classifications remain valid
- New aliases resolve correctly
- Relationships remain consistent
- Confidence scores remain stable
- Duplicate records are avoided

Automated tests should accompany significant changes.

---

# Metrics

The platform should monitor:

- Classification acceptance rate
- Rejection rate
- Unknown manufacturers
- Unknown item types
- Alias usage
- Manual corrections
- Recommendation accuracy

These metrics help identify areas for improvement.

---

# Future Evolution

Future governance may include:

- Community-contributed aliases
- Manufacturer verification
- Automated conflict detection
- Versioned knowledge packages
- Regional terminology
- Multi-language support

All future enhancements must preserve explainability and trust.

---

# Non-Negotiables

The following rules should never be violated:

- User-owned facts are never silently overwritten.
- Reference data changes are versioned.
- AI recommendations remain distinguishable from accepted facts.
- Historical classifications are preserved.
- Deterministic rules take precedence when appropriate.
- Every recommendation should be explainable.

---

# Guiding Statement

> **SafeHaven's intelligence is only as trustworthy as the knowledge it is built upon.**

Reference data is not just supporting information.

It is one of the platform's core products.
