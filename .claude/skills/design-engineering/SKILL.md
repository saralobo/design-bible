---
name: design-engineering
description: Design engineering framework for building UI/UX across landing pages, mobile apps, and web apps. Use when starting a new project, auditing an existing one, making design-to-code decisions, setting up design tokens, creating visual assets with AI tools, designing key screens, building components, or ensuring cross-surface consistency. Also use when the user asks about Nielsen heuristics, Double Diamond, UX audit, design QA, or design systems.
---

# Design Engineering Framework

A reusable methodology for going from brand guide -> design tokens -> visual assets -> UI decisions -> production code, across any combination of surfaces (landing page, mobile app, web app).

## When to Use This

- Starting a new project (greenfield or takeover)
- Auditing where a project stands before making decisions
- Translating a brand guide into a buildable design system
- Generating visual assets (icons, illustrations) with AI tools
- Designing key screens that set patterns for everything
- Building components in the right order
- Ensuring consistency across multiple surfaces
- Running a UX quality check (heuristic evaluation)

## Core Concepts

### Double Diamond (Thinking Structure)

Two modes: understanding the **problem** (Diamond 1) and creating the **solution** (Diamond 2). Each has a divergent phase (go wide) and convergent phase (narrow down).

1. **Discover** (diverge) -> Understand the problem space
2. **Define** (converge) -> Clear problem statement
3. **Develop** (diverge) -> Generate multiple solutions
4. **Deliver** (converge) -> Test, refine, ship

**Mapping to this framework:**
- Discover/Define -> `/problem-definition` (companion skill) + Phase 0 (Audit)
- Develop -> Phase 1-4 (Tokens -> Assets -> IA -> Design)
- Deliver -> Phase 5 (Build) + Phase 6 (Consistency)

**Four UX disciplines — where they live:**
- **User Research** -> `/problem-definition` (evidence flags, missing voices, research gaps)
- **Experience Strategy** -> Design Brief + Phase 0 Audit (problems -> priorities -> plan)
- **Information Architecture** -> Phase 3 (structure before screens — 75% of the real work on data-heavy products)
- **Interaction Design** -> Phase 4 (states, transitions, feedback, error handling)

The audit (Phase 0) tells you which diamond you're starting in. Don't jump to Diamond 2 before Diamond 1 is done.

For full details, read: [references/double-diamond.md](./references/double-diamond.md)

### Nielsen's 10 Usability Heuristics

Used in THREE places — not just QA:

1. **Problem definition** (recognition) — heuristics help name what's wrong. "Users can't find things" = recognition vs. recall problem. Used in `/problem-definition` to sharpen problem statements.
2. **Design** (guidance) — heuristics inform design decisions. "This flow needs visible status" = design for visibility. Used in Phase 4.
3. **QA** (evaluation) — heuristics catch what slipped through. Score each flow 1-5. Used in Phase 5-6.

The 10 heuristics:
1. Visibility of system status
2. Match between system and real world
3. User control and freedom
4. Consistency and standards
5. Error prevention
6. Recognition rather than recall
7. Flexibility and efficiency of use
8. Aesthetic and minimalist design
9. Help users recognize, diagnose, recover from errors
10. Help and documentation

For full heuristics with applied examples and audit template, read: [references/nielsen-heuristics.md](./references/nielsen-heuristics.md)

---

## The Framework

### Phase 0: Project Audit

Score each axis independently (L0-L3):

| Axis | L0 (Nothing) | L1 (Seed) | L2 (Guided) | L3 (Established) |
|---|---|---|---|---|
| Brand Identity | No brand | Name + rough colors | Brand guide exists | Full system (tokens, voice, guidelines) |
| Design Artifacts | No designs | Sketches/wireframes | Designed key screens | Full spec with interactions |
| Design System | Nothing | Ad-hoc components | Partial library | Systematic with tokens |
| Codebase | Nothing | Prototype/POC | Partial build | Mature, tested, deployed |
| Content & Copy | Nothing | Rough notes | Drafted copy | Final, reviewed content |

