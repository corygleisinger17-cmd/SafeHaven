# SafeHaven Entity Relationship Diagram (ERD)

**Document ID:** SH-DB-002

**Version:** 1.0

**Status:** Approved

**Owner:** Cory Gleisinger

**Last Updated:** July 2026

---

# Purpose

This document defines the logical relationships between all entities within the SafeHaven database.

It complements SH-DB-001 (Database Schema) by illustrating how data is connected and how relationships support application functionality.

---

# Design Philosophy

Every piece of information in SafeHaven belongs to a household.

The Household is the core entity of the platform.

Everything else connects back to it.

---

# High-Level Relationship

User

↓

Household Membership

↓

Household

↓

Property

↓

Room

↓

Item

↓

Documents

↓

Maintenance

↓

AI Insights

↓

Reminders

---

# Entity Relationships

## User

One User may belong to:

• One Household

or

• Multiple Households (Future)

Relationship

User (1)

↓

Household Member (Many)

---

## Household

A Household owns:

• Properties

• Rooms

• Inventory

• Documents

• Reminders

• AI Insights

• Search History

---

## Household Members

One Household

↓

Many Members

Each Member

↓

One User Account

Role Examples

Owner

Admin

Member

---

## Property

One Household

↓

Many Properties

Examples

Primary Home

Vacation Home

Rental Property

---

## Room

One Property

↓

Many Rooms

Examples

Kitchen

Garage

Basement

Laundry

Outdoor

---

## Item

One Room

↓

Many Items

Every Item belongs to:

One Household

One Property

One Room

---

## Documents

Each Item

↓

Many Documents

Examples

Receipt

Manual

Warranty

Invoice

Photos

---

## Reminder

Each Item

↓

Many Reminders

Examples

Replace Filter

Clean Dishwasher

Replace Smoke Detector Batteries

---

## Maintenance History

Each Item

↓

Many Maintenance Records

Each maintenance event is permanently recorded.

---

## AI Insights

Each Household

↓

Many AI Insights

Each Insight may optionally reference:

Item

Document

Reminder

Property

---

## Search History

Each User

↓

Many Searches

Purpose

Improve future AI recommendations.

---

## Setup Wizard

Each Household

↓

Many Setup Records

Tracks

Room Progress

Item Prompts

Completion Score

Skipped Items

---

# Cardinality

Users

1 → Many Household Memberships

Households

1 → Many Properties

Properties

1 → Many Rooms

Rooms

1 → Many Items

Items

1 → Many Documents

Items

1 → Many Reminders

Items

1 → Many Maintenance Records

Households

1 → Many AI Insights

Users

1 → Many Search Records

---

# Primary Keys

Every table uses:

UUID

Example

user_id

household_id

property_id

item_id

document_id

---

# Foreign Keys

Examples

household.owner_user_id

↓

users.user_id

rooms.property_id

↓

properties.property_id

items.room_id

↓

rooms.room_id

documents.item_id

↓

items.item_id

---

# Ownership Model

Every record belongs to a household.

Security is enforced through Household Membership.

Users never directly own:

Items

Documents

Reminders

Maintenance

AI Insights

The Household owns everything.

---

# Future Expansion

The data model supports future entities including:

Insurance Policies

Projects

Paint Inventory

Service Providers

Vehicles

Outdoor Equipment

Smart Devices

Energy Usage

Household Budgets

Marketplace Transactions

without requiring redesign of the existing architecture.

---

# Design Principles

The database should remain:

Normalized

Simple

Scalable

Maintainable

Secure

Cloud-native

AI-friendly

---

# Relationship Summary

User

↓

Household Membership

↓

Household

↓

Property

↓

Room

↓

Item

↓

Document

↓

Reminder

↓

Maintenance

↓

AI Insight

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | July 2026 | Cory Gleisinger | Initial ERD Documentation |
