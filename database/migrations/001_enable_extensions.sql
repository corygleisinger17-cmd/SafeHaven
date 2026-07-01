/*
SafeHaven Migration 001
File: /database/migrations/001_extensions.sql
Purpose: Enable required PostgreSQL extensions.
*/

create extension if not exists pgcrypto;
create extension if not exists citext;
