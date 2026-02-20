# Rule 20 — Design Judgment: Spirit Over Letter

> **This is the most important rule in the entire Design Bible.**
>
> Following rules mechanically without design taste makes screens WORSE,
> not better. Rules are guidelines — JUDGMENT is what makes design good.
> This document captures hard-won lessons from real failures.

---

## THE CARDINAL RULE

```
Rules exist to GUIDE judgment, not REPLACE it.

If following a rule makes the screen uglier, the rule is being
applied wrong — not the screen.
```

---

## LESSON 1: COLOR RESTRAINT MEANS RESTRAINT

### The Rule:
**On any given screen, count the distinct non-neutral colors. If you have more
than 2 (the accent + one status indicator), you have too many.** The premium
apps (Nubank, Cash App, Linear) use essentially 1 color + grays.

```
WRONG: Netflix icon in red because "Netflix brand is red"
RIGHT: All merchant icons in the same neutral surface color

WRONG: "Available $2,152.50" in green because "available = positive"
RIGHT: All financial metadata in neutral gray — the NUMBER speaks for itself

WRONG: Multiple accent colors on one screen
RIGHT: ONE accent color, used in LESS than 5% of the screen (CTA + 1 detail)
```

---

## LESSON 2: DON'T FIX WHAT ISN'T BROKEN

### The Rule:
**When a proven approach already looks good, don't change it just because
a rule seems to say otherwise. The APPEARANCE is the judge, not the
specification.**

```
The hierarchy of icon quality:
1. BEST:  Proper icon library (Phosphor, Lucide, SF Symbols) — if available
2. GOOD:  Clean text characters inside FIXED containers — proven, consistent
3. BAD:   Hand-drawn vector paths — crude, inconsistent, unprofessional
4. WORST: Raw text without containers — different sizes, no alignment
```

---

## LESSON 3: HEADER ICON BUTTONS NEED VISUAL CONTAINERS

### The Rule:
**Every interactive icon in a header or toolbar MUST be inside a tappable
container (circle or rounded rect) with a visible background. Naked floating
icons look broken.**

```
WRONG:
  ← Credit Card  •••     (icons floating naked)

RIGHT:
  (←) Credit Card (•••)   (icons inside circles with bg)
```

---

## LESSON 4: WHITESPACE IS NOT EMPTY — IT'S THE DESIGN

### The Rule:
**After building a screen, zoom out to 50% and squint. The screen should
have visible "air" between major groups. If it's a solid wall of content,
reduce element sizes or increase section spacing until you can breathe.**

```
The test: Can you see the BACKGROUND between sections?
If the content fills >80% of the visible viewport, it's too dense.
Aim for 60-70% content, 30-40% visible background.
```

---

## LESSON 5: CENTER ALIGNMENT FOR HERO ELEMENTS

### The Rule:
**If an element is the HERO (the largest, most important value on the screen),
center it. Centering creates visual gravity and signals "this is THE thing."
Supporting/contextual info goes below it, also centered.**

---

## LESSON 6: MATCHING ELEMENTS MUST BE VISUALLY IDENTICAL

### The Rule:
**In a list of items, visual decoration (icons, colors) should be
UNIFORM so the eye can focus on the CONTENT (names, amounts, dates).
The only exception is status indicators (pending, completed, failed).**

```
WRONG:
  Red N  Netflix      -$15.99    (red draws attention here)
  Green S  Spotify    -$11.99    (green draws attention here)

RIGHT:
  Gray N  Netflix     -$15.99    (neutral — eye goes to the name + amount)
  Gray U  Uber        -$24.50    (consistent — easy to scan the list)
```

---

## THE DESIGN JUDGMENT CHECKLIST

Before finalizing ANY screen, answer these questions:

### 1. Color Check
- [ ] How many distinct non-neutral colors are visible? (Target: <=2)
- [ ] Does the accent color appear in <=5% of the screen?
- [ ] Are there any semantic colors (red/green) that aren't for actual status?

### 2. Breathing Room Check
- [ ] Zoom to 50% and squint — can you see background between sections?
- [ ] Is the content <=70% of the visible viewport?
- [ ] Is the hero element given generous vertical space?

### 3. Consistency Check
- [ ] Are all header icon buttons the same size and style?
- [ ] Are all list items visually identical (except content)?
- [ ] Are all quick action buttons the same size, color, and corner radius?

### 4. Polish Check
- [ ] Do icon buttons have visible container backgrounds?
- [ ] Are icons rendered cleanly (not crude vector paths)?
- [ ] Is the hero element centered and dominant?

### 5. Restraint Check
- [ ] Did I resist adding a color "just because the brand has that color"?
- [ ] Did I resist making elements bigger "because the rule says X size"?
- [ ] If I compare to Nubank/Cash App — is my screen as SIMPLE as theirs?

---

## WHEN RULES CONFLICT WITH JUDGMENT

```
1. Build the screen following the rules
2. Take a screenshot
3. Ask: "Does this LOOK good? Does it feel premium?"
4. If NO — identify which rule application is causing the problem
5. Adjust the rule's interpretation, keeping the SPIRIT
6. Screenshot again and compare
7. The version that LOOKS better wins

The screenshot is the ultimate judge. Not the specification.
```
