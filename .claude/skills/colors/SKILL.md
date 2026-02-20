---
name: colors
description: "Color system, palettes, semantic colors, contrast, dark/light mode. Use when choosing colors, defining color tokens, setting backgrounds, or working with themes."
---

# Colors — Color System for Interfaces

> Colors communicate meaning, hierarchy, and emotion.
> A well-defined color system prevents "color soup" and ensures consistency.

---

## COLOR SYSTEM STRUCTURE

### 3 Layers:
1. **Primitives** — Full palette (blue-100, blue-200, ..., blue-900)
2. **Semantic** — Functional meaning (accent, positive, negative, warning)
3. **Component** — Specific usage (button-primary-bg, card-border, input-bg)

---

## REQUIRED SEMANTIC COLORS

Every project needs at minimum these colors:

| Token | Meaning | Use | Light Example | Dark Example |
|---|---|---|---|---|
| **accent** | Primary action, links, focus | CTA, links, active switch | #276EF1 | #5B8DEF |
| **positive** | Success, confirmation | Success toasts, check | #0E8345 | #34C759 |
| **warning** | Alert, attention | Warning banners | #F6BC2F | #FFD60A |
| **negative** | Error, danger, deletion | Validation, delete | #DE1135 | #FF453A |
| **neutral** | Text, borders, backgrounds | Body text, dividers | #1A1A1A | #E0E0E0 |

---

## NEUTRAL PALETTE (Gray Scale)

### Light Mode:
| Token | Hex | Use |
|---|---|---|
| neutral-900 | #1A1A1A | Primary text (headings) |
| neutral-800 | #333333 | Primary text (body) |
| neutral-600 | #666666 | Secondary text |
| neutral-400 | #999999 | Placeholder, disabled text |
| neutral-300 | #CCCCCC | Borders, dividers |
| neutral-200 | #E5E5E5 | Subtle borders |
| neutral-100 | #F0F0F0 | Surface/card background |
| neutral-50 | #F8F8F8 | Alternative background |
| white | #FFFFFF | Main background |

### Dark Mode:
| Token | Hex | Use |
|---|---|---|
| neutral-50 | #E0E0E0 | Primary text (DO NOT use pure #FFFFFF) |
| neutral-100 | #BDBDBD | Secondary text |
| neutral-200 | #9E9E9E | Placeholder, disabled text |
| neutral-300 | #757575 | Borders, dividers |
| neutral-600 | #424242 | Elevated surface |
| neutral-700 | #303030 | Surface/card |
| neutral-800 | #1E1E1E | Screen background |
| neutral-900 | #121212 | Darkest background |
| black | #000000 | ONLY for overlay/shadows |

---

## DARK MODE RULES

1. **NEVER use pure white (#FFFFFF) for text** — Use #E0E0E0 or #F0F0F0 (reduces vibration)
2. **NEVER use pure black (#000000) for background** — Use #121212 or #0D0D0D (Google recommendation)
3. **Accent colors become lighter** in dark mode (slightly desaturate)
4. **Elevation in dark mode** = lighter backgrounds (not shadows)
   - Surface level 0: #121212
   - Surface level 1: #1E1E1E
   - Surface level 2: #252525
   - Surface level 3: #2C2C2C
5. **Status colors** must be adjusted for contrast on dark backgrounds
6. **Overlay opacity**: 70-80% in dark mode (vs 50-60% light mode)

---

## CONTRAST RULES (WCAG 2.2)

### Minimum Ratios:
| Context | Minimum Ratio (AA) | Ideal Ratio (AAA) |
|---|---|---|
| Normal text (<18px) | 4.5:1 | 7:1 |
| Large text (≥18px bold or ≥24px) | 3:1 | 4.5:1 |
| UI components (borders, icons) | 3:1 | — |
| Graphics and data viz | 3:1 | — |
| Placeholder text | 3:1 (recommended) | — |

### FORBIDDEN COMBINATIONS:
- ❌ Light gray (#999) on white (#FFF) — ratio 2.85:1
- ❌ Yellow (#FFFF00) on white — ratio 1.07:1
- ❌ Light green (#90EE90) on white — ratio 1.84:1
- ❌ Light blue (#87CEEB) on white — ratio 2.53:1
- ❌ Pure white (#FFF) on pure black (#000) — causes visual vibration

### SAFE COMBINATIONS:
- ✅ #333333 on #FFFFFF — ratio 12.63:1
- ✅ #276EF1 on #FFFFFF — ratio 4.68:1
- ✅ #E0E0E0 on #121212 — ratio 13.5:1
- ✅ #FFFFFF on #276EF1 — ratio 4.68:1

---

## USING COLORS CORRECTLY

### Maximum Colors Per Screen:
- **1 accent color** (primary actions)
- **1 background color** (background)
- **1-2 neutral colors** (text, borders)
- **Status colors** only when needed (success/error/warning)

### Hierarchy with Color:
| Element | Color |
|---|---|
| Primary CTA | Solid accent (e.g., blue) |
| Secondary CTA | Outlined accent OR neutral |
| Tertiary CTA | Ghost/text (no background) |
| Primary text | Neutral-900 (light) / Neutral-50 (dark) |
| Secondary text | Neutral-600 (light) / Neutral-200 (dark) |
| Disabled text | Neutral-400 at 50% opacity |
| Screen background | White (light) / Neutral-900 (dark) |
| Card background | Neutral-50 (light) / Neutral-800 (dark) |
| Borders | Neutral-200 (light) / Neutral-600 (dark) |
| Dividers | Neutral-300 at 50% opacity |

---

## COLOR MEANINGS

### Universal Connotations:
| Color | Positive Meaning | Negative Meaning | UI Use |
|---|---|---|---|
| **Blue** | Trust, security, professional | Coldness | CTA, links, selection |
| **Green** | Success, growth, positive | — | Confirmation, profit |
| **Red** | Urgency, energy | Error, danger, deletion | Alerts, delete |
| **Yellow/Orange** | Attention, warmth | Caution | Warnings, badges |
| **Purple** | Premium, creative | — | Premium features |
| **Black/Dark** | Elegance, sophistication | Heaviness | Dark themes, luxury |

### RULE:
> NEVER use color as the ONLY indicator of meaning. Always combine with icon + text.
> Reason: 8% of men and 0.5% of women have color blindness.

---

## OPACITY FOR STATES

| State | Opacity on base color |
|---|---|
| Default | 100% |
| Hover | 90% or white overlay 8% |
| Pressed | 80% or black overlay 12% |
| Focused | 100% + 2px accent ring |
| Disabled | 40% opacity |
| Selected (background) | Accent at 8-12% opacity |

---

## GRADIENTS

### Gradient Rules:
- **Maximum 2 colors** per gradient
- **Direction**: 135° (diagonal top-left → bottom-right) or 180° (top → bottom)
- **Adjacent colors** on the spectrum (e.g., blue → purple, not blue → green)
- **Use sparingly** — maximum 1 gradient per screen
- **NEVER**: Gradient on body text. Only on hero backgrounds or special buttons

---

## COLOR CHECKLIST

- [ ] Maximum 1 accent color + neutrals + status colors?
- [ ] Text contrast ≥ 4.5:1 (AA)?
- [ ] Dark mode doesn't use pure white or pure black?
- [ ] Color is never the only meaning indicator?
- [ ] States (hover, pressed, disabled) have defined variations?
- [ ] Semantic colors (success, error, warning) are defined?
- [ ] Primary CTA has a UNIQUE color on screen (Von Restorff)?
