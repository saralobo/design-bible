# Design Bible

> 24 UI/UX design skills + design engineering workflow for AI assistants building interfaces.
> Built on the open [Agent Skills](https://agentskills.io) standard -- works with Claude Code, Cursor, Gemini CLI, VS Code, Amp, and any compatible agent.

---

## What is this?

A repository of design rules that works as the **"bible"** for an AI design assistant, combined with a design engineering workflow for end-to-end project execution. When these rules are active, the AI follows fundamental UI/UX principles before creating any screen.

### The problem it solves:
AIs can create interfaces in Figma, but without a design foundation -- oval buttons when they should be circular, inconsistent colors, competing CTAs. This repository "trains" the AI with concrete, verifiable rules. The design engineering workflow adds structure to *how* the AI approaches projects: defining problems before jumping to solutions, auditing existing codebases, and following a phased methodology from brand to shipped product.

---

## Structure

```
design-bible/
├── .claude/                              <- Claude Code integration
│   ├── CLAUDE.md                         <- Project overview (loaded every session)
│   ├── rules/                            <- Always-active rules (auto-loaded)
│   │   ├── core-principles.md            <- Hierarchy, contrast, alignment
│   │   ├── figma-execution.md            <- Figma API technical rules
│   │   ├── anti-patterns.md              <- What to NEVER do (real errors)
│   │   └── design-judgment.md            <- Spirit over letter, design taste
│   └── skills/                           <- On-demand skills (24 total)
│       ├── ux-laws/SKILL.md              <- Fitts, Hick, Jakob, Miller, etc.
│       ├── gestalt/SKILL.md              <- Proximity, similarity, closure
│       ├── layout-spacing/SKILL.md       <- 8px grid, auto-layout, safe areas
│       ├── typography/SKILL.md           <- Type scale, weights, formatting
│       ├── colors/SKILL.md               <- Palette, contrast, dark mode
│       ├── buttons-cta/SKILL.md          <- Hierarchy, sizes, circular
│       ├── forms-inputs/SKILL.md         <- States, validation, labels
│       ├── navigation/SKILL.md           <- Bottom nav, tabs, gestures
│       ├── cards-lists/SKILL.md          <- Cards, lists, empty states
│       ├── feedback-states/SKILL.md      <- Toasts, modals, loading
│       ├── motion-transitions/SKILL.md   <- Easing, durations, transitions
│       ├── micro-interactions/SKILL.md   <- Dan Saffer framework, catalog
│       ├── accessibility/SKILL.md        <- WCAG 2.2, contrast, color blindness
│       ├── nielsen-heuristics/SKILL.md   <- 10 usability heuristics
│       ├── icons/SKILL.md                <- Material Symbols, sizing, containers
│       ├── responsiveness/SKILL.md       <- Constraints, FILL/HUG/FIXED, adaptive
│       ├── visual-references/SKILL.md    <- World-class app design analysis
│       ├── problem-definition/           <- Problem definition partner (process)
│       │   ├── SKILL.md
│       │   └── references/
│       ├── design-context/               <- Codebase design audit (process)
│       │   ├── SKILL.md
│       │   ├── references/
│       │   └── scripts/design-scan.sh
│       └── design-engineering/           <- Full design framework (process)
│           ├── SKILL.md
│           └── references/
├── .claude-plugin/
│   └── plugin.json                       <- Plugin metadata (v2.0.0)
├── .cursor/
│   └── rules/                            <- Cursor IDE integration
│       ├── 00-core-principles.mdc
│       ├── 01-ux-laws.mdc
│       ├── ... (21 rule files)
│       └── 20-design-judgment.mdc
├── hooks/
│   └── hooks.json                        <- Forced skill evaluation hook
└── README.md
```

---

## How to Use

### Option 1: Per-project (any compatible agent)
1. Clone or download this repository into your project
2. Any [Agent Skills-compatible](https://agentskills.io) tool discovers `.claude/skills/` automatically
3. Skills load on-demand when relevant, or invoke directly: `/typography`, `/colors`, `/design-engineering`, etc.

Works with: Claude Code, Cursor, Gemini CLI, VS Code, Amp, Goose, OpenCode, and others.

### Option 2: Global install (available in all projects)
1. Clone this repository
2. Copy the skill directories to your global skills path:
```bash
cp -R .claude/skills/* ~/.claude/skills/
```
3. All 24 skills are now available in every project
4. Optionally copy `hooks/hooks.json` to individual projects for forced skill evaluation

Global paths by agent:
| Agent | Global path |
|---|---|
| Claude Code | `~/.claude/skills/` |
| Cursor | `~/.cursor/skills/` or `~/.claude/skills/` |
| Gemini CLI | `~/.gemini/skills/` |

### Option 3: Cursor Rules (legacy)
1. Copy the `.cursor/rules/` folder into your project
2. The 21 `.mdc` files load as Cursor Rules (older format, still supported)
3. For global: copy `.mdc` files to `~/.cursor/rules/`

### Option 4: Manual reference
1. Open any skill file and read the rules
2. Use as a checklist before creating screens in Figma
3. Share with your team

---

## Skills Reference

### Always-Active Rules (loaded every session)
| Rule | Purpose |
|---|---|
| Core Principles | 4 pillars (hierarchy, contrast, alignment, proximity), mobile rules |
| Figma Execution | Figma API technical rules, correct code patterns |
| Anti-Patterns | 17 documented errors to avoid |
| Design Judgment | Spirit over letter, color restraint, design taste |

### On-Demand Design Skills (loaded automatically when relevant)
| Skill | Invoke With | When Claude Uses It |
|---|---|---|
| UX Laws | `/ux-laws` | Designing interactions, layout positions, simplifying choices |
| Gestalt | `/gestalt` | Grouping elements, organizing hierarchy, structuring layouts |
| Layout & Spacing | `/layout-spacing` | Building screen structure, spacing, page layout |
| Typography | `/typography` | Text elements, headings, type hierarchy |
| Colors | `/colors` | Color tokens, themes, contrast |
| Buttons & CTA | `/buttons-cta` | Buttons, call-to-action, action components |
| Forms & Inputs | `/forms-inputs` | Forms, login screens, data input |
| Navigation | `/navigation` | Navigation structure, screen flow, tabs |
| Cards & Lists | `/cards-lists` | Collections, product listings, card layouts |
| Feedback States | `/feedback-states` | Loading, error/success states, toasts |
| Motion | `/motion-transitions` | Prototyping, screen transitions, animation |
| Micro-interactions | `/micro-interactions` | Interactive details, hover/press feedback |
| Accessibility | `/accessibility` | WCAG 2.2 compliance, inclusive design |
| Nielsen Heuristics | `/nielsen-heuristics` | Usability evaluation, design audits |
| Icons | `/icons` | Icon buttons, Material Symbols, sizing |
| Responsiveness | `/responsiveness` | Responsive screens, constraints, adaptive layout |
| Visual References | `/visual-references` | Design inspiration from top-tier apps |

### Process Workflow Skills
| Skill | Invoke With | When Claude Uses It |
|---|---|---|
| Problem Definition | `/problem-definition` | Raw client input, meeting notes, defining problems before designing |
| Design Context | `/design-context` | Landing in a new repo, auditing design decisions, generating DESIGN.md |
| Design Engineering | `/design-engineering` | Full project workflow, audit, tokens, IA, design, build, QA |

### Design Engineering Workflow

The 3 process skills form a pipeline:

```
/problem-definition       /design-context         /design-engineering
(Diamond 1: Problem)      (Audit existing)        (Diamond 2: Solution)
       |                        |                         |
  Raw client input        Scan repo + MCPs          Brand -> Tokens -> Assets
  -> Problem statements     -> DESIGN.md             -> IA -> Design -> Build
  -> Design Brief           -> Context gaps           -> Heuristic QA
```

### Forced Evaluation Hook

The `hooks/hooks.json` file contains a `UserPromptSubmit` hook that forces Claude to evaluate whether the 3 process skills apply before every task. Based on Scott Spence's forced eval pattern (~84% activation vs ~20% baseline). The 21 Design Bible skills are handled automatically by Claude's native skill matching.

---

## Sources and References

### Books:
- "Don't Make Me Think" — Steve Krug
- "The Design of Everyday Things" — Don Norman
- "Microinteractions" — Dan Saffer
- "Refactoring UI" — Adam Wathan & Steve Schoger
- "About Face" — Alan Cooper
- "Laws of UX" — Jon Yablonski

### Websites:
- [Laws of UX](https://lawsofux.com) — Jon Yablonski
- [Nielsen Norman Group](https://nngroup.com) — Jakob Nielsen
- [Material Design 3](https://m3.material.io) — Google
- [Apple HIG](https://developer.apple.com/design/human-interface-guidelines)
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/)
- [Mobbin](https://mobbin.com) — Real app references
- [Material Symbols](https://fonts.google.com/icons) — Google Icons

---

## How to Contribute

1. **Fork** this repository
2. Create a **branch** with your improvement: `git checkout -b my-improvement`
3. Make your changes
4. **Commit**: `git commit -m "Add rule for X"`
5. **Push**: `git push origin my-improvement`
6. Open a **Pull Request**

### What you can contribute:
- New rules with foundation (cite the source)
- Corrections to values/measurements
- Translations
- New skill modules
- Improvements to existing rules

---

## Content Summary

| # | Module | Topics |
|---|---|---|
| 00 | Core Principles | 4 pillars, mobile rules, checklist |
| 01 | UX Laws | 12 laws with formulas and rules |
| 02 | Gestalt | 8 principles with examples |
| 03 | Layout & Spacing | 8px grid, auto-layout, viewports |
| 04 | Typography | Type scale, weights, formatting |
| 05 | Colors | Palette, contrast, dark mode |
| 06 | Buttons & CTA | Hierarchy, circular, states |
| 07 | Forms & Inputs | Inputs, validation, stepper |
| 08 | Navigation | Bottom nav, tabs, gestures |
| 09 | Cards & Lists | Cards, lists, skeleton |
| 10 | Feedback States | Toasts, modals, success |
| 11 | Motion & Transitions | Material Design 3 motion system |
| 12 | Micro-interactions | Dan Saffer framework, 12 patterns |
| 13 | Accessibility | WCAG 2.2, contrast, focus |
| 14 | Nielsen Heuristics | 10 heuristics with checklists |
| 15 | Figma Execution | API rules, correct code |
| 16 | Anti-Patterns | 17 documented errors |
| 17 | Icons | Material Symbols, sizing, containers |
| 18 | Responsiveness | Constraints, FILL/HUG/FIXED, adaptive |
| 19 | Visual References | World-class app design analysis |
| 20 | Design Judgment | Spirit over letter, design taste |
| 21 | Problem Definition | Client input -> problem statements -> design brief |
| 22 | Design Context | Codebase audit, MCP enrichment, DESIGN.md generation |
| 23 | Design Engineering | Double Diamond, project audit, phased methodology |

---

## License

MIT — Use, modify, distribute freely. Credit if you can.
