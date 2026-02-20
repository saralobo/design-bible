---
name: responsiveness
description: "Responsiveness, constraints, auto-layout sizing (FILL/HUG/FIXED), min/max dimensions, adaptive components. Use when building responsive screens, setting constraints, or making components adapt to different screen sizes."
---

# Responsiveness & Constraints — Adaptive Components and Screens

> A screen that only works at one exact size is not a screen — it's a picture.
> Every component, every section, every screen must adapt gracefully when the
> viewport width or height changes. This document defines how to achieve that
> using Figma's constraint system, auto-layout resizing, and min/max dimensions.

---

## THE TWO SYSTEMS: CONSTRAINTS vs AUTO-LAYOUT

Figma has two ways to make elements responsive:

| System | When to Use | How It Works |
|---|---|---|
| **Constraints** | Elements inside a frame WITHOUT auto-layout | Pin edges or scale relative to parent |
| **Auto-Layout Sizing** | Elements inside an auto-layout frame | FILL, HUG, or FIXED behavior |

### GOLDEN RULE:
> **Auto-layout is the PRIMARY tool for responsiveness.**
> Constraints are for overlays, absolute-positioned elements, or legacy frames.
> If you can use auto-layout, ALWAYS use auto-layout over constraints.

---

## PART 1: FIGMA CONSTRAINTS (Pin & Scale)

### What Are Constraints?
Constraints define how a child element behaves when its **parent frame is resized**.
They are set on the **horizontal** and **vertical** axes independently.

### Horizontal Constraints:

| Constraint | Behavior | Use Case |
|---|---|---|
| **Left** | Maintains distance from left edge | Default. Text, content aligned left |
| **Right** | Maintains distance from right edge | Action buttons, trailing icons |
| **Left & Right** | Stretches — maintains distance from BOTH edges | Full-width elements (search bars, dividers) |
| **Center** | Stays centered horizontally | Centered modals, centered icons |
| **Scale** | Scales proportionally with parent width | Images, decorative elements |

### Vertical Constraints:

| Constraint | Behavior | Use Case |
|---|---|---|
| **Top** | Maintains distance from top edge | Default. Headers, top content |
| **Bottom** | Maintains distance from bottom edge | Bottom nav, FAB, sticky CTA |
| **Top & Bottom** | Stretches — maintains distance from BOTH edges | Scrollable content area, middle fill |
| **Center** | Stays centered vertically | Centered modals, loading states |
| **Scale** | Scales proportionally with parent height | Decorative backgrounds |

### Visual Guide:
```
┌───────────────────────────────────┐  Parent Frame
│                                   │
│   ┌──────────┐  ← Left, Top      │  Pinned to top-left corner
│   │  Header  │                    │
│   └──────────┘                    │
│                                   │
│        ┌──────┐  ← Center, Center │  Stays centered in both axes
│        │ Modal│                    │
│        └──────┘                    │
│                                   │
│              ┌──────────┐         │
│              │  FAB     │  ← Right, Bottom  Pinned to bottom-right
│              └──────────┘         │
└───────────────────────────────────┘

When parent RESIZES:
- Header stays top-left ✓
- Modal stays centered ✓
- FAB stays bottom-right ✓
```

---

### CONSTRAINT MAP FOR COMMON ELEMENTS

| Element | Horizontal | Vertical | Why |
|---|---|---|---|
| **Status bar** | Left & Right | Top | Stretches full width, pinned to top |
| **Header/App bar** | Left & Right | Top | Stretches full width, pinned to top |
| **Bottom navigation** | Left & Right | Bottom | Stretches full width, pinned to bottom |
| **Bottom CTA bar** | Left & Right | Bottom | Stretches full width, pinned to bottom |
| **Content area** | Left & Right | Top & Bottom | Stretches both ways — fills remaining space |
| **FAB** | Right | Bottom | Fixed size, pinned to bottom-right |
| **Back button** | Left | Top | Pinned to top-left |
| **Action icons (header)** | Right | Top | Pinned to top-right |
| **Centered title** | Center | Top | Centered horizontally, pinned to top |
| **Modal overlay** | Left & Right | Top & Bottom | Covers entire parent |
| **Modal card** | Center | Center | Stays centered regardless of parent size |
| **Toast/Snackbar** | Left & Right | Bottom | Stretches width, pinned to bottom |
| **Background image** | Scale | Scale | Scales proportionally with parent |
| **Sidebar (tablet+)** | Left | Top & Bottom | Fixed width, stretches full height |

