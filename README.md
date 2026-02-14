# Design Bible 📖

> Absolute UI/UX rules for AIs that create interfaces in Figma.
> Made to be used with **Cursor IDE** as Cursor Rules (`.mdc`).

---

## What is this?

A repository of design rules that works as the **"bible"** for an AI design assistant. When these rules are active in Cursor, the AI follows fundamental UI/UX principles before creating any screen.

### The problem it solves:
AIs can create interfaces in Figma, but without a design foundation — oval buttons when they should be circular, inconsistent colors, competing CTAs. This repository "trains" the AI with concrete, verifiable rules.

---

## 📁 Structure

```
design-bible/
├── .cursor/
│   └── rules/
│       ├── 00-core-principles.mdc      ← Hierarchy, contrast, alignment
│       ├── 01-ux-laws.mdc              ← Fitts, Hick, Jakob, Miller, etc.
│       ├── 02-gestalt.mdc              ← Proximity, similarity, closure
│       ├── 03-layout-spacing.mdc       ← 8px grid, auto-layout, safe areas
│       ├── 04-typography.mdc           ← Type scale, weights, formatting
│       ├── 05-colors.mdc              ← Palette, contrast, dark mode
│       ├── 06-buttons-cta.mdc         ← Hierarchy, sizes, circular
│       ├── 07-forms-inputs.mdc        ← States, validation, labels
│       ├── 08-navigation.mdc          ← Bottom nav, tabs, gestures
│       ├── 09-cards-lists.mdc         ← Cards, lists, empty states
│       ├── 10-feedback-states.mdc     ← Toasts, modals, loading
│       ├── 11-motion-transitions.mdc  ← Easing, durations, transitions
│       ├── 12-micro-interactions.mdc  ← Dan Saffer framework, catalog
│       ├── 13-accessibility.mdc       ← WCAG 2.2, contrast, color blindness
│       ├── 14-nielsen-heuristics.mdc  ← 10 usability heuristics
│       ├── 15-figma-execution.mdc     ← Figma API technical rules
│       └── 16-anti-patterns.mdc       ← What to NEVER do (real errors)
├── references/                         ← Reference screenshots (add yours!)
└── README.md
```

---

## 🚀 How to Use

### Option 1: Copy to your project
1. Clone or download this repository
2. Copy the `.cursor/rules/` folder into your project
3. Open the project in Cursor IDE
4. The AI automatically reads the rules before each response

### Option 2: Cursor global rules
1. Clone or download this repository
2. Copy the `.mdc` files to `~/.cursor/rules/` (global folder)
3. The rules apply to ALL projects in Cursor

### Option 3: Manual reference
1. Open any `.mdc` file and read the rules
2. Use as a checklist before creating screens in Figma
3. Share with your team

---

## 📚 Sources and References

### Books:
- "Don't Make Me Think" — Steve Krug
- "The Design of Everyday Things" — Don Norman
- "Microinteractions" — Dan Saffer
- "Refactoring UI" — Adam Wathan & Steve Schoger
- "About Face" — Alan Cooper

### Websites:
- [Laws of UX](https://lawsofux.com) — Jon Yablonski
- [Nielsen Norman Group](https://nngroup.com) — Jakob Nielsen
- [Material Design 3](https://m3.material.io) — Google
- [Apple HIG](https://developer.apple.com/design/human-interface-guidelines)
- [WCAG 2.2](https://www.w3.org/TR/WCAG22/)
- [Mobbin](https://mobbin.com) — Real app references

---

## 🤝 How to Contribute

1. **Fork** this repository
2. Create a **branch** with your improvement: `git checkout -b my-improvement`
3. Make your changes in the `.mdc` files
4. **Commit**: `git commit -m "Add rule for X"`
5. **Push**: `git push origin my-improvement`
6. Open a **Pull Request**

### What you can contribute:
- ✅ New rules with foundation (cite the source)
- ✅ Corrections to values/measurements
- ✅ Reference screenshots in the `references/` folder
- ✅ Translations
- ✅ New modules (e.g., `17-data-visualization.mdc`)
- ❌ Opinions without foundation
- ❌ Company-specific rules (keep it generic)

---

## 📊 Content by Module

| Module | Lines | Topics |
|---|---|---|
| 00 Core Principles | ~120 | 4 pillars, mobile rules, checklist |
| 01 UX Laws | ~250 | 12 laws with formulas and rules |
| 02 Gestalt | ~220 | 8 principles with examples |
| 03 Layout | ~200 | 8px grid, auto-layout, viewports |
| 04 Typography | ~200 | Type scale, weights, formatting |
| 05 Colors | ~200 | Palette, contrast, dark mode |
| 06 Buttons | ~200 | Hierarchy, circular, states |
| 07 Forms | ~250 | Inputs, validation, stepper |
| 08 Navigation | ~200 | Bottom nav, tabs, gestures |
| 09 Cards & Lists | ~220 | Cards, lists, skeleton |
| 10 Feedback | ~200 | Toasts, modals, success |
| 11 Motion | ~200 | Easing, durations, Smart Animate |
| 12 Micro-interactions | ~280 | Dan Saffer framework, 12 patterns |
| 13 Accessibility | ~200 | WCAG 2.2, contrast, focus |
| 14 Nielsen | ~220 | 10 heuristics with checklists |
| 15 Figma Execution | ~180 | API rules, correct code |
| 16 Anti-Patterns | ~220 | 17 documented errors |
| **Total** | **~3,560** | **17 modules** |

---

## 📝 License

MIT — Use, modify, distribute freely. Credit if you can.

---

## ⭐ If this repository helped you, leave a star!

Made with 💜 for designers and AIs that want to create better interfaces.
