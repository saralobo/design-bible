# Design Bible

> Absolute UI/UX rules for AIs that create interfaces in Figma.
> Available as **Cursor Rules** (`.mdc`) and **Claude Code Skills**.

---

## What is this?

A repository of design rules that works as the **"bible"** for an AI design assistant. When these rules are active, the AI follows fundamental UI/UX principles before creating any screen.

### The problem it solves:
AIs can create interfaces in Figma, but without a design foundation — oval buttons when they should be circular, inconsistent colors, competing CTAs. This repository "trains" the AI with concrete, verifiable rules.

---

## Structure

```
design-bible/
├── .claude/                              ← Claude Code integration
│   ├── CLAUDE.md                         ← Project overview (loaded every session)
│   ├── rules/                            ← Always-active rules (auto-loaded)
│   │   ├── core-principles.md            ← Hierarchy, contrast, alignment
│   │   ├── figma-execution.md            ← Figma API technical rules
│   │   ├── anti-patterns.md              ← What to NEVER do (real errors)
│   │   └── design-judgment.md            ← Spirit over letter, design taste
│   └── skills/                           ← On-demand skills (auto-invoked by context)
│       ├── ux-laws/SKILL.md              ← Fitts, Hick, Jakob, Miller, etc.
│       ├── gestalt/SKILL.md              ← Proximity, similarity, closure
│       ├── layout-spacing/SKILL.md       ← 8px grid, auto-layout, safe areas
│       ├── typography/SKILL.md           ← Type scale, weights, formatting
│       ├── colors/SKILL.md               ← Palette, contrast, dark mode
│       ├── buttons-cta/SKILL.md          ← Hierarchy, sizes, circular
│       ├── forms-inputs/SKILL.md         ← States, validation, labels
│       ├── navigation/SKILL.md           ← Bottom nav, tabs, gestures
│       ├── cards-lists/SKILL.md          ← Cards, lists, empty states
│       ├── feedback-states/SKILL.md      ← Toasts, modals, loading
│       ├── motion-transitions/SKILL.md   ← Easing, durations, transitions
│       ├── micro-interactions/SKILL.md   ← Dan Saffer framework, catalog
│       ├── accessibility/SKILL.md        ← WCAG 2.2, contrast, color blindness
│       ├── nielsen-heuristics/SKILL.md   ← 10 usability heuristics
│       ├── icons/SKILL.md                ← Material Symbols, sizing, containers
│       ├── responsiveness/SKILL.md       ← Constraints, FILL/HUG/FIXED, adaptive
│       └── visual-references/SKILL.md    ← World-class app design analysis
├── .cursor/
│   └── rules/                            ← Cursor IDE integration
│       ├── 00-core-principles.mdc
│       ├── 01-ux-laws.mdc
│       ├── ... (21 rule files)
│       └── 20-design-judgment.mdc
└── README.md
```

---

## How to Use

### Option 1: Claude Code (recommended)
1. Clone or download this repository
2. Open a terminal in the project directory
3. Run `claude` to start Claude Code
4. The 4 core rules load automatically every session
5. The 17 contextual skills load on-demand when relevant to your task
6. You can also invoke skills directly: `/ux-laws`, `/typography`, `/colors`, etc.

### Option 2: Cursor IDE
1. Clone or download this repository
2. Copy the `.cursor/rules/` folder into your Figma design project
3. Open the project in Cursor IDE
4. The AI automatically reads the rules before each response

### Option 3: Cursor global rules
1. Clone or download this repository
2. Copy the `.mdc` files to `~/.cursor/rules/` (global folder)
3. The rules apply to ALL projects in Cursor

### Option 4: Manual reference
1. Open any rule file and read the rules
2. Use as a checklist before creating screens in Figma
3. Share with your team

---

## Claude Code Skills Reference

### Always-Active Rules (loaded every session)
| Rule | Purpose |
|---|---|
| Core Principles | 4 pillars (hierarchy, contrast, alignment, proximity), mobile rules |
| Figma Execution | Figma API technical rules, correct code patterns |
| Anti-Patterns | 17 documented errors to avoid |
| Design Judgment | Spirit over letter, color restraint, design taste |

### On-Demand Skills (loaded automatically when relevant)
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

---

## License

MIT — Use, modify, distribute freely. Credit if you can.