---

### CONSTRAINTS IN FIGMA API:

```javascript
// Setting constraints on a node (inside a non-auto-layout parent)
node.constraints = {
  horizontal: 'MIN',     // Left (MIN = left edge)
  vertical: 'MIN'        // Top (MIN = top edge)
};

// All valid values:
// horizontal: 'MIN' (Left), 'MAX' (Right), 'STRETCH' (Left & Right),
//             'CENTER', 'SCALE'
// vertical:   'MIN' (Top), 'MAX' (Bottom), 'STRETCH' (Top & Bottom),
//             'CENTER', 'SCALE'
```

### Constraint Values Reference:
| Figma UI | API Value | Meaning |
|---|---|---|
| Left | `MIN` | Pin to left / top |
| Right / Bottom | `MAX` | Pin to right / bottom |
| Left & Right / Top & Bottom | `STRETCH` | Pin to both edges (stretches) |
| Center | `CENTER` | Keep centered |
| Scale | `SCALE` | Scale proportionally |

```javascript
// ✅ CORRECT — Header pinned to top, stretches full width
header.constraints = { horizontal: 'STRETCH', vertical: 'MIN' };

// ✅ CORRECT — Bottom nav pinned to bottom, stretches full width
bottomNav.constraints = { horizontal: 'STRETCH', vertical: 'MAX' };

// ✅ CORRECT — Content area fills everything in between
content.constraints = { horizontal: 'STRETCH', vertical: 'STRETCH' };

// ✅ CORRECT — FAB pinned to bottom-right
fab.constraints = { horizontal: 'MAX', vertical: 'MAX' };

// ✅ CORRECT — Modal centered in both axes
modal.constraints = { horizontal: 'CENTER', vertical: 'CENTER' };
```

---

## PART 2: AUTO-LAYOUT RESIZING (The Modern Way)

### The Three Sizing Modes:

| Mode | Behavior | When to Use |
|---|---|---|
| **FIXED** | Element has an explicit pixel size that does NOT change | Icons, avatars, circular buttons, fixed-height buttons |
| **HUG** | Element shrinks to exactly fit its content | Inline buttons, tags, badges, text containers |
| **FILL** | Element expands to fill all available space in the parent | Cards, inputs, full-width buttons, content areas |

### CRITICAL UNDERSTANDING:
```
FIXED = "I am exactly this size, always"
HUG   = "I am as small as my content allows"
FILL  = "I am as large as my parent allows"
```

---

### SIZING DECISION TABLE — By Component Type

| Component | Horizontal | Vertical | Explanation |
|---|---|---|---|
| **Screen frame** | FIXED (393px) | FIXED (852px) | The viewport doesn't change |
| **Header** | FILL | HUG or FIXED (56px) | Stretches width, fixed or content height |
| **Content area** | FILL | FILL | Takes ALL remaining space |
| **Bottom nav** | FILL | FIXED (56-83px) | Stretches width, fixed height |
| **Bottom CTA bar** | FILL | HUG | Stretches width, wraps content+padding |
| **Section** | FILL | HUG | Stretches width, grows with content |
| **Card** | FILL | HUG | Stretches width, grows with content |
| **Card in grid (2-col)** | FILL (50%) | HUG | Each fills half the row |
| **Full-width button** | FILL | FIXED (48-56px) | Stretches width, fixed height |
| **Inline button** | HUG | FIXED (44-48px) | Wraps text, fixed height |
| **Text input** | FILL | FIXED (48-56px) | Stretches width, fixed height |
| **Text label** | FILL | HUG | Wraps within parent, grows with lines |
| **Single-line text** | HUG or FILL | HUG | Depends on context |
| **Icon** | FIXED (24px) | FIXED (24px) | Never changes size |
| **Avatar** | FIXED (40-48px) | FIXED (40-48px) | Never changes size |
| **Circular button** | FIXED | FIXED | MUST be fixed on both axes |
| **Badge** | HUG (min 20px) | FIXED (20px) | Grows with number, fixed height |
| **Chip/Tag** | HUG | FIXED (32px) | Grows with text, fixed height |
| **Divider** | FILL | FIXED (1px) | Stretches width, always 1px |
| **Image/Thumbnail** | FILL | FIXED (aspect) | Stretches width, maintains ratio |
| **Spacer** | FILL or FIXED | FIXED or FILL | Depends on axis |
| **Toast** | FILL | HUG | Stretches width, wraps content |

