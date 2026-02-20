---
name: motion-transitions
description: "Material Design 3 motion system, screen transitions, easing curves, animation durations. Use when prototyping, designing screen transitions, or adding motion to interfaces."
---

# Motion & Transitions — Material Design 3 Motion System

> Based on [Material Design 3 Motion](https://m3.material.io/styles/motion/overview/how-it-works).
> Motion is not decoration — it is COMMUNICATION. Every animation must answer:
> "What changed? Where did it come from? Where is it going?"
>
> This document integrates the complete M3 Motion specification with
> practical Figma prototyping implementation.

---

## PART 1: HOW MOTION WORKS (M3 Overview)

> Source: https://m3.material.io/styles/motion/overview/how-it-works

### The Purpose of Motion

Motion in Material Design 3 serves three functions:

```
1. INFORMATIVE — Motion shows spatial relationships
   "This detail screen CAME FROM that card"
   "This modal SLIDES UP from the bottom"
   "This element BELONGS TO that group"

2. FOCUSED — Motion guides attention
   "Look HERE — this just changed"
   "This button is RESPONDING to your touch"
   "The new content is ARRIVING from the right"

3. EXPRESSIVE — Motion adds personality
   "This app feels SMOOTH and premium"
   "This interaction feels NATURAL and physical"
   "This celebration makes me SMILE"
```

### The Three Qualities of Good Motion

| Quality | What It Means | Example |
|---|---|---|
| **Physical** | Objects behave as if they have mass and momentum | A bottom sheet decelerates as it reaches its snap point |
| **Intentional** | Motion has a clear purpose, never gratuitous | A card expanding to a detail view shows origin |
| **Consistent** | Same type of action = same type of motion | ALL forward navigations slide from right |

### THE CARDINAL RULE:
> **If you remove the animation and the user loses NO information about
> what changed or where things went → the animation is unnecessary.**
> Every animation must earn its existence.

---

## PART 2: EASING CURVES (M3 Specification)

> Source: https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration

### M3 defines TWO families of easing curves:

---

### FAMILY 1: EMPHASIZED (For Important Transitions)

Used for the PRIMARY motion on screen — the thing the user should notice.
These curves have a longer acceleration phase and feel more dramatic.

| Curve | CSS cubic-bezier | When to Use |
|---|---|---|
| **Emphasized** | `cubic-bezier(0.2, 0.0, 0, 1.0)` | Full transition (enter + exit combined) |
| **Emphasized Decelerate** | `cubic-bezier(0.05, 0.7, 0.1, 1.0)` | Elements ENTERING the screen |
| **Emphasized Accelerate** | `cubic-bezier(0.3, 0.0, 0.8, 0.15)` | Elements EXITING the screen |

```
Emphasized motion profile:

Speed ▲
      │    ╭──╮
      │   ╱    ╲
      │  ╱      ╲
      │ ╱        ╲
      │╱          ╲────────
      └───────────────────▶ Time
       Fast start    Long, smooth deceleration

This creates a "swift and decisive" feeling.
The element moves quickly at first, then settles slowly — like a real object.
```

#### Figma Mapping:
```javascript
// M3 Emphasized ≈ Figma GENTLE (closest built-in match)
// GENTLE has a similar swift-start, smooth-end profile
easing: { type: 'GENTLE' }

// For exact M3 curves, use CUSTOM_BEZIER:
easing: {
  type: 'CUSTOM_BEZIER',
  bezierParameters: { x1: 0.2, y1: 0, x2: 0, y2: 1.0 }
}

// M3 Emphasized Decelerate (entering elements):
easing: {
  type: 'CUSTOM_BEZIER',
  bezierParameters: { x1: 0.05, y1: 0.7, x2: 0.1, y2: 1.0 }
}

// M3 Emphasized Accelerate (exiting elements):
easing: {
  type: 'CUSTOM_BEZIER',
  bezierParameters: { x1: 0.3, y1: 0, x2: 0.8, y2: 0.15 }
}
```

---

### FAMILY 2: STANDARD (For Utility Transitions)

Used for SECONDARY, supporting, or utility motions — things that happen
alongside the main transition. These are subtler and faster.

| Curve | CSS cubic-bezier | When to Use |
|---|---|---|
| **Standard** | `cubic-bezier(0.2, 0.0, 0, 1.0)` | General-purpose utility motion |
| **Standard Decelerate** | `cubic-bezier(0, 0, 0, 1)` | Utility elements entering |
| **Standard Accelerate** | `cubic-bezier(0.3, 0, 1, 1)` | Utility elements exiting |

```
Standard motion profile:

Speed ▲
      │  ╭─╮
      │ ╱   ╲
      │╱     ╲────
      └───────────▶ Time
       Quick    Settle fast

This creates a "efficient and snappy" feeling.
Less dramatic than Emphasized, suitable for small UI changes.
```

#### Figma Mapping:
```javascript
// M3 Standard ≈ Figma EASE_IN_AND_OUT (closest built-in)
easing: { type: 'EASE_IN_AND_OUT' }

// M3 Standard Decelerate ≈ Figma EASE_OUT
easing: { type: 'EASE_OUT' }

// M3 Standard Accelerate ≈ Figma EASE_IN
easing: { type: 'EASE_IN' }
```

---

### EASING DECISION TABLE — Which Curve for What

| Action | M3 Curve | Figma Equivalent | Why |
|---|---|---|---|
| **Screen forward (push)** | Emphasized | GENTLE | Important, user-initiated navigation |
| **Screen back (pop)** | Emphasized | GENTLE | Important, returning to context |
| **Modal opening** | Emphasized Decelerate | EASE_OUT or GENTLE | Element entering with importance |
| **Modal closing** | Emphasized Accelerate | EASE_IN | Element exiting, less important |
| **Tab switch** | Standard | EASE_IN_AND_OUT | Utility — lateral, same level |
| **Tooltip appear** | Standard Decelerate | EASE_OUT | Small utility element entering |
| **Tooltip dismiss** | Standard Accelerate | EASE_IN | Small utility element exiting |
| **Toggle/Switch** | Standard | EASE_IN_AND_OUT | Small state change |
| **Button press** | Standard Decelerate | EASE_OUT | Immediate feedback |
| **Ripple effect** | Standard | EASE_IN_AND_OUT | Background utility motion |
| **Spinner/progress** | Linear | LINEAR | Continuous, no start/end |
| **Skeleton shimmer** | Linear | LINEAR | Continuous loading indication |
| **Success celebration** | Emphasized | GENTLE | Important, reward moment |
| **Error shake** | Standard | EASE_IN_AND_OUT | Quick, attention-grabbing |

### OUR DEFAULT:
> **When the user does NOT specify a curve → use Figma's GENTLE at 350ms.**
> GENTLE is the closest Figma built-in to M3's Emphasized curve.
> 350ms is M3's `duration-medium3` — the sweet spot for screen transitions.
>
> **ALWAYS ASK the user** before building a prototype:
> "Do you have a preferred animation curve, or should I use the default
> (Figma's Gentle curve at 350ms)?"

---

## PART 3: DURATION TOKENS (M3 Specification)

### The Complete M3 Duration Scale:

| Token | Duration | Category | Use Cases |
|---|---|---|---|
| `duration-short1` | **50ms** | Micro | Ripple start, press feedback |
| `duration-short2` | **100ms** | Micro | Hover state, focus ring |
| `duration-short3` | **150ms** | Small | Tooltip, color change, toggle |
| `duration-short4` | **200ms** | Small | Fade in/out, small slide, selection |
| `duration-medium1` | **250ms** | Medium | Small expansion, chip animation |
| `duration-medium2` | **300ms** | Medium | Standard transition, tab switch |
| `duration-medium3` | **350ms** | Medium | **⭐ DEFAULT — Screen transition** |
| `duration-medium4` | **400ms** | Medium | Complex transitions, multi-element |
| `duration-long1` | **450ms** | Large | Large element transitions |
| `duration-long2` | **500ms** | Large | Full-page transitions |
| `duration-long3` | **550ms** | Large | Route changes with shared elements |
| `duration-long4` | **600ms** | Large | Celebrations, complex animations |
| `duration-extra-long1` | **700ms** | XLarge | Success screens, confetti |
| `duration-extra-long2` | **800ms** | XLarge | Complex entrance sequences |
| `duration-extra-long3` | **900ms** | XLarge | Onboarding animations |
| `duration-extra-long4` | **1000ms** | XLarge | Full celebrations, brand moments |

### DURATION RULES:

```
RULE 1: SPEED MATCHES IMPORTANCE
  Tiny UI change (hover) → 100ms
  Normal transition (screen) → 300-350ms
  Important moment (success) → 500-700ms
  Brand moment (onboarding) → 800-1000ms

RULE 2: SPEED MATCHES SIZE
  Small element (toggle, chip) → 150-200ms
  Medium element (card, modal) → 300-400ms
  Large element (full screen) → 400-500ms
  Full-page with shared elements → 500-600ms

RULE 3: EXIT IS FASTER THAN ENTER
  Enter: 300ms
  Exit: 250ms (slightly faster — user doesn't need to "watch it leave")

RULE 4: THE 400ms CEILING
  If a routine transition takes > 400ms, the user perceives SLOWNESS.
  Only celebrations and brand moments should exceed 400ms.
```

### Duration by Component Type:

| Component | Enter Duration | Exit Duration | Easing |
|---|---|---|---|
| **Screen transition** | 350ms | 300ms | Emphasized (GENTLE) |
| **Modal / Dialog** | 350ms | 250ms | Emphasized Decelerate / Accelerate |
| **Bottom sheet** | 350ms | 300ms | Emphasized Decelerate / Accelerate |
| **Snackbar / Toast** | 250ms | 200ms | Standard Decelerate / Accelerate |
| **Tooltip** | 150ms | 100ms | Standard Decelerate / Accelerate |
| **FAB expand** | 300ms | 250ms | Emphasized |
| **Menu / Dropdown** | 200ms | 150ms | Standard Decelerate / Accelerate |
| **Card expand** | 350ms | 300ms | Emphasized |
| **Tab switch** | 250ms | 200ms | Standard |
| **Toggle / Switch** | 200ms | 200ms | Standard |
| **Checkbox / Radio** | 150ms | 150ms | Standard |
| **Button press** | 100ms | 150ms | Standard |
| **Ripple effect** | 200ms | 150ms | Standard |
| **Skeleton → Content** | 300ms | 150ms | Standard Decelerate |
| **Stagger per item** | +50ms | — | Standard Decelerate |

---

## PART 4: TRANSITION PATTERNS (M3 Specification)

> Source: https://m3.material.io/styles/motion/transitions/transition-patterns

Material Design 3 defines **4 transition patterns**. Each pattern solves
a different spatial relationship problem.

---

### PATTERN 1: CONTAINER TRANSFORM

**What it is**: An element's container smoothly transforms into another
element's container — they share a visual "vessel" that morphs.

**When to use**:
- Card → Detail page (the card BECOMES the page)
- FAB → Full screen (the FAB expands into a new screen)
- Search icon → Search field (the icon expands into the input)
- List item → Detail view

**How it feels**: The two states are ONE object transforming.
There is no "old screen goes away, new screen arrives."
Instead, it's a seamless metamorphosis.

```
CONTAINER TRANSFORM VISUAL:

State A (Card):                    State B (Detail):
┌────────────────┐                 ┌──────────────────────────┐
│  📷 Image      │                 │                          │
│  Title         │   ──────▶       │       📷 Large Image     │
│  Subtitle      │   MORPHS       │                          │
└────────────────┘                 │  Title (bigger)          │
                                   │  Full description...     │
                                   │  ...more content         │
                                   └──────────────────────────┘

The card's CORNERS expand, its CONTENT cross-fades,
and its SIZE grows to fill the destination.
```

**In Figma**:
```javascript
// Container Transform = SMART_ANIMATE in Figma
// REQUIRES: Same layer names in both frames
// The container frame must have the SAME NAME in both states
{
  trigger: { type: 'ON_CLICK' },
  actions: [{
    type: 'NODE',
    destinationId: 'DETAIL_SCREEN_ID',
    navigation: 'NAVIGATE',
    transition: {
      type: 'SMART_ANIMATE',        // ← Key: Smart Animate morphs matching layers
      easing: { type: 'GENTLE' },   // M3 Emphasized
      duration: 0.35                 // 350ms
    }
  }]
}

// CRITICAL: For this to work in Figma:
// 1. The card in Screen A and the header in Screen B must have the SAME layer name
// 2. The image in both must have the SAME layer name
// 3. Smart Animate will interpolate position, size, corner radius, and opacity
```

**Duration**: 300-500ms (depends on distance traveled)
**Easing**: Emphasized (GENTLE in Figma)

---

### PATTERN 2: SHARED AXIS

**What it is**: Elements transition along a shared spatial axis (X, Y, or Z).
One element exits in one direction, the other enters from the same direction.

**When to use**:
- **Shared X-axis**: Step 1 → Step 2 → Step 3 in a flow (horizontal progression)
- **Shared Y-axis**: Parent → Child relationship (vertical hierarchy)
- **Shared Z-axis**: Overlapping layers (front → back, e.g., card flip)

**How it feels**: Elements share a spatial pathway.
The user understands the DIRECTION of navigation.

```
SHARED X-AXIS (Horizontal — most common for flows):

Screen A                    Screen B
┌────────────┐              ┌────────────┐
│            │ ◀── exits    │            │ ◀── enters
│  Step 1    │    LEFT      │  Step 2    │    from RIGHT
│            │              │            │
└────────────┘              └────────────┘

SHARED Y-AXIS (Vertical — parent/child):

┌────────────┐
│  Parent    │ ◀── exits UP
└────────────┘
        ↓
┌────────────┐
│  Child     │ ◀── enters from BOTTOM
└────────────┘

SHARED Z-AXIS (Depth — overlapping content):

┌────────────┐
│  Back      │ ◀── scales DOWN + fades out
│  (behind)  │
└────────────┘
┌────────────┐
│  Front     │ ◀── scales UP + fades in
│  (on top)  │
└────────────┘
```

**In Figma**:
```javascript
// Shared X-Axis Forward (Step 1 → Step 2):
{
  trigger: { type: 'ON_CLICK' },
  actions: [{
    type: 'NODE',
    destinationId: 'STEP_2_SCREEN_ID',
    navigation: 'NAVIGATE',
    transition: {
      type: 'SLIDE_IN',             // ← Slide for shared axis
      direction: 'LEFT',            // New screen from right, old exits left
      easing: { type: 'GENTLE' },   // M3 Emphasized
      duration: 0.35
    }
  }]
}

// Shared X-Axis Back (Step 2 → Step 1):
{
  trigger: { type: 'ON_CLICK' },
  actions: [{
    type: 'NODE',
    destinationId: 'STEP_1_SCREEN_ID',
    navigation: 'NAVIGATE',
    transition: {
      type: 'SLIDE_IN',
      direction: 'RIGHT',           // Previous screen from left, current exits right
      easing: { type: 'GENTLE' },
      duration: 0.35
    }
  }]
}

// Shared Y-Axis (Parent → Child):
{
  trigger: { type: 'ON_CLICK' },
  actions: [{
    type: 'NODE',
    destinationId: 'CHILD_SCREEN_ID',
    navigation: 'NAVIGATE',
    transition: {
      type: 'SLIDE_IN',
      direction: 'BOTTOM',          // Child enters from bottom
      easing: { type: 'GENTLE' },
      duration: 0.35
    }
  }]
}
```

**Duration**: 300-350ms
**Easing**: Emphasized (GENTLE in Figma)

---

### PATTERN 3: FADE THROUGH

**What it is**: The outgoing element fades out COMPLETELY, then the incoming
element fades in. There is a brief moment where NEITHER is fully visible.

**When to use**:
- Bottom navigation tab switches (Home ↔ Search ↔ Profile)
- Content that has NO spatial relationship
- Replacing unrelated content in the same container
- Switching between sections that are "siblings" (same level, different content)

**How it feels**: Clean swap. No directional implication.
The user understands these are DIFFERENT things, not "the same thing moving."

```
FADE THROUGH VISUAL:

Phase 1 (Exit):
┌────────────┐
│            │    Content A fades out (opacity 1 → 0)
│  Content A │    + scales DOWN slightly (100% → 92%)
│            │    Duration: 90ms (fast exit)
└────────────┘

Phase 2 (Enter):
┌────────────┐
│            │    Content B fades in (opacity 0 → 1)
│  Content B │    + scales UP slightly (92% → 100%)
│            │    Duration: 210ms (slower enter)
└────────────┘

Total: ~300ms
The exit is FASTER than the enter (90ms vs 210ms)
```

**In Figma**:
```javascript
// Fade Through = DISSOLVE in Figma
{
  trigger: { type: 'ON_CLICK' },
  actions: [{
    type: 'NODE',
    destinationId: 'TAB_B_SCREEN_ID',
    navigation: 'NAVIGATE',
    transition: {
      type: 'DISSOLVE',             // ← Dissolve = Fade Through
      easing: { type: 'GENTLE' },   // M3 Standard
      duration: 0.3                  // 300ms (slightly faster than screen transitions)
    }
  }]
}
```

**Duration**: 300ms total (90ms exit + 210ms enter)
**Easing**: Standard (EASE_IN_AND_OUT or GENTLE in Figma)

---

### PATTERN 4: FADE

**What it is**: A simple fade in or fade out. For elements that
appear or disappear WITHOUT replacing another element.

**When to use**:
- Dialog/Modal appearing over content
- Tooltip showing/hiding
- Snackbar/Toast appearing
- Overlay darkening/lightening
- FAB appearing when scrolling up

**How it feels**: Simple, subtle. The element materializes or dematerializes.

```
FADE IN:
  Opacity: 0 → 1
  Optional: slight scale 95% → 100% (adds depth)
  Duration: 150-250ms
  Easing: Standard Decelerate (EASE_OUT)

FADE OUT:
  Opacity: 1 → 0
  Optional: slight scale 100% → 95%
  Duration: 100-200ms (faster than fade in)
  Easing: Standard Accelerate (EASE_IN)
```

**In Figma**:
```javascript
// Fade (for overlays, dialogs)
// Best done with SMART_ANIMATE where the overlay opacity changes
{
  trigger: { type: 'ON_CLICK' },
  actions: [{
    type: 'NODE',
    destinationId: 'MODAL_SCREEN_ID',
    navigation: 'OVERLAY',          // ← Overlay, not Navigate
    transition: {
      type: 'DISSOLVE',             // ← Simple fade
      easing: { type: 'EASE_OUT' }, // Decelerate for entering
      duration: 0.25                 // 250ms
    }
  }]
}
```

---

### TRANSITION PATTERN DECISION TABLE

| Relationship | Pattern | Figma Transition | Example |
|---|---|---|---|
| **Card → Detail** | Container Transform | SMART_ANIMATE | Product card → product page |
| **Step → Next Step** | Shared X-Axis | SLIDE_IN LEFT | Onboarding step 1 → 2 |
| **Back ← Previous** | Shared X-Axis (reverse) | SLIDE_IN RIGHT | Detail → back to list |
| **CTA → Next Screen** | Shared X-Axis | SLIDE_IN LEFT | "Continue" → next screen |
| **Back Button** | Shared X-Axis (reverse) | SLIDE_IN RIGHT | ← back to previous |
| **Tab A ↔ Tab B** | Fade Through | DISSOLVE | Bottom nav switching |
| **Open Modal** | Fade + Shared Y-Axis | SLIDE_IN BOTTOM | Tap button → modal appears |
| **Close Modal** | Fade + Shared Y-Axis | SLIDE_IN BOTTOM (reverse) | Dismiss modal |
| **Open Bottom Sheet** | Shared Y-Axis | SLIDE_IN BOTTOM | Sheet rises from bottom |
| **Show Dialog** | Fade | DISSOLVE | Alert dialog appears |
| **Show Tooltip** | Fade | DISSOLVE | Hover → tooltip |
| **Show Snackbar** | Fade + Slide | SMART_ANIMATE | Snackbar slides up + fades |
| **FAB → Expanded** | Container Transform | SMART_ANIMATE | FAB grows into sheet |
| **Search icon → Bar** | Container Transform | SMART_ANIMATE | Icon expands into field |
| **Success → Redirect** | Fade Through | DISSOLVE | Success auto-redirects |

---

## PART 5: MOTION HIERARCHY (Stagger & Sequence)

### Stagger Pattern (Sequential Entrance):

When multiple elements enter a screen, they should appear in sequence
with a slight delay between each. This creates a sense of hierarchy
and guides the eye from top to bottom.

```
Header:     [====]           ← 0ms delay
Hero:        [====]          ← 50ms delay
Section 1:    [====]         ← 100ms delay
Section 2:     [====]        ← 150ms delay
CTA:            [====]       ← 200ms delay
```

### Stagger Parameters:
| Parameter | Value | Notes |
|---|---|---|
| **Delay between items** | 30-50ms | Subtle but perceivable |
| **Individual animation** | 200-300ms | Each element's enter duration |
| **Max total stagger** | 400ms | After 400ms total, add remaining simultaneously |
| **Max staggered items** | 5-6 | More than 6 → bring them all at once |
| **Each element easing** | Standard Decelerate | EASE_OUT in Figma |
| **Each element motion** | Fade in + slide up 8-12px | Subtle upward reveal |

### RULE:
> Stagger creates visual rhythm. But if the total sequence takes > 400ms,
> the user feels the UI is SLOW. Keep it tight.

---

## PART 6: SMART ANIMATE IN FIGMA

### When to Use Smart Animate:
- Container Transform transitions (card → detail)
- Micro-interactions within the same screen (toggle, expand)
- Any transition where individual elements need to morph smoothly
- Complex multi-element transitions

### Requirements for Smart Animate:
1. **SAME LAYER NAMES**: Layers with matching names in both frames are animated
2. **Animatable properties**: x, y, width, height, rotation, opacity, fills, cornerRadius
3. **Non-animatable**: text content, effects (need workarounds)
4. **Layer order matters**: Keep layers in the same order for predictable results

### Smart Animate Setup:
```javascript
// Step 1: Create Frame A (before state)
// Step 2: Duplicate to Frame B (after state)
// Step 3: Modify elements in Frame B (position, color, size, opacity)
// Step 4: KEEP THE SAME LAYER NAMES
// Step 5: Connect A → B with SMART_ANIMATE

// In code (setReactionsAsync):
await frameA.setReactionsAsync([{
  trigger: { type: 'ON_CLICK' },
  actions: [{
    type: 'NODE',
    destinationId: frameB.id,
    navigation: 'NAVIGATE',
    transition: {
      type: 'SMART_ANIMATE',
      easing: { type: 'GENTLE' },
      duration: 0.35
    }
  }]
}]);
```

### Smart Animate Tips:
- **For morphing shapes**: Same name, different size/position/cornerRadius
- **For appearing elements**: Set opacity 0 in Frame A, opacity 1 in Frame B
- **For color transitions**: Same fill type, different color values
- **For sliding content**: Same name, different x/y position

---

## PART 7: SPRING PHYSICS (Advanced)

### When to Use Springs:
- Bottom sheet dragging (natural settle)
- Pull to refresh (rubber band)
- Playful apps (social media, games)
- Bouncy confirmations

### Spring Parameters:
```javascript
// In Figma:
easing: {
  type: 'CUSTOM_SPRING',
  stiffness: 300,      // How tight the spring is (higher = snappier)
  damping: 25           // How quickly it settles (higher = less bounce)
}

// Common presets:
// Snappy (no bounce):   stiffness: 400, damping: 35
// Gentle (slight):      stiffness: 300, damping: 25
// Bouncy (playful):     stiffness: 200, damping: 15
// Rubber band (drag):   stiffness: 500, damping: 30
```

### RULE:
> Springs are for PLAYFUL or PHYSICAL apps. For serious/professional apps
> (finance, medical, enterprise), use standard easing curves instead.

---

## PART 8: M3 → FIGMA COMPLETE MAPPING TABLE

### Easing Curves:

| M3 Token | CSS cubic-bezier | Figma Built-in | Figma Custom |
|---|---|---|---|
| **emphasized** | `(0.2, 0, 0, 1.0)` | `GENTLE` ⭐ | `CUSTOM_BEZIER(0.2, 0, 0, 1.0)` |
| **emphasized-decelerate** | `(0.05, 0.7, 0.1, 1.0)` | `EASE_OUT` (approx) | `CUSTOM_BEZIER(0.05, 0.7, 0.1, 1.0)` |
| **emphasized-accelerate** | `(0.3, 0, 0.8, 0.15)` | `EASE_IN` (approx) | `CUSTOM_BEZIER(0.3, 0, 0.8, 0.15)` |
| **standard** | `(0.2, 0, 0, 1.0)` | `EASE_IN_AND_OUT` | `CUSTOM_BEZIER(0.2, 0, 0, 1.0)` |
| **standard-decelerate** | `(0, 0, 0, 1)` | `EASE_OUT` | `CUSTOM_BEZIER(0, 0, 0, 1)` |
| **standard-accelerate** | `(0.3, 0, 1, 1)` | `EASE_IN` | `CUSTOM_BEZIER(0.3, 0, 1, 1)` |
| **linear** | `(0, 0, 1, 1)` | `LINEAR` | — |

### Transition Types:

| M3 Pattern | Figma Transition | Figma Navigation |
|---|---|---|
| **Container Transform** | `SMART_ANIMATE` | `NAVIGATE` |
| **Shared X-Axis (forward)** | `SLIDE_IN` direction `LEFT` | `NAVIGATE` |
| **Shared X-Axis (back)** | `SLIDE_IN` direction `RIGHT` | `NAVIGATE` |
| **Shared Y-Axis (down)** | `SLIDE_IN` direction `BOTTOM` | `NAVIGATE` or `OVERLAY` |
| **Shared Y-Axis (up)** | `SLIDE_IN` direction `TOP` | `NAVIGATE` |
| **Fade Through** | `DISSOLVE` | `NAVIGATE` |
| **Fade** | `DISSOLVE` | `OVERLAY` |

---

## PART 9: DEFAULT FLOW TRANSITIONS

### THE RULE:
> **All screen-to-screen flow transitions use SLIDE_IN + GENTLE 350ms by default.**
> This maps to M3's Shared X-Axis pattern with Emphasized easing.

| Navigation Type | Transition | Direction | Duration | Easing |
|---|---|---|---|---|
| **CTA → Next screen** | SLIDE_IN | LEFT | 350ms | GENTLE |
| **Back → Previous screen** | SLIDE_IN | RIGHT | 350ms | GENTLE |
| **Open Modal/Bottom Sheet** | SLIDE_IN | BOTTOM | 350ms | GENTLE |
| **Close Modal/Bottom Sheet** | SLIDE_IN | BOTTOM (rev) | 300ms | GENTLE |
| **Tab switch** | DISSOLVE | — | 300ms | GENTLE |
| **Success → auto-redirect** | DISSOLVE | — | 400ms | GENTLE |
| **Micro-interaction (same screen)** | SMART_ANIMATE | — | 300ms | GENTLE |

---

## MOTION ANTI-PATTERNS

| ❌ Wrong | ✅ Correct | M3 Principle Violated |
|---|---|---|
| Animation > 700ms for routine transition | 300-350ms for most | Duration rules |
| Bounce/overshoot in financial app | Gentle/emphasized for professional apps | Expressiveness context |
| Elements entering from random directions | Consistent direction per pattern | Shared Axis coherence |
| Linear easing for everything | Appropriate easing by motion type | Easing families |
| Loading animation blocking interaction | Non-blocking loading (skeleton) | Focused principle |
| Animation everywhere without purpose | Animation only where it communicates | Informative principle |
| Using DISSOLVE for forward navigation | SLIDE_IN for forward (Shared Axis) | Transition pattern matching |
| Same duration for enter and exit | Exit slightly faster than enter | Duration rule 3 |
| No motion at all (everything instant) | Subtle motion for context | Informative principle |

---

## MOTION CHECKLIST

Before finalizing any prototype:

### Easing & Duration:
- [ ] Is the default easing GENTLE (M3 Emphasized) for screen transitions?
- [ ] Is the default duration 350ms for screen transitions?
- [ ] Are enter durations ≥ exit durations?
- [ ] Are utility motions (tooltips, toggles) faster (150-200ms)?
- [ ] Does NO routine transition exceed 400ms?

### Transition Patterns:
- [ ] Do forward navigations use SLIDE_IN LEFT (Shared X-Axis)?
- [ ] Do back navigations use SLIDE_IN RIGHT (Shared X-Axis)?
- [ ] Do tab switches use DISSOLVE (Fade Through)?
- [ ] Do modals/bottom sheets use SLIDE_IN BOTTOM (Shared Y-Axis)?
- [ ] Do card → detail transitions use SMART_ANIMATE (Container Transform)?

### Consistency:
- [ ] Is the SAME transition used for ALL forward navigations?
- [ ] Is the SAME transition used for ALL back navigations?
- [ ] Is the SAME easing used consistently throughout the app?
- [ ] Does the motion tell the user WHERE things came from?

### Quality:
- [ ] Does each animation have a clear PURPOSE (informative, focused, or expressive)?
- [ ] Are Smart Animate layers named identically in both frames?
- [ ] Is stagger total ≤ 400ms?
- [ ] Are loading animations non-blocking?
- [ ] Would the animations be tolerable on the 100th use?

### References:
- [M3 Motion Overview](https://m3.material.io/styles/motion/overview/how-it-works)
- [M3 Easing & Duration](https://m3.material.io/styles/motion/easing-and-duration/applying-easing-and-duration)
- [M3 Transition Patterns](https://m3.material.io/styles/motion/transitions/transition-patterns)