**Project Archetypes** (determined by audit):
- **Greenfield with Brand** — Full framework, start to finish
- **Build What's Designed** — Skip to Phase 4, designs exist
- **Redesign/Rebrand** — Restart at Phase 1 with new brand
- **Rescue/Takeover** — Audit first, then fix gaps
- **Polish & Ship** — Phase 4-5 only, close the gap

For audit card template, read: [references/audit-template.md](./references/audit-template.md)

### Phase 1: Brand -> Design Tokens

Extract brand guide into buildable tokens:
- 5 brand colors -> 30+ functional UI colors (backgrounds, borders, text, states, feedback)
- Typography: scale with purpose (display, heading, body, caption, code)
- Spacing: consistent scale (4, 8, 12, 16, 24, 32, 48, 64)
- Border radius, shadows, transitions

**Output:** `tokens.ts` or `tailwind.config.ts` as single source of truth.

### Phase 2: Visual Asset Strategy

Inventory needed assets across all surfaces:
- Icons (navigation, status, actions, categories)
- Illustrations (onboarding, empty states, how-it-works, errors)
- Photography/mockups (marketing, app store)
- Special (maps, data visualization)

**AI Tool Decision Matrix:**
| Asset Type | Recraft | Manual | Why |
|---|---|---|---|
| Icons (SVG) | Yes | When brand-critical | Native SVG, hex color control, style lock |
| Illustrations | Yes | When narrative-heavy | Style consistency across set |
| Photos | No | Stock or shoot | AI photos feel wrong for real products |
| Mockups | Yes | Complex compositions | Device frames, marketing materials |
| UI Graphics | Case by case | Complex/animated | Simple = AI, complex = manual |

**Style Lock workflow:** Upload 3-5 brand assets to Recraft -> train style -> generate consistent set.

### Phase 3: Information Architecture

**This is where 75% of the thinking happens on data-heavy products** — dashboards, compliance tools, admin panels, anything where the problem is "too much information, no structure."

Do this BEFORE screens. Screens are the rendering of IA decisions, not the other way around.

**Core IA questions:**
- What are the objects in this system? (users, certs, devices, tests, reports)
- How do they relate? (a device has many tests, a test belongs to one certification)
- What are the user's top tasks? (check status, find what needs action, generate report)
- What grouping makes tasks efficient? (by status? by device? by deadline?)
- What's the hierarchy? (what's always visible vs. drill-down vs. hidden?)
- What's the navigation model? (sidebar, tabs, breadcrumbs, search-first?)

**Outputs:**
- Object model — what exists and how it connects (simple boxes and arrows, not UML)
- Content hierarchy — what's primary, secondary, tertiary on each view
- Navigation structure — how users move between views
- Naming — what things are called (use user language, not system language)

**Test the IA without any UI:** Can you describe the structure to someone and have them find a thing? If you say "where would you look for overdue certifications?" and they can answer, the IA works.

Skip this phase ONLY if the product is single-purpose with minimal structure (landing page, simple form, marketing site).

### Phase 4: Design Exploration -> UI + Interaction Decisions

1. Low-fi wireframes for layout architecture (Excalidraw or paper)
2. Extract component inventory from wireframes
3. Design 3-5 key screens that set patterns for everything

**Key screens to prioritize:** The ones that establish the most reusable patterns. Usually: hero/landing, core user flow, dashboard/list view, detail view, empty/error states.

Speed over polish. You're making decisions, not pixel-perfect comps.

**Interaction Design — make it explicit for each key screen:**
- **States:** What does this look like empty? Loading? Error? Success? Partial? Overflowing?
- **Transitions:** What happens when the user acts? Immediate? Optimistic? Loading spinner? Skeleton?
- **Feedback:** How does the user know something worked? Toast? Inline? Animation? Color change?
- **Error handling:** What goes wrong? How does the user recover? Can they undo?
- **Edge cases:** What about 0 items? 1 item? 10,000 items? Really long names? Missing data?