---

### THE SCREEN SKELETON — How a Responsive Screen is Built

```
Screen (FIXED 393 × 852)
├── Header (FILL × FIXED 56px)
│   ├── BackButton (FIXED 44 × FIXED 44)
│   ├── Title (FILL × HUG)                  ← Absorbs remaining width
│   └── ActionIcon (FIXED 44 × FIXED 44)
│
├── Content (FILL × FILL)                    ← THE KEY: fills remaining height
│   ├── Section/Balance (FILL × HUG)
│   │   ├── Label (FILL × HUG)
│   │   └── Value (FILL × HUG)
│   │
│   ├── Section/Actions (FILL × HUG)
│   │   ├── ActionButton (FIXED 52 × FIXED 52)  ← Circular = FIXED
│   │   ├── ActionButton (FIXED 52 × FIXED 52)
│   │   ├── ActionButton (FIXED 52 × FIXED 52)
│   │   └── ActionButton (FIXED 52 × FIXED 52)
│   │
│   ├── Section/Transactions (FILL × HUG)
│   │   ├── TransactionItem (FILL × HUG)
│   │   └── TransactionItem (FILL × HUG)
│   │
│   └── (vertical overflow scroll)
│
├── CTABar (FILL × HUG)
│   └── PrimaryButton (FILL × FIXED 48px)
│
└── BottomNav (FILL × FIXED 56px)
    ├── NavItem (FILL × HUG)                ← Each fills equal space
    ├── NavItem (FILL × HUG)
    ├── NavItem (FILL × HUG)
    └── NavItem (FILL × HUG)
```

### WHY CONTENT IS `FILL × FILL`:
> The Content area must use FILL on the vertical axis so it absorbs all
> remaining height between the Header and the Bottom Nav/CTA.
> This is what makes the screen work at different heights (667px, 844px, 852px, 915px).

---

### IMPLEMENTING THE SKELETON IN FIGMA API:

```javascript
// Screen
const screen = figma.createFrame();
screen.name = 'Screen/Home';
screen.resize(393, 852);
screen.layoutMode = 'VERTICAL';
screen.primaryAxisSizingMode = 'FIXED';    // Fixed height
screen.counterAxisSizingMode = 'FIXED';    // Fixed width
screen.fills = [{ type: 'SOLID', color: bg }];
screen.paddingTop = 0;
screen.paddingBottom = 0;
screen.paddingLeft = 0;
screen.paddingRight = 0;
screen.itemSpacing = 0;

// Header — FILL width, FIXED height
const header = figma.createFrame();
header.name = 'Section/Header';
header.layoutMode = 'HORIZONTAL';
header.counterAxisAlignItems = 'CENTER';
header.paddingLeft = 24;
header.paddingRight = 24;
screen.appendChild(header);
header.layoutSizingHorizontal = 'FILL';    // Stretch to screen width
header.resize(header.width, 56);           // Fixed 56px height
header.layoutSizingVertical = 'FIXED';     // STAY at 56px

// Content — FILL width, FILL height (takes remaining space)
const content = figma.createFrame();
content.name = 'Section/Content';
content.layoutMode = 'VERTICAL';
content.paddingLeft = 24;
content.paddingRight = 24;
content.paddingTop = 24;
content.paddingBottom = 24;
content.itemSpacing = 24;
screen.appendChild(content);
content.layoutSizingHorizontal = 'FILL';   // Stretch to screen width
content.layoutSizingVertical = 'FILL';     // ← THE KEY: absorb remaining height

// Bottom Nav — FILL width, FIXED height
const bottomNav = figma.createFrame();
bottomNav.name = 'Section/BottomNav';
bottomNav.layoutMode = 'HORIZONTAL';
bottomNav.resize(bottomNav.width, 56);
screen.appendChild(bottomNav);
bottomNav.layoutSizingHorizontal = 'FILL'; // Stretch to screen width
bottomNav.layoutSizingVertical = 'FIXED';  // STAY at 56px

// NOW: If you resize screen from 852px to 667px height,
// Header stays 56px, BottomNav stays 56px, Content SHRINKS.
// If you resize to 915px, Content GROWS. ✅
```

