---
name: gestalt
description: "Gestalt Principles (proximity, similarity, continuity, closure, figure-ground). Use when grouping elements, organizing visual hierarchy, or structuring layouts."
---

# Gestalt Principles — How the Brain Organizes Visual Information

> Gestalt psychology explains how the human brain groups and interprets visual elements.
> Mastering Gestalt = mastering layout. Each principle has direct application in UI design.

---

## 1. PROXIMITY

**Definition**: Elements that are close together are perceived as belonging to the same group.

**Why it matters**: This is the most violated principle in bad interfaces. When everything has the same spacing, nothing has a relationship.

### PRACTICAL RULES:
- **Space WITHIN a group**: 8-12px (related items)
- **Space BETWEEN groups**: 24-32px (different sections)
- **Ratio**: Space between groups ≥ 2× space within a group
- **Label + Input**: 4-8px gap (they are a group)
- **Input + Input**: 16-20px gap (items in the same group)
- **Section + Section**: 32-48px gap (different groups)
- **Card internal padding**: 16-24px (content belongs to the card)

### CORRECT EXAMPLE:
```
[Label]           ← 4px gap
[Input Field]     ← 16px gap
[Label]           ← 4px gap
[Input Field]     ← 32px gap ← SECTION SEPARATION
[Section Title]   ← 12px gap
[Content]
```

### ANTI-PATTERN:
```
[Label]           ← 16px gap
[Input Field]     ← 16px gap  ← WRONG: same spacing as label-to-input
[Label]           ← 16px gap
[Input Field]     ← 16px gap  ← Everything looks the same, no hierarchy
```

---

## 2. SIMILARITY

**Definition**: Elements that look similar (color, shape, size) are perceived as related.

**Why it matters**: Visual consistency = consistent meaning.

### PRACTICAL RULES:
- **All primary buttons**: Same color, same border-radius, same font weight
- **All links**: Same color (accent blue), same decoration (underline or not)
- **All cards**: Same border-radius, same shadow, same padding
- **Action icons**: Same size (24px), same stroke weight
- **Tags/Badges**: Same format among themselves, differentiated by color for categories
- **NEVER**: Use a rounded button in one place and a square button in another for the same action

### CONSISTENCY MAP:
| Element | Color | Border-Radius | Height | Font |
|---|---|---|---|---|
| Button Primary | Solid accent | 8-12px | 48px | SemiBold 16px |
| Button Secondary | Outlined accent | 8-12px | 48px | SemiBold 16px |
| Button Ghost | Transparent | 8-12px | 48px | SemiBold 16px |
| Card | White/Surface | 12-16px | Auto | - |
| Input | Outlined neutral | 8px | 48-56px | Regular 16px |

---

## 3. CONTINUITY

**Definition**: The eye naturally follows lines, curves, and patterns that flow continuously.

**Why it matters**: The user's gaze should be naturally guided through the screen.

### PRACTICAL RULES:
- **Align elements on clear axes**: A consistent left margin creates an invisible line
- **Cards in a list**: Same width, same margin — form a continuous visual column
- **Progress stepper**: Connect steps with a horizontal line
- **Dividers**: Use subtle separators (1px, 5-8% opacity color) to guide without interrupting
- **Horizontal scroll**: Show half of the next item to indicate more content
- **NEVER**: Break visual alignment without reason (one card 16px margin, another 24px)

### CAROUSEL TIP:
To indicate more content to the right, the last visible card should be clipped at ~30%. This creates visual continuity and invites scrolling.
```
|  [Card 1]  [Card 2]  [Card 3]  [Car... |
                                    ↑ clipped
```

---

## 4. CLOSURE

**Definition**: The brain completes incomplete shapes, "closing" gaps mentally.

**Why it matters**: You can suggest shapes and containers without drawing all borders.

### PRACTICAL RULES:
- **Cards without borders**: Background + padding already creates the perception of a container
- **Progress bar**: A partially filled bar suggests future completeness
- **Icons**: Outline icons with gaps are still recognizable (the brain fills in)
- **Icon/app grid**: The implicit grid is perceived even without lines
- **Tab indicators**: A line under the active tab suggests section separation
- **NEVER**: Use thick borders around EVERYTHING — trust spacing and background

---

## 5. FIGURE-GROUND

**Definition**: The brain automatically separates what is "figure" (focus) from what is "ground" (context).

**Why it matters**: Modals, overlays, and elevation hierarchy depend on this.

### PRACTICAL RULES:
- **Modal**: Darkened background (overlay 50-60% opacity black) — the modal is the "figure"
- **Bottom sheet**: Darkened background + sheet with shadow + border-radius on top
- **Dropdown/Popover**: Shadow to separate from background
- **Floating button (FAB)**: Pronounced shadow to "float" above content
- **Cards**: Light shadow OR different background to separate from screen background
- **Selected state**: Filled background to separate the active item from inactive ones
- **NEVER**: Create a modal without an overlay — the user won't know what's "front" and "back"

### ELEVATION LEVELS (with shadow):
| Level | Use | Shadow |
|---|---|---|
| 0 | Screen background | None |
| 1 | Cards, inputs | 0 1px 3px rgba(0,0,0,0.08) |
| 2 | Dropdowns, popovers | 0 4px 12px rgba(0,0,0,0.12) |
| 3 | Bottom sheets, modals | 0 8px 24px rgba(0,0,0,0.16) |
| 4 | FAB, floating elements | 0 12px 32px rgba(0,0,0,0.20) |

---

## 6. COMMON REGION

**Definition**: Elements within the same bounded area (border, background) are perceived as a group.

**Why it matters**: Cards, containers, and sections exist because of this principle.

### PRACTICAL RULES:
- **Card as container**: Group related information inside a card
- **Input group**: Place related fields inside a container with a subtle background
- **Alternating background sections**: Alternate background colors between sections (e.g., white → light gray → white)
- **Chip/Tag group**: Wrap tags in a container with padding
- **NEVER**: Place unrelated information inside the same card/container

---

## 7. SYMMETRY AND ORDER

**Definition**: The brain perceives symmetrical objects as belonging to the same group and as more stable.

**Why it matters**: Symmetrical layouts convey order, professionalism, and trust.

### PRACTICAL RULES:
- **Consistent padding**: If left padding is 24px, right padding is also 24px
- **Centered grid**: Content centered on the vertical axis of the screen
- **Grouped icons**: Same size, same weight, equal spacing between them
- **Bottom nav**: Items distributed equally across the width
- **Cards in a grid**: All the same size, equal gap between them
- **NEVER**: 24px padding on the left and 16px on the right (purposeless asymmetry)

---

## 8. COMMON FATE

**Definition**: Elements that move together in the same direction are perceived as a group.

**Why it matters**: Group animations and screen transitions.

### PRACTICAL RULES:
- **Scroll**: All items in a list scroll together
- **Parallax**: Elements on the same plane move at the same speed
- **Screen transition**: All elements on screen exit together (not individually)
- **Loading skeleton**: Shimmer moves in the same direction on all placeholders
- **Reorder**: When an item is dragged, others reorganize together
- **NEVER**: Animate elements of the same group in different directions without reason

---

## VISUAL SUMMARY — WHEN TO USE EACH PRINCIPLE

| Design Decision | Gestalt Principle |
|---|---|
| How much space between elements | Proximity |
| Consistent style across components | Similarity |
| User's eye direction | Continuity |
| Simplify containers/borders | Closure |
| Modal, overlay, elevation | Figure-Ground |
| Grouping with cards/containers | Common Region |
| Balanced layout and paddings | Symmetry |
| Group animations | Common Fate |
