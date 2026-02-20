# Anti-Patterns — What to NEVER Do

> This is the most important document for avoiding recurring mistakes.
> Every anti-pattern listed here is a REAL error that has actually been made.
> If you violate any rule in this document, STOP and fix it before continuing.

---

## VISUAL ANTI-PATTERNS (UI)

### AP-01: "Cylindrical" Button (The most severe error)
```
❌ WRONG:
┌────────────────────────┐
│         Icon            │  ← Auto-layout HUG with uneven padding
└────────────────────────┘    = Oval/cylindrical shape

✅ CORRECT:
    ┌───┐
    │ + │                     ← FIXED 56×56, cornerRadius 28
    └───┘
```
**Cause**: `primaryAxisSizingMode = 'AUTO'` or `layoutSizingHorizontal = 'HUG'` on a circular button.
**Fix**: FIXED width = FIXED height = desired size. cornerRadius = size/2.

---

### AP-02: Color Soup
```
❌ WRONG:
Button 1: Blue #276EF1
Button 2: Green #0E8345
Button 3: Purple #7B2FFF
Button 4: Orange #FF6B00
→ Screen looks like a meaningless rainbow

✅ CORRECT:
Primary CTA: Blue #276EF1 (ONLY element with this color)
Secondary CTA: Outlined (blue border, transparent background)
Tertiary CTA: Ghost (no border, blue text)
→ Clear hierarchy with one accent color
```
**Cause**: Using different colors for each button without hierarchy.
**Fix**: 1 accent color for ALL primary actions. Variations only by style (filled/outlined/ghost).

---

### AP-03: Inconsistent Padding
```
❌ WRONG:
Card 1: padding 24px
Card 2: padding 16px
Card 3: padding 12px top, 20px bottom
→ Looks misaligned and amateurish

✅ CORRECT:
All cards: padding 16px (uniform)
Or all: padding 24px (uniform)
→ Consistency = professionalism
```
**Cause**: Arbitrary values without following the 8px grid.
**Fix**: Choose 1 padding value and use it on ALL cards of the same type.

---

### AP-04: Mixed Border-Radius
```
❌ WRONG:
Card: cornerRadius 16px
Button: cornerRadius 8px
Input: cornerRadius 4px
Badge: cornerRadius 12px
→ 4 different values, inconsistent visual

✅ CORRECT:
Card: cornerRadius 12px
Button: cornerRadius 12px (or 8px if smaller)
Input: cornerRadius 8px
Badge: cornerRadius full (height/2)
→ Maximum 2 values + pill
```

---

### AP-05: Illegible Text
```
❌ WRONG:
- Gray text #CCCCCC on white background #FFFFFF (ratio 1.6:1)
- 10px text for body text
- Font-weight 300 (Light) at 14px
- Pure white text on pure black

✅ CORRECT:
- Text #333333 on #FFFFFF (ratio 12.63:1)
- Body text minimum 16px
- Font-weight 400+ for everything below 18px
- Text #E0E0E0 on #121212 (comfortable)
```

---

## UX ANTI-PATTERNS

### AP-06: Two Primary CTAs
```
❌ WRONG:
[ Send PIX ]    [ Cancel ]
  (blue filled)   (red filled)
→ User doesn't know which is the main action

✅ CORRECT:
   Cancel         [ Send PIX ]
  (ghost/text)     (blue filled)
→ 1 primary (filled), 1 secondary (ghost)
```
**Cause**: Giving the same visual weight to actions at different levels.
**Fix**: Only 1 filled button per screen. Others are outlined or ghost.

---

### AP-07: CTA at the Top (Mobile)
```
❌ WRONG:
┌──────────────────────────┐
│  [ Confirm Payment ]     │  ← CTA at top = hard to reach
│                          │
│  ... content ...         │
│                          │
│                          │
└──────────────────────────┘

✅ CORRECT:
┌──────────────────────────┐
│                          │
│  ... content ...         │
│                          │
│                          │
│  [ Confirm Payment ]     │  ← CTA at bottom = thumb zone
└──────────────────────────┘
```
**Cause**: Not considering the thumb zone on mobile.
**Fix**: Primary CTA always in the bottom half of the screen.

---

### AP-08: Generic Label
```
❌ WRONG:
[ OK ]
[ Yes ]
[ Confirm ]
[ Submit ]
[ Continue ]

✅ CORRECT:
[ Send PIX of $150.00 ]
[ Delete my account ]
[ Go to review ]
[ Save draft ]
[ Create new account ]
```
**Cause**: Laziness in writing descriptive labels.
**Fix**: Verb + noun. The label describes WHAT will happen.

---

### AP-09: No Loading Feedback
```
❌ WRONG:
User clicks "Send" → screen freezes for 3 seconds → result appears
→ User thinks it's bugged and clicks again

✅ CORRECT:
User clicks "Send" → button shows spinner → loading skeleton → result appears
→ User knows the system is processing
```
**Cause**: Not implementing loading states.
**Fix**: Visual feedback in < 100ms. Loading state if > 400ms.