---

## PART 3: MIN & MAX DIMENSIONS

### What Are Min/Max Dimensions?
Figma supports minimum and maximum width/height on frames.
These prevent elements from becoming too small or too large when resized.

### When to Use:

| Property | Use Case | Example |
|---|---|---|
| **minWidth** | Prevent buttons/cards from collapsing | Button min 120px wide |
| **maxWidth** | Prevent text from stretching too wide | Text block max 600px |
| **minHeight** | Prevent sections from disappearing | Card min 80px tall |
| **maxHeight** | Limit expandable areas | Dropdown max 320px tall |

### Implementation:
```javascript
// ✅ Button that fills parent but never shrinks below 120px
button.layoutSizingHorizontal = 'FILL';
button.minWidth = 120;

// ✅ Text container that fills but doesn't exceed 600px (readability)
textContainer.layoutSizingHorizontal = 'FILL';
textContainer.maxWidth = 600;

// ✅ Card that hugs content but is at least 80px tall
card.layoutSizingVertical = 'HUG';
card.minHeight = 80;

// ✅ Dropdown that hugs content but caps at 320px with scroll
dropdown.layoutSizingVertical = 'HUG';
dropdown.maxHeight = 320;
dropdown.overflowDirection = 'VERTICAL';
dropdown.clipsContent = true;
```

### COMMON MIN/MAX VALUES:

| Component | minWidth | maxWidth | minHeight | maxHeight |
|---|---|---|---|---|
| Button (inline) | 80px | — | — | — |
| Button (full-width) | — | — | 44px | — |
| Input field | — | — | 44px | — |
| Card | — | 480px | 72px | — |
| Modal | 280px | 360px | — | 600px |
| Bottom sheet | — | — | 200px | 85% of screen |
| Text paragraph | — | 600px | — | — |
| Dropdown list | — | — | — | 320px |
| Search results | — | — | — | 400px |
| Badge | 20px | — | 20px | 20px |
| Chip/Tag | 48px | 200px | 32px | 32px |
| Sidebar (tablet) | 240px | 320px | — | — |

---

## PART 4: RESPONSIVE COMPONENT ARCHITECTURE

### How to Build a Truly Responsive Component

A responsive component adapts to THREE changes:
1. **Parent width changes** → Component stretches or wraps
2. **Content changes** → Component grows to fit
3. **Viewport changes** → Component reconfigures layout

### Pattern 1: Stretch & Squish (Most Common)
```
At 393px width:
┌────────────────────────────────────┐
│  Icon  │  Title and Description    │  ← Text fills remaining space
│  40px  │  FILL                     │
└────────────────────────────────────┘

At 320px width:
┌──────────────────────────────┐
│  Icon  │  Title and Descri... │     ← Text truncates
│  40px  │  FILL                │
└──────────────────────────────┘

At 428px width:
┌──────────────────────────────────────────┐
│  Icon  │  Title and Full Description     │  ← Text stretches
│  40px  │  FILL                           │
└──────────────────────────────────────────┘
```

**Implementation**: Icon = FIXED, Text = FILL. Text truncates at small sizes.

### Pattern 2: Stack & Reflow (Tablet/Desktop)
```
At mobile (393px):
┌─────────────────┐
│     Card A      │
├─────────────────┤
│     Card B      │
├─────────────────┤
│     Card C      │
└─────────────────┘

At tablet (768px):
┌─────────┬─────────┐
│ Card A  │ Card B  │
├─────────┼─────────┤
│ Card C  │         │
└─────────┴─────────┘
```

**Implementation**: Use Wrap in Figma auto-layout:
```javascript
const grid = figma.createFrame();
grid.layoutMode = 'HORIZONTAL';
grid.layoutWrap = 'WRAP';           // ← Enables wrapping
grid.itemSpacing = 16;              // Horizontal gap
grid.counterAxisSpacing = 16;       // Vertical gap (between wrapped rows)

// Each card fills proportional width
cardA.layoutSizingHorizontal = 'FILL';
cardA.minWidth = 280;               // ← Triggers wrap when too narrow
```

