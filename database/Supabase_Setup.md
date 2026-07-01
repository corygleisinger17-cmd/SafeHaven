# SafeHaven Supabase Setup Guide

**Document ID:** SH-DB-003

**Version:** 1.0

**Status:** Approved

**Owner:** Cory Gleisinger

**Last Updated:** July 2026

---

# Purpose

This document defines the standard configuration for the SafeHaven Supabase environment.

It serves as the deployment guide for development, beta, and production environments.

---

# Overview

Supabase provides the backend infrastructure for SafeHaven including:

- PostgreSQL Database
- User Authentication
- Secure File Storage
- REST APIs
- Row Level Security
- Edge Functions (Future)
- Realtime Services (Future)

---

# Project Environments

Three environments shall be maintained.

## Development

Project Name

safehaven-dev

Purpose

Developer testing

Experimental features

Schema development

---

## Beta

Project Name

safehaven-beta

Purpose

Private user testing

Feature validation

Performance testing

---

## Production

Project Name

safehaven-prod

Purpose

Live customer environment

---

# Authentication

Provider

Supabase Auth

Initial Login Methods

- Email
- Password

Future Login Methods

- Apple
- Google
- Microsoft

---

# Authentication Rules

Users must verify email before creating a household.

Passwords must meet security requirements.

Sessions automatically refresh.

Users may belong to multiple households in future releases.

---

# Database

Technology

PostgreSQL

Schema

public

Core Tables

users

households

household_members

properties

rooms

items

documents

reminders

maintenance_history

ai_insights

search_history

setup_wizard_progress

---

# Storage Buckets

## receipts

Stores uploaded receipts.

Allowed Types

PDF

JPG

PNG

WEBP

---

## manuals

Stores product manuals.

Allowed Types

PDF

---

## warranties

Stores warranty documents.

Allowed Types

PDF

JPG

PNG

---

## photos

Stores inventory photos.

Allowed Types

JPG

PNG

WEBP

HEIC (future)

---

# Row Level Security

Enabled on every table.

Rules

Users may only access households they belong to.

Household members inherit access.

Anonymous access is prohibited.

---

# API

FlutterFlow communicates with Supabase using:

REST

Authentication

JWT

Future

Edge Functions

---

# Secrets

Never store:

OpenAI Keys

Firebase Keys

API Secrets

inside FlutterFlow.

Store all secrets inside Supabase or secure environment variables.

---

# AI Integration

OpenAI requests originate from secure backend services.

FlutterFlow should never communicate directly with OpenAI using private API keys.

Future architecture may use Supabase Edge Functions as the AI gateway.

---

# Backups

Daily automated backups

Weekly verification

Future point-in-time recovery

---

# Logging

Enable:

Authentication Logs

Database Logs

API Logs

Storage Logs

Future

AI Usage Logs

---

# Monitoring

Monitor:

Failed Logins

Database Performance

Storage Utilization

API Latency

Authentication Errors

AI Processing Times

---

# Performance Targets

Authentication

<2 seconds

Dashboard Load

<3 seconds

Search

<2 seconds

Receipt Upload

<10 seconds

Photo Upload

<5 seconds

---

# Development Workflow

Developer

↓

FlutterFlow

↓

Supabase Dev

↓

GitHub Commit

↓

Beta Deployment

↓

Production Release

---

# Security Standards

Encryption in transit

Encryption at rest

Least privilege access

Row Level Security enabled

Secure authentication

No household data leakage

---

# Definition of Ready

Supabase is considered ready when:

✓ Authentication enabled

✓ Storage buckets created

✓ Database tables deployed

✓ Row Level Security enabled

✓ FlutterFlow connected

✓ GitHub documentation complete

---

# Revision History

| Version | Date | Author | Description |
|----------|------|--------|-------------|
| 1.0 | July 2026 | Cory Gleisinger | Initial Supabase Setup Guide |
