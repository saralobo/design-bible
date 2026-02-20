# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A design rules repository ("bible") for AI assistants creating interfaces in Figma, combined with a design engineering workflow plugin. No build system, no tests, no application code -- the content IS the product. All files are Markdown.

## Architecture: Dual Format

Content exists in two parallel formats that must stay in sync:

| Format | Location | Structure |
|---|---|---|
| **Agent Skills** | `.claude/skills/` | 24 on-demand skills (invoked via `/slash-command`) -- [open standard](https://agentskills.io), works across compatible agents |
| **Cursor Rules** | `.cursor/rules/` | 21 `.mdc` files (numbered 00-20) -- legacy Cursor-specific format |

### Claude Code structure
- **All 24 skills** live in `.claude/skills/*/SKILL.md` -- nothing is preloaded
- 21 design quality skills are loaded on-demand when relevant to the design task, or invoked directly via slash command
- 3 process workflow skills (`problem-definition`, `design-context`, `design-engineering`) orchestrate how to approach design work

### Cursor structure
- `.cursor/rules/*.mdc` -- numbered 00-20, frontmatter has `alwaysApply: true/false`

### Mapping between formats
| Cursor `.mdc` | Claude skill |
|---|---|
| `00-core-principles` | `/core-principles` |
| `01-ux-laws` | `/ux-laws` |
| `02-gestalt` | `/gestalt` |
| `03-layout-spacing` | `/layout-spacing` |
| `04-typography` | `/typography` |
| `05-colors` | `/colors` |
| `06-buttons-cta` | `/buttons-cta` |
| `07-forms-inputs` | `/forms-inputs` |
| `08-navigation` | `/navigation` |
| `09-cards-lists` | `/cards-lists` |
| `10-feedback-states` | `/feedback-states` |
| `11-motion-transitions` | `/motion-transitions` |
| `12-micro-interactions` | `/micro-interactions` |
| `13-accessibility` | `/accessibility` |
| `14-nielsen-heuristics` | `/nielsen-heuristics` |
| `15-figma-execution` | `/figma-execution` |
| `16-anti-patterns` | `/anti-patterns` |
| `17-icons` | `/icons` |
| `18-responsiveness-constraints` | `/responsiveness` |
| `19-visual-references` | `/visual-references` |
| `20-design-judgment` | `/design-judgment` |

**Note:** The 3 process skills (`problem-definition`, `design-context`, `design-engineering`) have no `.mdc` equivalent -- they live only in `.claude/skills/`. Cursor can read them directly from there via its skills support.

## When Editing Rules

- If you modify a Claude skill, the corresponding Cursor `.mdc` file likely needs the same update (and vice versa)
- Cursor `.mdc` files use YAML frontmatter (`alwaysApply: true/false`); Claude skills use SKILL.md with name/description frontmatter
- Keep rules concrete and verifiable -- every rule should be checkable against a screenshot
- The 3 process skills (problem-definition, design-context, design-engineering) have no `.mdc` equivalent -- Cursor reads them directly from `.claude/skills/`

## Available Skills

| Skill | When to Use |
|---|---|
| `/core-principles` | Starting any screen, visual hierarchy, 4 pillars, mobile rules |
| `/figma-execution` | Writing Figma API code, auto-layout, colors, fonts, prototyping |
| `/anti-patterns` | Reviewing designs for common mistakes, pre-launch checklist |
| `/design-judgment` | Resolving rule conflicts, final design review, taste over mechanics |
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
| `/problem-definition` | Raw client input, meeting notes, defining problems before designing |
| `/design-context` | Auditing codebase design context, generating DESIGN.md, onboarding to repos |
| `/design-engineering` | Full design engineering framework, project audit, Double Diamond, design QA |

## Design Engineering Workflow

The 3 process skills form a pipeline for approaching design work end-to-end:

```
/problem-definition     /design-context       /design-engineering
(Diamond 1: Problem)    (Audit existing)      (Diamond 2: Solution)
       |                      |                       |
  Raw client input     Scan repo + MCPs        Brand -> Tokens -> Assets
  -> Problem statements  -> DESIGN.md           -> IA -> Design -> Build
  -> Design Brief        -> Context gaps         -> Heuristic QA
```

- **`/problem-definition`** -- Start here with raw client notes. Produces a design brief.
- **`/design-context`** -- Run when landing in any existing codebase. Scans repo + Figma/Notion/Linear MCPs.
- **`/design-engineering`** -- The full framework. Takes the brief and context as inputs, guides through all phases.

The `hooks/hooks.json` file contains a forced-evaluation hook that ensures these 3 process skills are considered before every task. The 21 Design Bible skills are handled automatically by Claude's native skill matching.