### Pattern 3: Fixed Anchors + Flexible Middle
```
┌─────────────────────────────────────┐
│  [←]    Screen Title        [⚙️]   │
│  FIXED   FILL              FIXED   │
└─────────────────────────────────────┘
```

**Implementation**: Left and right elements are FIXED, center element is FILL.
The center absorbs all width changes while edges stay constant.

```javascript
const header = figma.createFrame();
header.layoutMode = 'HORIZONTAL';
header.counterAxisAlignItems = 'CENTER';

const backBtn = createButton(44, 44);  // FIXED 44×44
header.appendChild(backBtn);

const title = figma.createText();
header.appendChild(title);
title.layoutSizingHorizontal = 'FILL'; // Absorbs remaining space

const settingsBtn = createButton(44, 44);  // FIXED 44×44
header.appendChild(settingsBtn);
```

### Pattern 4: Equal Distribution
```
┌─────────────────────────────────────┐
│  Home   Search   Cart   Profile     │
│  FILL    FILL    FILL    FILL       │
│  (25%)  (25%)   (25%)   (25%)      │
└─────────────────────────────────────┘
```

**Implementation**: All children FILL — auto-layout distributes equally.

```javascript
const nav = figma.createFrame();
nav.layoutMode = 'HORIZONTAL';

// All items FILL = equal distribution
navItem1.layoutSizingHorizontal = 'FILL';
navItem2.layoutSizingHorizontal = 'FILL';
navItem3.layoutSizingHorizontal = 'FILL';
navItem4.layoutSizingHorizontal = 'FILL';
// Each gets 25% of available width
```

---

## PART 5: ABSOLUTE POSITION WITHIN AUTO-LAYOUT

### What Is It?
Figma allows elements to be "absolutely positioned" within an auto-layout
frame. These elements float above the auto-layout flow and use constraints
instead of participating in the layout.

### When to Use:
- Badge on an avatar or icon
- Overlay indicator (online status dot)
- Floating action that overlaps content
- Notification count on a nav item

### Implementation:
```javascript
// Parent must be auto-layout
const card = figma.createFrame();
card.layoutMode = 'VERTICAL';

// Normal children participate in auto-layout
const content = figma.createText();
card.appendChild(content);
content.layoutSizingHorizontal = 'FILL';

// Absolute-positioned child floats above
const badge = figma.createFrame();
card.appendChild(badge);
badge.layoutPositioning = 'ABSOLUTE';  // ← Opts out of auto-layout flow

// Now use constraints to position the badge
badge.constraints = {
  horizontal: 'MAX',   // Pin to right edge
  vertical: 'MIN'      // Pin to top edge
};
badge.x = card.width - 8;   // Position near top-right
badge.y = -4;                // Slightly outside the parent
```

### RULE:
> Use absolute positioning SPARINGLY — only for overlapping decorations.
> Main content should ALWAYS use auto-layout flow.

---

## PART 6: RESPONSIVE TESTING PROTOCOL

### How to Verify Responsiveness:

**Step 1: Resize Width**
- Resize frame from 393px → 375px → 320px
- Check: Does any text get cut off? Do elements overlap? Do cards collapse?

**Step 2: Resize Height**
- Resize frame from 852px → 667px → 915px
- Check: Does the Content area shrink/grow? Are header/footer still visible?

**Step 3: Content Stress Test**
- Add very long text to titles/descriptions
- Add very short text (1-2 chars)
- Check: Do elements handle both extremes?

**Step 4: Device Frame Test**
Build the frame once, then verify at these sizes:

| Device | Width | Height | Check |
|---|---|---|---|
| iPhone SE | 375px | 667px | Smallest common device |
| iPhone 14 | 390px | 844px | Common device |
| iPhone 15 Pro Max | 393px | 852px | Design target |
| Samsung Galaxy S24 | 360px | 780px | Narrow Android |
| Pixel 8 | 412px | 915px | Tall Android |

---

## PART 7: SCROLL BEHAVIOR & CLIPPING

### When Content Exceeds the Frame:

```javascript
// ✅ Vertical scroll on content area
content.overflowDirection = 'VERTICAL';
content.clipsContent = true;

// ✅ Horizontal scroll on a carousel
carousel.overflowDirection = 'HORIZONTAL';
carousel.clipsContent = true;

// The inner content must be LARGER than the container for scroll to work:
// - For vertical scroll: children total height > container height
// - For horizontal scroll: children total width > container width
```