Don't design the happy path only. The happy path is 20% of the interaction design.

**Run a heuristic scan** on each key screen for the top 5 relevant heuristics. At this stage, heuristics are guidance: "visibility of system status says we should show progress here."

### Phase 5: Design -> Code Bridge

**Scaffolding:** Next.js + TypeScript + Tailwind + shadcn/ui (or equivalent)

**Component build order:**
1. Design tokens (tailwind config)
2. Primitives (Button, Input, Badge, Avatar)
3. Layout components (Container, Stack, Grid, Card)
4. Composed components (Header, Sidebar, Form sections)
5. Page-level compositions
6. Micro-interactions and polish

**Design QA loop:** After each major screen, verify on available surfaces:
- Screenshot implementation vs. design reference (Figma if connected, original spec if not)
- Check spacing, color, typography, alignment, responsive
- If agentation + agent-browser are available: run critique mode on the rendered page for automated design review
- Run heuristic scan on the core flow (at this stage, heuristics catch what slipped through)
- Fix discrepancies immediately (self-driving mode if agentation is available, manual otherwise)

### Phase 6: Cross-Surface Consistency

**Shared foundation:** Same tokens, same icon set, same illustration style, same copy voice.

**Surface-specific adaptations:**
- Landing page: marketing-focused, conversion-optimized, heavier visuals
- Mobile app: touch targets, native patterns (iOS/Android), offline states
- Web app: information density, keyboard shortcuts, complex workflows

**Pre-ship checklist:**
- [ ] Same colors render identically across surfaces
- [ ] Icon set is complete and consistent
- [ ] Typography scale is proportional per surface
- [ ] Core flows pass heuristic audit (score 3+ on all 10) — this is the third and final heuristic pass
- [ ] Tone of voice is consistent in all copy

---

## Tool Stack Reference

| Category | Tools |
|---|---|
| Design | Figma (when available), Excalidraw, Paper, or straight to code |
| AI Assets | Recraft (icons, illustrations, SVGs, mockups), Claude (copy, code), Midjourney/DALL-E (photorealistic) |
| Development | Next.js + TypeScript + Tailwind, shadcn/ui, Framer Motion, Vercel |
| Design-Code Bridge | Objects, Claude Code |
| QA | Manual screenshot comparison, heuristic audit, agentation critique mode (when available), tokens file as source of truth |

---

## Companion Skills

- **`/problem-definition`** — Thinking partner for Diamond 1. Paste raw client notes and work through defining the actual problems before designing anything. Use BEFORE this framework — the design brief it produces is the input to Phase 0.
- **`/design-context`** — Audit a codebase for design context. Scans the repo + MCPs (Figma, Notion, Linear), flags what's missing, generates a `DESIGN.md`. Use when landing in any existing repo.

---

## Quick-Start Checklist

- [ ] **Define problems** — run `/problem-definition` with client notes -> design brief (flags evidence level + IA signal)
- [ ] **Design context** — run `/design-context` to audit what's in the repo vs. what's missing
- [ ] **Audit** — score all 5 axes, identify archetype
- [ ] **Tokens** — extract brand -> functional palette, type scale, spacing
- [ ] **Assets** — inventory needs, decide AI vs. manual per type
- [ ] **Information architecture** — objects, hierarchy, navigation, naming (before screens!)
- [ ] **Design + interaction** — wireframes, 3-5 key screens, states, transitions, errors, edge cases
- [ ] **Build** — tokens -> primitives -> layouts -> composed -> pages -> polish
- [ ] **Heuristic audit** — score core flows against Nielsen's 10 (third pass)
- [ ] **Cross-surface QA** — consistency check across all surfaces
