---
name: micro-interactions
description: "Micro-interactions, hover effects, press feedback, scroll animations, prototype validation. Use when adding interactive details, prototyping flows, or polishing UI interactions."
---

# Micro-interactions — The Soul of the Interface

> Based on "Microinteractions" by Dan Saffer + Material Design Motion + Apple HIG.
> Micro-interactions are the small details that transform a functional interface
> into a memorable experience. They're the difference between "ok" and "wow."

---

## WHAT IS A MICRO-INTERACTION?

A micro-interaction is a contained moment of interaction around a single task.
Examples: Liking a post, toggling dark mode, pull to refresh, swipe to delete.

### The 4 Components (Dan Saffer Framework):

```
┌─────────────────────────────────────────────┐
│  1. TRIGGER                                 │
│     → What initiates the interaction        │
│     → Tap, swipe, scroll, hover, system     │
├─────────────────────────────────────────────┤
│  2. RULES                                   │
│     → What happens when activated           │
│     → Logic, limits, conditions             │
├─────────────────────────────────────────────┤
│  3. FEEDBACK                                │
│     → What the user sees/feels/hears        │
│     → Visual, haptic, audio                 │
├─────────────────────────────────────────────┤
│  4. LOOPS & MODES                           │
│     → What happens over time                │
│     → Repetition, expiration, adaptation    │
└─────────────────────────────────────────────┘
```

---

## CATALOG OF ESSENTIAL MICRO-INTERACTIONS

### 1. TOGGLE / SWITCH

**Trigger**: Tap on the switch
**Rules**: Toggles between ON/OFF. May have immediate consequence.
**Feedback**:
- Knob slides from one side to the other (150-200ms)
- Track color changes (neutral → accent/green)
- Knob scale from 1.0 → 1.1 → 1.0 during the slide
- Haptic: light impact (iOS) / light tick (Android)
**Loops**: State persists until next tap

**In Figma (Smart Animate)**:
```
Frame "Switch-OFF":
  Track: neutral-300, height 30px, width 52px, cornerRadius 15px
  Knob: white circle 26px, x=2, shadow level 1

Frame "Switch-ON":
  Track: accent/green, height 30px, width 52px, cornerRadius 15px
  Knob: white circle 26px, x=24, shadow level 1

Connect: ON_CLICK → SMART_ANIMATE, 200ms, ease-in-out
```

---

### 2. LIKE / FAVORITE (Heart)