### Scroll Zones:

```
┌───────────────────────────────────┐
│  Header (FIXED, NO scroll)       │  ← Always visible
├───────────────────────────────────┤
│                                   │
│  Content (FILL, SCROLL vertical) │  ← Scrolls when overflows
│                                   │
│  ┌───────────────────────────┐    │
│  │ Carousel (SCROLL horiz.) │    │  ← Nested horizontal scroll
│  └───────────────────────────┘    │
│                                   │
├───────────────────────────────────┤
│  Bottom CTA (FIXED, NO scroll)   │  ← Always visible
├───────────────────────────────────┤
│  Bottom Nav (FIXED, NO scroll)   │  ← Always visible
└───────────────────────────────────┘
```

### RULE:
> Fixed elements (header, bottom nav, CTA bar) should NEVER scroll.
> Only the Content area scrolls.
> Set the screen frame's `primaryAxisSizingMode = 'FIXED'` to prevent
> it from growing with content — this forces the Content area to scroll.

---

## PART 8: COMMON RESPONSIVE MISTAKES

### RP-01: Screen with HUG Height Instead of FIXED
```
❌ WRONG:
screen.primaryAxisSizingMode = 'AUTO';  // HUG — screen grows with content
→ Screen becomes 2000px tall, no scroll, not a real viewport

✅ CORRECT:
screen.primaryAxisSizingMode = 'FIXED'; // Fixed 852px
screen.resize(393, 852);
→ Content area scrolls within the fixed viewport
```

### RP-02: Content Area with FIXED Height
```
❌ WRONG:
content.layoutSizingVertical = 'FIXED';
content.resize(content.width, 600);
→ Changes height? Content doesn't adapt, empty space or overflow

✅ CORRECT:
content.layoutSizingVertical = 'FILL';
→ Content area absorbs remaining height between header and footer
```

### RP-03: All Children FIXED Width
```
❌ WRONG:
card.resize(345, card.height);  // Fixed 345px
→ Resize parent to 375px? Card overflows. Resize to 320px? Doesn't fit.

✅ CORRECT:
card.layoutSizingHorizontal = 'FILL';
→ Card stretches and shrinks with the parent
```

### RP-04: Bottom Nav Not Pinned to Bottom
```
❌ WRONG:
Bottom nav inside the scrollable content area
→ Scrolls away when user scrolls down!

✅ CORRECT:
Bottom nav as a direct child of the screen frame
With FILL × FIXED sizing (stretches width, fixed height)
Positioned AFTER the Content area in the auto-layout order
→ Always visible at the bottom regardless of scroll
```

### RP-05: No Overflow/Scroll on Content
```
❌ WRONG:
Content area has no scroll. Screen is FIXED height.
→ Content beyond 852px is simply invisible/clipped

✅ CORRECT:
content.overflowDirection = 'VERTICAL';
content.clipsContent = true;
→ User can scroll to see all content
```

### RP-06: FILL on Non-Auto-Layout Child
```
❌ WRONG:
Parent has NO auto-layout
child.layoutSizingHorizontal = 'FILL';
→ Error or silently ignored

✅ CORRECT:
parent.layoutMode = 'VERTICAL';        // Enable auto-layout FIRST
parent.appendChild(child);              // Add child
child.layoutSizingHorizontal = 'FILL';  // THEN set FILL
```

### RP-07: Forgetting to Set layoutSizingVertical on Sections
```
❌ WRONG:
Section defaults to FIXED height after creation
→ Doesn't grow when content is added

✅ CORRECT:
section.layoutSizingVertical = 'HUG';
→ Section grows to wrap its content
```

### RP-08: Nav Items Not Equally Distributed
```
❌ WRONG:
Nav items all set to HUG
→ Items have different widths based on label length, off-center

✅ CORRECT:
All nav items set to FILL
→ Equal distribution regardless of label length
```

---

## PART 9: COMPONENT STRUCTURE DECISION TREE

Use this decision tree to determine the right sizing for any element:

```
Is the element a screen/viewport?
├── YES → FIXED width × FIXED height
│
└── NO → Is it a container that should stretch to fill its parent?
    ├── YES → Does it need to grow with content?
    │   ├── YES (height grows with content) → FILL width × HUG height
    │   └── NO (fixed height) → FILL width × FIXED height
    │
    └── NO → Is it a fixed-size element?
        ├── YES (icon, avatar, circular button) → FIXED × FIXED
        │
        └── NO → Should it wrap its content?
            ├── YES (inline button, chip, tag) → HUG width × FIXED height
            │
            └── SPECIAL: Does it need to absorb remaining space?
                └── YES (Content area, flexible spacer) → FILL × FILL
```

### Quick Cheat Sheet:
```
Screen        →  FIXED × FIXED   (the viewport)
Header        →  FILL  × FIXED   (stretch width, fixed height)
Content       →  FILL  × FILL    (stretch both, absorb remaining)
Footer/Nav    →  FILL  × FIXED   (stretch width, fixed height)
Card          →  FILL  × HUG     (stretch width, grow with content)
Button (CTA)  →  FILL  × FIXED   (stretch width, fixed height)
Button (inline)→ HUG   × FIXED   (wrap text, fixed height)
Icon          →  FIXED × FIXED   (never changes)
Text          →  FILL  × HUG     (stretch width, grow with lines)
Divider       →  FILL  × FIXED   (stretch width, 1px height)
```

---

## PART 10: RESPONSIVE LAYOUT IN FIGMA API — COMPLETE EXAMPLE

```javascript
// ✅ COMPLETE responsive screen setup
async function createResponsiveScreen() {
  await figma.loadFontAsync({ family: 'Inter', style: 'Regular' });
  await figma.loadFontAsync({ family: 'Inter', style: 'Semi Bold' });

  const hex = (h) => {
    h = h.replace('#', '');
    return {
      r: parseInt(h.substring(0,2),16)/255,
      g: parseInt(h.substring(2,4),16)/255,
      b: parseInt(h.substring(4,6),16)/255
    };
  };

  // === SCREEN (FIXED viewport) ===
  const screen = figma.createFrame();
  screen.name = 'Screen/Example';
  screen.resize(393, 852);
  screen.layoutMode = 'VERTICAL';
  screen.primaryAxisSizingMode = 'FIXED';
  screen.counterAxisSizingMode = 'FIXED';
  screen.itemSpacing = 0;
  screen.fills = [{ type: 'SOLID', color: hex('#0A0A0F') }];

  // === HEADER (FILL × FIXED) ===
  const header = figma.createFrame();
  header.name = 'Section/Header';
  header.fills = [];
  header.layoutMode = 'HORIZONTAL';
  header.counterAxisAlignItems = 'CENTER';
  header.paddingLeft = 24;
  header.paddingRight = 24;
  screen.appendChild(header);
  header.layoutSizingHorizontal = 'FILL';   // Stretch width
  header.resize(header.width, 56);
  header.layoutSizingVertical = 'FIXED';     // Stay 56px tall

  // Back button (FIXED × FIXED)
  const back = figma.createFrame();
  back.name = 'Button/Back';
  back.resize(44, 44);
  back.fills = [];
  back.layoutMode = 'HORIZONTAL';
  back.primaryAxisAlignItems = 'CENTER';
  back.counterAxisAlignItems = 'CENTER';
  back.primaryAxisSizingMode = 'FIXED';
  back.counterAxisSizingMode = 'FIXED';
  header.appendChild(back);

  // Title (FILL × HUG) — absorbs remaining width
  const title = figma.createText();
  title.name = 'Text/ScreenTitle';
  title.characters = 'Screen Title';
  title.fontSize = 18;
  title.fontName = { family: 'Inter', style: 'Semi Bold' };
  title.fills = [{ type: 'SOLID', color: hex('#F0F0F5') }];
  title.textAlignHorizontal = 'CENTER';
  header.appendChild(title);
  title.layoutSizingHorizontal = 'FILL';    // Absorbs remaining space

  // Action icon (FIXED × FIXED)
  const action = figma.createFrame();
  action.name = 'Button/Action';
  action.resize(44, 44);
  action.fills = [];
  action.layoutMode = 'HORIZONTAL';
  action.primaryAxisAlignItems = 'CENTER';
  action.counterAxisAlignItems = 'CENTER';
  action.primaryAxisSizingMode = 'FIXED';
  action.counterAxisSizingMode = 'FIXED';
  header.appendChild(action);

  // === CONTENT (FILL × FILL) — the responsive core ===
  const content = figma.createFrame();
  content.name = 'Section/Content';
  content.fills = [];
  content.layoutMode = 'VERTICAL';
  content.paddingLeft = 24;
  content.paddingRight = 24;
  content.paddingTop = 24;
  content.paddingBottom = 24;
  content.itemSpacing = 24;
  screen.appendChild(content);
  content.layoutSizingHorizontal = 'FILL';  // Stretch width
  content.layoutSizingVertical = 'FILL';    // ← ABSORBS remaining height
  content.overflowDirection = 'VERTICAL';    // Scroll when content overflows
  content.clipsContent = true;

  // Card inside content (FILL × HUG)
  const card = figma.createFrame();
  card.name = 'Card/Example';
  card.fills = [{ type: 'SOLID', color: hex('#14141A') }];
  card.cornerRadius = 16;
  card.layoutMode = 'VERTICAL';
  card.paddingTop = 20;
  card.paddingBottom = 20;
  card.paddingLeft = 20;
  card.paddingRight = 20;
  card.itemSpacing = 8;
  content.appendChild(card);
  card.layoutSizingHorizontal = 'FILL';     // Stretches with content area
  card.layoutSizingVertical = 'HUG';        // Grows with its content

  // === BOTTOM NAV (FILL × FIXED) ===
  const nav = figma.createFrame();
  nav.name = 'Section/BottomNav';
  nav.fills = [{ type: 'SOLID', color: hex('#14141A') }];
  nav.layoutMode = 'HORIZONTAL';
  nav.counterAxisAlignItems = 'CENTER';
  nav.paddingLeft = 16;
  nav.paddingRight = 16;
  nav.paddingTop = 8;
  nav.paddingBottom = 8;
  screen.appendChild(nav);
  nav.layoutSizingHorizontal = 'FILL';      // Stretch width
  nav.resize(nav.width, 56);
  nav.layoutSizingVertical = 'FIXED';        // Stay 56px tall

  // Nav items (FILL × HUG) — equal distribution
  for (const label of ['Home', 'Search', 'Cart', 'Profile']) {
    const item = figma.createFrame();
    item.name = `NavItem/${label}`;
    item.fills = [];
    item.layoutMode = 'VERTICAL';
    item.primaryAxisAlignItems = 'CENTER';
    item.counterAxisAlignItems = 'CENTER';
    item.itemSpacing = 4;
    nav.appendChild(item);
    item.layoutSizingHorizontal = 'FILL';   // Equal distribution
    item.layoutSizingVertical = 'HUG';
  }

  return screen;
}
```

