# Design Bible — UI/UX Rules for AI Design Assistants

This repository is a comprehensive collection of UI/UX design rules for AI assistants creating interfaces in Figma. It provides concrete, verifiable design principles grounded in established frameworks (Material Design 3, Apple HIG, WCAG 2.2, Nielsen heuristics, UX laws).

## How This Works

- **Always-loaded rules** (in `.claude/rules/`) apply to every session: core principles, Figma execution, anti-patterns, and design judgment
- **On-demand skills** (in `.claude/skills/`) are loaded automatically by Claude when relevant to the current design task

## Key Principles

1. **One primary action per screen** — Never compete with 2 CTAs of equal visual weight
2. **8px grid for ALL spacing** — Foundation for consistency
3. **4.5:1 contrast minimum** — Accessibility is non-negotiable
4. **Color restraint** — 1 accent color + neutrals only
5. **Circular buttons must be truly circular** — width = height, cornerRadius = size/2
6. **Rules guide judgment, not replace it** — The screenshot is the ultimate judge

## Design Foundations

Based on: "Don't Make Me Think" (Krug), "The Design of Everyday Things" (Norman), "Refactoring UI" (Wathan & Schoger), "Microinteractions" (Saffer), "Laws of UX" (Yablonski), Material Design 3, Apple HIG, WCAG 2.2.

## Available Skills

| Skill | When to Use |
|---|---|
| `/ux-laws` | Designing interactions, layout positions, simplifying choices |
| `/gestalt` | Grouping elements, organizing visual hierarchy, structuring layouts |
| `/layout-spacing` | Building screen structure, defining spacing, page layout |
| `/typography` | Adding text elements, headings, body text, type hierarchy |
| `/colors` | Choosing colors, defining tokens, themes, contrast |
| `/buttons-cta` | Creating buttons, CTAs, interactive action components |
| `/forms-inputs` | Building forms, login screens, data input interfaces |
| `/navigation` | Designing navigation structure, screen flow, wayfinding |
| `/cards-lists` | Displaying collections, product listings, card layouts |
| `/feedback-states` | Loading indicators, error/success states, toasts |
| `/motion-transitions` | Prototyping, screen transitions, animation design |
| `/micro-interactions` | Interactive details, hover effects, press feedback |
| `/accessibility` | WCAG 2.2 compliance, inclusive design review |
| `/nielsen-heuristics` | Usability evaluation, design audits, heuristic review |
| `/icons` | Adding icons, icon buttons, Material Symbols |
| `/responsiveness` | Responsive screens, constraints, adaptive components |
| `/visual-references` | Design inspiration, best practices from top-tier apps |