**Trigger**: Tap (single) or Double-tap (Instagram style)
**Rules**: Toggle between liked/unliked. Increments/decrements counter.
**Feedback**:
- Icon: Scale 1.0 → 1.3 → 1.0 (bounce) + changes from outline to filled
- Color: neutral → red (#FF3B5C)
- Optional: Particle burst around it (micro confetti)
- Counter: Number increments with slide-up animation
- Haptic: medium impact
**Loops**: Persists, double-tap only activates (doesn't deactivate)

**Total duration**: 300-400ms

---

### 3. PULL TO REFRESH

**Trigger**: Pull down (scroll overscroll at the top)
**Rules**: Reload content if pulled > threshold (60-80px)
**Feedback**:
- Phase 1 (pulling): Spinner/icon rotates proportionally to the pull
- Phase 2 (threshold): Visual snap + haptic vibration + spinner keeps spinning
- Phase 3 (loading): Spinner spins freely, content below
- Phase 4 (complete): Spinner disappears, new content slides in
**Loops**: Can refresh infinitely

**Details**:
- Threshold: 60-80px of overscroll
- Spinner: 24px, accent color, linear rotation
- Resistance: Pull gets harder the more you pull (rubber band)
- Dismiss duration: 200ms ease-in

---

### 4. SWIPE TO DELETE / DISMISS

**Trigger**: Horizontal swipe on a list item
**Rules**: Reveal action when threshold is reached. Full swipe = execute.
**Feedback**:
- Phase 1 (swiping): Red background appears behind the item
- Delete icon grows as the swipe progresses
- Phase 2 (threshold 30%): Snap + vibration = action available
- Phase 3 (release): Item returns OR executes action
- Phase 4 (execute): Item collapses (height → 0) in 200ms, items below move up
**Loops**: Undo available via toast for 5 seconds

**In Figma**:
- Create 3 frames: Default → Swiped (revealing action) → Deleted (item collapsed)
- Use SMART_ANIMATE + ON_DRAG to simulate

---

### 5. BOTTOM SHEET (Drag)

**Trigger**: Swipe up or tap on handle bar
**Rules**: 3 snap positions: Closed, Half, Full. Velocity influences the snap.
**Feedback**:
- Sheet rises with spring animation (slight overshoot)
- Overlay darkens progressively (0% → 50%)
- Handle bar: 40×4px pill, neutral-400
- Snap points with haptic feedback
**Loops**: Can alternate between positions. Dismisses when pulled below minimum.

**Details**:
- Snap positions: 0% (closed), 50% (half), 95% (full)
- Spring: stiffness 300, damping 25
- Velocity threshold: If velocity > threshold, snap to next position

---

### 6. BUTTON PRESS

**Trigger**: Touch down on the button
**Rules**: Immediate feedback on touch, action on touch up (release)
**Feedback**:
- Touch down (immediate, < 50ms):
  - Scale: 1.0 → 0.97 (subtle shrink)
  - Opacity: 1.0 → 0.9
  - Ripple effect: Circle expanding from touch point (Material)
- Touch up:
  - Scale: 0.97 → 1.0 (returns)
  - Action is executed
- Loading state:
  - Text disappears, spinner appears (fade 150ms)
  - Button maintains EXACTLY the same size
**Loops**: Can press again after action completes

**CRITICAL RULE**:
> The button NEVER changes size during the animation.
> Width and height are FIXED. Only scale, opacity, and internal content change.

---

### 7. INPUT FOCUS

**Trigger**: Tap on the input field
**Rules**: Keyboard rises, field receives visual focus
**Feedback**:
- Border: neutral-300 → accent (2px), animation 150ms
- Floating label: Animates upward (translate-y -24px) and shrinks (14px → 12px)
- Label color: neutral-600 → accent
- Keyboard: Rises with spring animation
- Auto-scroll: Screen scrolls to keep field visible
**Loops**: Focus persists until tap outside or tab

---

### 8. CHECKBOX / RADIO

**Trigger**: Tap on the checkbox/radio
**Rules**: Toggle between checked/unchecked
**Feedback**:
- Checkbox:
  - Box: neutral-300 border → accent filled, 150ms
  - Check mark: Draw animation (SVG path) 200ms, ease-out
  - Scale: 1.0 → 0.9 → 1.05 → 1.0 (micro bounce)
- Radio:
  - Outer ring: neutral-300 → accent border
  - Inner dot: Scale 0 → 1.0 with spring, accent filled
  - Duration: 200ms
**Loops**: Toggle infinitely

---

### 9. SCROLL INDICATORS

**Trigger**: Content scroll
**Rules**: Indicate that there's more content
**Feedback**:
- Scrollbar: Appears during scroll, disappears 1.5s after stopping (fade out 300ms)
- Edge gradient: Shadow/fade on edges indicates more content
- "Peek": Last item partially visible indicates horizontal scroll
- Counter: "1 of 5" or dots for carousel
- Parallax: Background moves slower than foreground
**Loops**: Infinite while there's content

---

### 10. SKELETON → CONTENT (Content Reveal)

**Trigger**: Content finished loading
**Rules**: Replace skeleton with actual content
**Feedback**:
- Shimmer stops during loading
- Fade out skeleton: 150ms, ease-in
- Fade in content: 200ms, ease-out (stagger 30-50ms per item)
- Content enters with subtle slide up (8-12px) + fade
**Loops**: Once per load

**Desired feel**: Content "materializes" smoothly, doesn't "flash" onto the screen.

---

### 11. COUNTER / VALUE CHANGE

**Trigger**: Value changes (timer, price, quantity)
**Rules**: Animate the transition from old value to new
**Feedback**:
- Digits: Slide up/down individually (odometer style)
- Or: Fade out old value, fade in new value
- Color flash: If value increased = green flash. If decreased = red flash (200ms)
- Scale: Value pulses (1.0 → 1.05 → 1.0) on change
**Loops**: On every value change

**Duration**: 200-300ms per value transition

---

### 12. NOTIFICATION BADGE

**Trigger**: New notification arrives
**Rules**: Badge appears or increments
**Feedback**:
- First appearance: Scale 0 → 1.2 → 1.0 (bounce), 300ms
- Increment: Number slides up, badge pulses (scale 1.0 → 1.1 → 1.0)
- Color: Red (#FF3B30) with white text
- Haptic: Subtle notification feel
**Loops**: Persists until viewed. Badge disappears with fade out when read.

---

## MICRO-INTERACTIONS IN FIGMA (PROTOTYPING)

### How to implement:

**Method 1 — Smart Animate (most common)**:
1. Create Frame A (before state)
2. Duplicate to Frame B (after state)
3. Modify elements in Frame B (position, color, size, opacity)
4. Keep the SAME layer NAMES
5. Connect: A → B with SMART_ANIMATE

**Method 2 — Component Variants**:
1. Create component with variants (State=Default, State=Active)
2. Use SMART_ANIMATE between variants
3. Benefit: Reusable across the entire screen

**Method 3 — After Delay (Auto-play)**:
1. Frame Loading → Frame Content with AFTER_DELAY 2000ms
2. Transition SMART_ANIMATE or DISSOLVE
3. Use: Splash screen, loading → content reveal

### Default parameters for Figma prototyping:
```javascript
// Standard micro-interaction
{
  trigger: 'ON_CLICK',           // or ON_HOVER, ON_DRAG
  action: 'SMART_ANIMATE',      // or SLIDE_IN, DISSOLVE
  duration: 300,                 // ms
  easing: { type: 'EASE_IN_AND_OUT' }
}

// Hover effect (desktop)
{
  trigger: 'ON_HOVER',
  action: 'SMART_ANIMATE',
  duration: 150,
  easing: { type: 'EASE_OUT' }
}

// Auto-play (loading → content)
{
  trigger: 'AFTER_DELAY',
  delay: 2000,                   // ms wait
  action: 'SMART_ANIMATE',
  duration: 400,
  easing: { type: 'EASE_OUT' }
}
```

---

## HAPTIC FEEDBACK PRINCIPLES (For reference)

| Type | Intensity | Use |
|---|---|---|
| Light | Very subtle | Toggle, selection, scroll snap |
| Medium | Moderate | Confirmation, like, threshold |
| Heavy | Strong | Error, delete, impact |
| Selection | Tick | Picker, stepper |
| Success | Standard | Action completed |
| Warning | Standard | Attention needed |
| Error | Standard | Action failed |

### RULE:
> Haptic complements visual, NEVER replaces it.
> In Figma, we represent haptic with extra visual (shake for error, bounce for success).

---

## WHEN NOT TO USE MICRO-INTERACTIONS

- ❌ On ALL elements (animation fatigue)
- ❌ On very frequent actions (long list scroll — system lags)
- ❌ When the user is in a hurry (final checkout, emergency)
- ❌ Animations > 500ms on routine actions
- ❌ Bounces and springs in financial/medical apps (seriousness)
- ❌ Confetti/celebration for trivial actions

---

## THE "DELIGHTFUL BUT DISMISSIBLE" PRINCIPLE

> A micro-interaction should be pleasant the 1st time, invisible the 100th time.
> If the user starts noticing the animation as an obstacle → simplify.

### Mental test:
1. If the user does this action 50 times a day, does the animation IRRITATE?
2. If you remove the animation, does the user LOSE information?
3. Does the animation HELP understand what happened?

If the answers are YES, NO, NO → remove the animation.
If the answers are NO, YES, YES → keep it.

---

## DEFAULT PROTOTYPING PARAMETERS

### The Default Animation Curve

> **When the user does NOT specify an animation curve or duration,
> ALWAYS use Figma's GENTLE curve at 350ms as the default.**

This is the universal default for ALL prototyping in this Design Bible:

```javascript
// ✅ DEFAULT — Use this when user hasn't specified animation preferences
{
  transition: { type: 'SMART_ANIMATE', easing: { type: 'GENTLE' }, duration: 0.35 },
}
// GENTLE at 350ms — premium, smooth, professional feel
```

### When to ask the user:
> Before building a prototype, the AI SHOULD ask the user:
> "Do you have a preferred animation curve and duration, or should I use
> the default (Figma's Gentle curve at 350ms)?"
>
> If the user doesn't answer or says "use whatever is best" → use GENTLE 350ms.
> If the user specifies a curve → use EXACTLY what they asked.

### Why GENTLE 350ms?
- **GENTLE** is Figma's premium built-in easing — it feels elegant and smooth
- **350ms** is in the sweet spot: fast enough to not feel slow, slow enough to be perceived
- It works for BOTH micro-interactions and screen transitions
- It matches the Material Design 3 `duration-medium3` token

---

## FLOW TRANSITIONS — Screen Navigation Rules

### THE RULE:
> **All screen-to-screen transitions (CTA forward, Back button) MUST use
> SLIDE_IN with Figma's GENTLE curve at 350ms — unless the user
> explicitly requests a different transition.**

### Forward Navigation (CTA → Next Screen):
```javascript
// ✅ CORRECT — Advancing to the next screen via a CTA button
{
  trigger: { type: 'ON_CLICK' },
  actions: [{
    type: 'NODE',
    destinationId: 'NEXT_SCREEN_ID',
    navigation: 'NAVIGATE',
    transition: {
      type: 'SLIDE_IN',
      direction: 'LEFT',            // New screen slides in from the right
      easing: { type: 'GENTLE' },
      duration: 0.35                 // 350ms
    }
  }]
}
```

### Back Navigation (Back Button → Previous Screen):
```javascript
// ✅ CORRECT — Going back to the previous screen
{
  trigger: { type: 'ON_CLICK' },
  actions: [{
    type: 'NODE',
    destinationId: 'PREVIOUS_SCREEN_ID',
    navigation: 'NAVIGATE',
    transition: {
      type: 'SLIDE_IN',
      direction: 'RIGHT',           // Previous screen slides in from the left
      easing: { type: 'GENTLE' },
      duration: 0.35                 // 350ms
    }
  }]
}
```

### Modal / Bottom Sheet Transitions:
```javascript
// ✅ CORRECT — Opening a modal or bottom sheet
{
  trigger: { type: 'ON_CLICK' },
  actions: [{
    type: 'NODE',
    destinationId: 'MODAL_SCREEN_ID',
    navigation: 'OVERLAY',         // Overlay, not navigate
    transition: {
      type: 'SLIDE_IN',
      direction: 'BOTTOM',         // Slides up from bottom
      easing: { type: 'GENTLE' },
      duration: 0.35
    }
  }]
}
```

### Tab Switches / Same-Level Navigation:
```javascript
// ✅ CORRECT — Switching between tabs (no depth change)
{
  trigger: { type: 'ON_CLICK' },
  actions: [{
    type: 'NODE',
    destinationId: 'TAB_SCREEN_ID',
    navigation: 'NAVIGATE',
    transition: {
      type: 'DISSOLVE',             // Dissolve for lateral movement
      easing: { type: 'GENTLE' },
      duration: 0.25                 // Slightly faster for tabs
    }
  }]
}
```

### Transition Type Decision Table:

| Navigation Type | Transition | Direction | Duration | Easing |
|---|---|---|---|---|
| **CTA → Next screen** | SLIDE_IN | LEFT | 350ms | GENTLE |
| **Back → Previous screen** | SLIDE_IN | RIGHT | 350ms | GENTLE |
| **Open Modal/Bottom Sheet** | SLIDE_IN | BOTTOM | 350ms | GENTLE |
| **Close Modal/Bottom Sheet** | SLIDE_IN | BOTTOM (reverse) | 300ms | GENTLE |
| **Tab switch** | DISSOLVE | — | 250ms | GENTLE |
| **Success → auto-redirect** | DISSOLVE | — | 400ms | GENTLE |
| **Micro-interaction (same screen)** | SMART_ANIMATE | — | 300ms | GENTLE |

---

## PROTOTYPE VALIDATION PROTOCOL (Mandatory)

### THE RULE:
> **After building ANY prototype, the AI MUST test and validate the ENTIRE
> flow before presenting it to the user.** This means verifying every
> connection, every transition, and every interactive element.

### Step 1: Map All Interactive Elements
Before building, create a mental (or written) inventory of EVERY element
that should be interactive on EACH screen:

```
Screen: Home
  ├── Header back button → goes to: [previous screen]
  ├── Header action icon → goes to: [settings/more]
  ├── Quick action: Pay → goes to: [Pay screen]
  ├── Quick action: Transfer → goes to: [Transfer screen]
  ├── Quick action: Statement → goes to: [Statement screen]
  ├── Quick action: Settings → goes to: [Settings screen]
  ├── Transaction item 1 → goes to: [Transaction detail]
  ├── Transaction item 2 → goes to: [Transaction detail]
  ├── CTA "View All" → goes to: [Full transaction list]
  └── Bottom nav items → goes to: [respective screens]
```

### Step 2: Verify Forward Navigation (CRUD — Create/Read Paths)
For every CTA, button, and interactive element:
- [ ] Does it have a `setReactionsAsync` connection?
- [ ] Does it point to the CORRECT destination screen?
- [ ] Does it use the correct transition (SLIDE_IN LEFT for forward)?
- [ ] Does the transition use GENTLE 350ms?

### Step 3: Verify Back Navigation (Return Paths)
For every screen that the user can navigate TO:
- [ ] Is there a back button/gesture that returns to the previous screen?
- [ ] Does the back navigation use SLIDE_IN RIGHT?
- [ ] Is the back destination the CORRECT previous screen (not a random screen)?
- [ ] Can the user go back from EVERY screen they reached?

### Step 4: Verify Flow Completeness (Full CRUD)
For every user flow (e.g., "pay a bill", "view statement"):
```
FORWARD PATH:  Screen A → Screen B → Screen C → Success
RETURN PATH:   Success → Screen A (or auto-redirect)
CANCEL PATH:   Screen B → Screen A (back button mid-flow)
ERROR PATH:    Screen C → Error state → Retry or Back
```

- [ ] Can the user complete the FULL flow from start to finish?
- [ ] Can the user CANCEL at any point and return to the start?
- [ ] Is there a success/confirmation at the end?
- [ ] Does the success screen redirect back appropriately?

### Step 5: Verify Micro-Interaction Coverage
For each screen, check if ALL micro-interaction OPPORTUNITIES have been addressed:

```
BUTTON STATES:
  - [ ] Do buttons have hover/press states? (if applicable)
  - [ ] Do CTA buttons have loading states for async actions?

TOGGLE/SWITCH:
  - [ ] Do toggles animate between ON/OFF?

LISTS:
  - [ ] Do list items have tap feedback?
  - [ ] Is swipe-to-delete implemented (if applicable)?

INPUTS:
  - [ ] Do input fields have focus animations?
  - [ ] Do error states animate in?

TRANSITIONS:
  - [ ] Do modals/bottom sheets have open AND close animations?
  - [ ] Do screen transitions match the Transition Type Decision Table?

LOADING:
  - [ ] Are skeleton screens used during loading?
  - [ ] Does content fade in after skeleton?
```

### Step 6: End-to-End Test (The Walk-Through)
> **Simulate being a user.** Mentally walk through every possible path:

1. Start at the first screen (flow starting point)
2. Tap every interactive element — does it go somewhere?
3. On each new screen, tap the back button — does it return correctly?
4. Complete the main flow — does it reach success?
5. After success — can the user return to the beginning?
6. Try edge cases — what if the user taps something unexpected?

### Step 7: Report to User
After validation, present a summary:

```
✅ PROTOTYPE VALIDATION REPORT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Screens: 5
Connections: 12
Transitions: All using SLIDE_IN + GENTLE 350ms

Flow coverage:
  ✅ Forward: Home → Detail → Confirm → Success
  ✅ Back: Every screen has return navigation
  ✅ Cancel: Mid-flow back returns to Home
  ✅ Success: Auto-redirects to Home after 2s

Micro-interactions:
  ✅ Button press states
  ✅ Card tap feedback
  ✅ Modal open/close animation
  ⚠️ Missing: Swipe-to-delete on transaction list

Notes:
  - Swipe-to-delete was not implemented (not requested)
  - All transitions use GENTLE 350ms (default)
```

---

## MICRO-INTERACTIONS CHECKLIST

- [ ] Does the micro-interaction have a functional purpose (not just decoration)?
- [ ] Are all 4 components defined (trigger, rules, feedback, loops)?
- [ ] Is the duration < 400ms for frequent actions?
- [ ] Does visual feedback happen within < 100ms of the trigger?
- [ ] Does the animation not block the user's next action?
- [ ] Is the easing natural (not linear, not robotic)?
- [ ] Do buttons maintain fixed size during animation?
- [ ] Does Smart Animate have layers with matching names in both frames?
- [ ] Would the interaction be tolerable on the 100th repetition?
- [ ] Is there alternative feedback for accessibility (visual + text)?
- [ ] Is the default animation curve GENTLE at 350ms (if user didn't specify)?
- [ ] Do all flow transitions use SLIDE_IN (forward LEFT, back RIGHT)?
- [ ] Has the entire prototype been tested for forward AND back navigation?
- [ ] Have ALL buttons and interactive elements been checked for connections?
- [ ] Has a Prototype Validation Report been generated?