---

## RESPONSIVENESS CHECKLIST

Before declaring any screen or component as done:

### Screen-Level:
- [ ] Screen frame is FIXED width × FIXED height?
- [ ] Header is FILL width × FIXED height (pinned to top)?
- [ ] Content area is FILL width × FILL height (absorbs remaining)?
- [ ] Bottom nav/CTA is FILL width × FIXED height (pinned to bottom)?
- [ ] Content area has `overflowDirection: 'VERTICAL'` for scroll?
- [ ] Screen works when resized from 852px height to 667px?

### Component-Level:
- [ ] Icons and avatars are FIXED × FIXED?
- [ ] Circular buttons are FIXED × FIXED on both axes?
- [ ] Cards are FILL width × HUG height?
- [ ] Full-width buttons are FILL width × FIXED height?
- [ ] Inline buttons are HUG width × FIXED height?
- [ ] Text elements are FILL width × HUG height?
- [ ] Dividers are FILL width × FIXED 1px height?

### Stress Tests:
- [ ] Resized to 320px width — nothing overflows or breaks?
- [ ] Resized to 428px width — nothing looks stretched or empty?
- [ ] Resized to 667px height — header + nav still visible?
- [ ] Resized to 915px height — no awkward empty space?
- [ ] Long text content — truncates or wraps correctly?
- [ ] Short text content — doesn't collapse to nothing?

### Auto-Layout Integrity:
- [ ] Every frame uses auto-layout (no manual positioning)?
- [ ] FILL is only set AFTER element is added to auto-layout parent?
- [ ] Nav items use FILL for equal distribution?
- [ ] Min/max dimensions set where appropriate?
- [ ] Absolute positioning only used for overlay decorations (badges)?