---

### AP-10: Modal Without Exit
```
❌ WRONG:
┌──────────────────────────┐
│                          │
│  Modal content           │
│                          │
│  [ Confirm ]             │  ← No X, no overlay tap, no gesture
│                          │
└──────────────────────────┘

✅ CORRECT:
┌──────────────────────────┐
│  ×                       │  ← X to close
│                          │
│  Modal content           │
│                          │
│ [ Cancel ] [ Confirm ]   │  ← Two clear options
└──────────────────────────┘
+ Tap on overlay closes
+ Swipe down closes (bottom sheet)
```

---

### AP-11: Elements Floating on Canvas
```
❌ WRONG:
Creating loose components on the Figma canvas, without a parent

✅ CORRECT:
Create Section → Frame → Components inside
Everything organized and hierarchical
```

---

### AP-12: FILL on Element Outside Auto-Layout
```
❌ WRONG:
const child = figma.createFrame();
child.layoutSizingHorizontal = 'FILL';  // ERROR: parent has no auto-layout
parent.appendChild(child);

✅ CORRECT:
parent.layoutMode = 'VERTICAL';          // 1. Parent with auto-layout
parent.appendChild(child);               // 2. Add to parent
child.layoutSizingHorizontal = 'FILL';   // 3. THEN set FILL
```

---

### AP-13: Same Color for Everything
```
❌ WRONG:
Background: #1A1A1A
Card: #1A1A1A
Button: #1A1A1A
→ Everything blends together, no hierarchy

✅ CORRECT (Dark Mode):
Background: #121212
Card: #1E1E1E (lighter than background)
Button: #276EF1 (accent)
→ Clear elevation layers
```

---

### AP-14: Icon Without Label
```
❌ WRONG:
Bottom nav with 5 icons without text
→ New user doesn't know what each one does

✅ CORRECT:
Bottom nav with 5 icons + labels
Home   Search   Create   Alerts   Profile
```

---

### AP-15: Excessive Animation
```
❌ WRONG:
Everything bounces, everything shakes, everything pulses
Each element enters with 100ms stagger
800ms transitions for each screen
→ App feels slow and annoying

✅ CORRECT:
300ms transitions, gentle
Micro-interactions only where needed
No bounce in financial/professional apps
→ Elegant and functional
```

---

### AP-16: Ignoring Information Hierarchy
```
❌ WRONG:
Title: 16px Regular
Subtitle: 16px Regular
Body: 16px Regular
Caption: 16px Regular
→ Everything looks the same, no hierarchy

✅ CORRECT:
Title: 24px SemiBold
Subtitle: 18px SemiBold
Body: 16px Regular
Caption: 12px Regular, neutral-600
→ Clear hierarchy at a glance
```

---

### AP-17: Card with Too Much Information
```
❌ WRONG:
┌────────────────────────────────┐
│ Avatar │ User Full Name        │
│ User email                     │
│ User phone                     │
│ User full address              │
│ User ID number                 │
│ Date of birth                  │
│ Account status                 │
│ Last login: 02/14/2026         │
│ [ Edit ] [ Delete ] [ View ]   │
└────────────────────────────────┘

✅ CORRECT:
┌────────────────────────────────┐
│ Avatar │ John Smith            │
│        │ john@email.com        │
│                    [ View → ]  │
└────────────────────────────────┘
```

---

## SUMMARY — TOP 5 MOST COMMON ERRORS

| # | Error | Frequency | Severity |
|---|---|---|---|
| 1 | Circular button = oval (AP-01) | High | Catastrophic |
| 2 | Multiple primary CTAs (AP-06) | High | Major |
| 3 | Inconsistent colors (AP-02) | High | Major |
| 4 | CTA at top on mobile (AP-07) | Medium | Major |
| 5 | No loading feedback (AP-09) | Medium | Major |

---

## SELF-REVIEW CHECKLIST

Before declaring any screen as "done":

### Visual:
- [ ] Only 1 primary CTA (filled)?
- [ ] Are circular buttons ACTUALLY circular?
- [ ] Only 1 accent color on the screen?
- [ ] Consistent border-radius on all elements of the same type?
- [ ] Uniform padding on cards/containers?
- [ ] Clear typographic hierarchy (>= 3 different sizes)?

### Functional:
- [ ] CTA in the thumb zone (bottom half)?
- [ ] Button labels are descriptive (verb + noun)?
- [ ] All components have press feedback?
- [ ] Loading states defined for actions > 400ms?
- [ ] Modals have at least 2 ways to close?
- [ ] Back button on all sub-screens?

### Technical (Figma):
- [ ] Everything in auto-layout?
- [ ] No elements floating on canvas?
- [ ] FILL applied AFTER appendChild?
- [ ] Fonts loaded before use?
- [ ] Layers named with convention?
