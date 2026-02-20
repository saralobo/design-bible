---
name: layout-spacing
description: "Layout, spacing, grid system, margins, padding, breathing room. Use when building any screen structure, defining spacing between elements, or setting up page layout."
---

# Layout & Spacing — The Grid System and Breathing Room

> Spacing is the difference between "amateur" and "professional."
> Good spacing makes a design look expensive.

---

## THE 8px SYSTEM (The 8-Point Grid)

**Why 8px?** Divisible by 2 and 4, works at all screen densities (1x, 1.5x, 2x, 3x). It's the industry standard (Google, Apple, IBM).

### Spacing Scale:
| Token | Value | Typical Use |
|---|---|---|
| space-xxs | 2px | Fine adjustment (border → icon) |
| space-xs | 4px | Label → Input, icon → inline text |
| space-sm | 8px | Between items in the same group |
| space-md | 12px | Internal padding of chip/badge |
| space-base | 16px | Button horizontal padding, gap between inputs |
| space-lg | 24px | Card internal padding, screen side margins |
| space-xl | 32px | Between screen sections |
| space-2xl | 40px | Strong visual separation |
| space-3xl | 48px | Between large content blocks |
| space-4xl | 64px | Hero space, screen top padding |

### GOLDEN RULE:
> Space BETWEEN groups ≥ 2× space WITHIN a group

---

## SCREEN MARGINS

### Mobile (< 428px)
- **Side margins**: 16px (minimum) to 24px (comfortable)
- **Top margin**: 16px below the status bar / header
- **Bottom margin**: 16px above the bottom nav / home indicator

### Tablet (428px - 1024px)
- **Side margins**: 24-32px
- **Max content width**: 600px (centered) — don't spread content across the whole screen

### Desktop (> 1024px)
- **Max content width**: 1200px (centered)
- **Side margins**: Auto (centered content)

---

## AUTO-LAYOUT IN FIGMA — BEST PRACTICES

### Absolute Rules:
1. **EVERYTHING uses auto-layout** — No manually positioned elements (absolute) except overlays
2. **Screen frame**: Vertical auto-layout, top/bottom + horizontal padding
3. **Sections**: Vertical auto-layout, gap between sections = 24-32px
4. **Rows**: Horizontal auto-layout, gap between items = 8-16px
5. **Cards**: Vertical auto-layout, uniform padding (16-24px)

### Sizing Mode:
| Context | Horizontal | Vertical |
|---|---|---|
| Screen frame | Fixed (390/393px) | Hug contents |
| Container/Section | Fill container | Hug contents |
| Card | Fill container | Hug contents |
| Full-width button | Fill container | Fixed (48px) |
| Inline button | Hug contents | Fixed (48px) |
| Input | Fill container | Fixed (48-56px) |
| Text | Fill container | Hug contents |
| Icon | Fixed (24px) | Fixed (24px) |
| Avatar | Fixed (40-48px) | Fixed (40-48px) |
| Hero image | Fill container | Fixed (200-300px) |

### CRITICAL FILL RULE:
> `FILL` only works on direct children of auto-layout frames.
> NEVER try to set FILL before placing the element inside the auto-layout parent.

---

## STANDARD MOBILE SCREEN PROPORTIONS

### Common Viewports:
| Device | Width | Height |
|---|---|---|
| iPhone SE | 375px | 667px |
| iPhone 14 | 390px | 844px |
| iPhone 14 Pro Max | 393px | 852px |
| iPhone 15 Pro | 393px | 852px |
| Samsung Galaxy S24 | 360px | 780px |
| Pixel 8 | 412px | 915px |

### Default Design Viewport:
- **Use: 393 × 852px** (covers most modern devices)
- Test at 375px to ensure nothing breaks

---

## LAYOUT BREAKPOINTS

| Name | Min Width | Layout |
|---|---|---|
| Mobile S | 320px | 1 column, stacked |
| Mobile M | 375px | 1 column, stacked |
| Mobile L | 428px | 1 column, stacked |
| Tablet | 768px | 2 columns possible |
| Laptop | 1024px | 2-3 columns |
| Desktop | 1440px | Centered container, 3-4 columns |

---

## SAFE AREAS

### iOS:
- **Status bar**: 47px (Dynamic Island) / 44px (Notch) / 20px (no notch)
- **Home indicator**: 34px at the bottom
- **Navigation bar (header)**: 44px height

### Android:
- **Status bar**: 24dp
- **Navigation bar**: 48dp (gesture) / 48dp (3-button)

### RULE:
> NEVER place interactive elements in the safe area. Content can scroll behind the status bar, but buttons CANNOT.

---

## MOBILE LAYOUT PATTERNS

### 1. Full-Screen Stack (Most Common)
```
┌─────────────────┐
│    Status Bar    │ ← Safe area
├─────────────────┤
│     Header       │ ← Fixed, 44-56px
├─────────────────┤
│                  │
│   Scrollable     │ ← Flex/Fill
│   Content        │
│                  │
├─────────────────┤
│   Bottom CTA     │ ← Fixed, padding 16px
├─────────────────┤
│   Bottom Nav     │ ← Fixed, 56-83px
└─────────────────┘
```

### 2. Modal / Bottom Sheet
```
┌─────────────────┐
│                  │
│   Overlay 50%    │ ← Tap to dismiss
│                  │
├──────────────────┤ ← border-radius top 16-24px
│   Handle Bar     │ ← 40×4px, centered
│   Sheet Title    │
│   Sheet Content  │
│   Action Button  │
└─────────────────┘
```

### 3. Tab-Based Screen
```
┌─────────────────┐
│     Header       │
├─────────────────┤
│  Tab 1 │ Tab 2  │ ← Sticky, border-bottom
├─────────────────┤
│                  │
│   Tab Content    │ ← Scrollable
│                  │
├─────────────────┤
│   Bottom Nav     │
└─────────────────┘
```

---

## NAMING CONVENTION IN FIGMA

### Frames:
- Main screen: `Screen/ScreenName`
- Sections: `Section/SectionName`
- Rows: `Row/Description`
- Cards: `Card/Type`

### Components:
- `Button/Primary/Large`
- `Input/TextField/Default`
- `Icon/24/IconName`
- `Avatar/Size-48`

### Variants:
- `State=Default, Size=Large, HasIcon=True`

---

## LAYOUT CHECKLIST

- [ ] Do all frames use auto-layout?
- [ ] Are side margins consistent (16px or 24px)?
- [ ] Is the space between sections ≥ 2× the space between items?
- [ ] Is the viewport 393×852px?
- [ ] Do elements not invade safe areas?
- [ ] Does content have max-width on wide screens?
- [ ] Is FILL only on children of auto-layout?
- [ ] Are all frames named with a clear convention?
