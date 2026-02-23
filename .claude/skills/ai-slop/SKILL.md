---
name: ai-slop
description: "Prevent AI-generated interface slop. Identifies and eliminates the 13 hallmarks of generic AI design -- purple gradients, glassmorphism, bento grids, status color abuse, decorative noise, and soulless over-design. Use when building or reviewing any UI to ensure it doesn't look like every other AI-generated interface."
---

# AI Slop Prevention -- Design That Signals Intent

> AI-generated interfaces converge on the same aesthetic: purple gradients, frosted glass, bento grids, decorative blobs. This chapter names the pattern, explains why it happens, and provides a concrete framework for preventing it.
> If your design could be a screenshot from any AI demo, it has no identity. Fix it before shipping.

---

## WHY AI GENERATES SLOP

### The Indigo-500 Problem
Tailwind's `bg-indigo-500` (#6366F1) is the statistically dominant accent color across millions of sites in LLM training data. When an AI picks "a modern color," it picks the average of what it has seen -- which is indigo/purple. This is not a design decision. It is a statistical artifact.

### Distributional Convergence
LLMs optimize for the most probable next token. Applied to design, this means:
- "Clean modern design" = the average of all "modern" designs in training data
- "Professional dashboard" = the median dashboard layout
- "Landing page" = the same hero + features + pricing + footer every time

The result: every AI-generated interface looks like every other AI-generated interface.

### No Design Intent
AI has no lived taste, no cultural context, no brand strategy. It cannot answer "why this and not that?" -- it can only answer "what is most likely?" Design without intent produces decoration without meaning.

---

## THE 13 HALLMARKS OF AI SLOP

### SLOP-01: Purple/Indigo Gradient Defaults
```
WRONG:
bg-gradient-to-r from-indigo-500 to-purple-600
bg-gradient-to-br from-violet-500 via-purple-500 to-indigo-500
-> The "AI purple" -- signals no design decision was made

CORRECT:
bg-[brand-accent]
-> Color derived from actual brand tokens, not Tailwind defaults
```
**Why it's slop**: Purple/indigo as accent = the AI picked the statistical default, not a brand color.
**Fix**: Every accent color must trace back to a brand decision. If no brand exists yet, choose a color that is NOT purple/indigo and articulate why.

**See also**: `/colors` -- "1 accent, 1 background, 1-2 neutrals, status only when needed"

---

### SLOP-02: Glassmorphism on Everything
```
WRONG:
Every card:
  bg-white/10 backdrop-blur-xl border border-white/20 rounded-2xl
-> Frosted glass on navigation, cards, modals, tooltips, EVERYTHING

CORRECT:
Glassmorphism used on 0-1 elements per screen, where
transparency serves a functional purpose (e.g., overlay on
dynamic content that the user needs to see through).
```
**Why it's slop**: Glassmorphism is decorative complexity. When everything is frosted glass, nothing has visual hierarchy.
**Fix**: Solid backgrounds by default. Glassmorphism only when transparency serves a function (e.g., a video overlay). Maximum 1 frosted element per screen.

---

### SLOP-03: Uniform Rounded Corners
```
WRONG:
Every element: rounded-2xl (or rounded-lg, or rounded-xl)
Cards: rounded-2xl
Buttons: rounded-2xl
Inputs: rounded-2xl
Images: rounded-2xl
-> Everything has the same corner radius regardless of role

CORRECT:
Cards/containers: rounded-lg (8-12px)
Buttons: rounded-md (6px) or rounded-full (pill) -- pick ONE per project
Inputs: rounded-md (6px) matching buttons
Avatars: rounded-full
-> Corner radius varies by component role and creates visual hierarchy
```
**Why it's slop**: Uniform corner radius means no thought was given to how different elements relate. A button and a card serving different functions should not share the same radius.
**Fix**: Define a corner radius scale tied to component roles. Document it in your design tokens.

---

### SLOP-04: Decorative Blobs, Orbs, and Mesh Gradients
```
WRONG:
Floating purple/blue gradient orbs in the background
Mesh gradient blobs behind content
Abstract "decorative" shapes with no semantic purpose
-> Visual noise that adds zero information

CORRECT:
Background is a solid color or a subtle, single-tone gradient
that supports content readability. Decorative elements exist
only when they reinforce brand identity (e.g., Stripe's
signature gradient serves brand recognition, not decoration).
```
**Why it's slop**: Decorative blobs are filler. They exist because the AI needed to "fill" negative space instead of letting it breathe.
**Fix**: Remove all decorative background elements. If the design feels empty without them, the content layout is the problem -- fix the layout, not the background.

**See also**: `/design-judgment` L4 -- "60-70% content, 30-40% background"

---

### SLOP-05: Bento Grid Monoculture
```
WRONG:
Every landing page:
+--------+--------+
| Card   | Card   |
+--------+--------+
| Card   | Card   |
+--------+--------+
| Card   | Card   |
+--------+--------+
-> Uniform bento grid with identical card sizes, no hierarchy

CORRECT:
A layout where card sizes reflect content importance:
+----------------+--------+
| Featured       | Side   |
| (large)        | (sm)   |
|                +--------+
|                | Side   |
+-------+--------+ (sm)   |
| Equal | Equal  +--------+
+-------+--------+
-> Size = hierarchy. The grid serves the content, not the other way around.
```
**Why it's slop**: Bento grids became the default AI layout because they are easy to generate and look "organized." But uniform grids communicate that everything is equally important -- which means nothing is important.
**Fix**: If using a grid, vary cell sizes to create hierarchy. Ask: what is the ONE thing the user should see first?

**See also**: `/core-principles` -- visual hierarchy (the #1 pillar)

---

### SLOP-06: Generic Hero Sections
```
WRONG:
"Welcome to [Product]"
"The best way to [generic verb] your [generic noun]"
Giant gradient background + floating mockup + two buttons (Get Started / Learn More)
-> Indistinguishable from 10,000 other landing pages

CORRECT:
A hero that answers: What does this do? For whom? Why should I care?
Specific language, specific value proposition, specific imagery.
If you removed the logo, could you tell which product this is?
```
**Why it's slop**: AI generates the median hero section. It cannot produce a unique value proposition because it does not know the product.
**Fix**: The hero test -- cover the logo. If you cannot identify the product, the hero is generic. Rewrite with specific language.

---

### SLOP-07: Inter/System Font Monoculture
```
WRONG:
font-family: 'Inter', sans-serif
-> Used by default in every AI-generated interface
-> Perfectly readable, perfectly anonymous

CORRECT:
A deliberate font choice that reflects the product's personality:
- Financial: serif or geometric sans (e.g., GT America, Söhne)
- Creative: display or humanist (e.g., Fraunces, Cabinet Grotesk)
- Developer tools: monospace or technical sans (e.g., JetBrains Mono, Berkeley Mono)
- If Inter IS the right choice, document WHY (e.g., "We chose Inter for
  its large x-height and language support across 30+ locales")
```
**Why it's slop**: Inter is the default because it is the most common font in AI training data. Using it without justification is not a decision -- it is an absence of one.
**Fix**: Choose a typeface that reinforces brand personality. If Inter is the right answer, write down why. "It was the default" is not a reason.

**See also**: `/typography` -- type scale, weights, formatting

---

### SLOP-08: Shadow Stacking
```
WRONG:
<div class="shadow-lg border border-gray-200 bg-white rounded-xl">
  -> shadow + border + background + radius all on the same element
  -> Overworked, heavy, visually noisy

CORRECT:
Elevation via ONE method per element:
  Option A: shadow only (shadow-sm, no border)
  Option B: border only (border-gray-200, no shadow)
  Option C: background color change (bg-gray-50 on hover, no shadow)
```
**Why it's slop**: AI stacks every available elevation method because each one individually appeared in training data. Together they create visual noise.
**Fix**: Pick ONE elevation method per element. Cards with borders do not need shadows. Cards with shadows do not need borders.

**See also**: `/visual-references` -- "Revolut/Linear: surface color for elevation, not shadows"

---

### SLOP-09: Glow Effects as Affordances
```
WRONG:
Buttons with outer glow: shadow-[0_0_15px_rgba(99,102,241,0.5)]
Input focus rings that glow: ring-2 ring-indigo-500/50 shadow-indigo-500/25
Neon text effects on headings
-> Glow everywhere reduces signal-to-noise ratio

CORRECT:
Focus indicators: ring-2 ring-offset-2 ring-[accent] (solid, not glowing)
Hover states: background color change or subtle shadow
Active states: scale(0.98) or darker background
-> Affordances communicate through standard visual patterns, not light shows
```
**Why it's slop**: Glow effects are decorative affordances. They look like they communicate interactivity but they actually add noise.
**Fix**: Use standard affordances -- color change, subtle shadow shift, scale transform. Reserve glow for brand-specific moments (if any).

---

### SLOP-10: Over-Designed Empty States
```
WRONG:
Empty state with:
  - Custom 3D illustration
  - Animated floating elements
  - Gradient background
  - Multiple lines of whimsical copy
  - Two CTA buttons
  -> More visual weight than the actual content state

CORRECT:
Empty state with:
  - Simple icon or small illustration
  - One line explaining what goes here
  - One action to populate it
  -> Less visual weight than the populated state
```
**Why it's slop**: AI over-designs empty states because they are frequently showcased in design portfolios. In production, an empty state should be the LEAST visually prominent state.
**Fix**: Empty states should be quieter than full states. The user should want to fill them, not admire them.

**See also**: `/feedback-states` -- loading, empty, error state patterns

---

### SLOP-11: Polished But Soulless (No Distinctive Decisions)
```
DIAGNOSTIC QUESTIONS:
1. If you removed the logo, could you identify this product? -> No = slop
2. What is the ONE unconventional design choice? -> None = slop
3. What would a competitor's version look like? -> Identical = slop
4. Which element breaks the grid/pattern intentionally? -> None = slop
5. What design rule did you deliberately bend or break? -> None = slop
```
**Why it's slop**: The most dangerous form of slop -- everything is well-crafted, polished, consistent, and utterly forgettable. No design decisions were made. Every choice was the safe default.
**Fix**: Every screen needs at least one deliberate, defensible design choice that distinguishes it from the generic version. This is where `/design-judgment` becomes critical.

**See also**: `/design-judgment` -- "the screenshot is the ultimate judge"

---

### SLOP-12: Gratuitous Animation
```
WRONG:
Every element animates on scroll (staggered fade-up)
Buttons bounce on hover
Page transitions use spring physics for everything
Numbers count up on every visit
Parallax backgrounds on marketing pages
-> Animation as entertainment, not communication

CORRECT:
Animation serves a purpose:
  - Entrance: only for content that loads after initial render
  - Transition: only between states the user triggered
  - Feedback: only to confirm an action was received
  - Duration: 150-300ms for most interactions
-> Animation as communication, not decoration
```
**Why it's slop**: AI adds animation because animated examples are over-represented in training data (they get more social engagement). In production, most animation is noise.
**Fix**: Every animation must answer: "What information does this motion convey that the static version does not?"

**See also**: `/anti-patterns` AP-15 -- "No bounce in financial/professional apps"
**See also**: `/motion-transitions` -- correct easing and duration values

---

### SLOP-13: Status Color Abuse on Actions
```
WRONG:
[ Connect Google ]  <- green filled (positive = green)
[ Connect Linear ]  <- green filled (positive = green)
[ Chat ]            <- green outlined (positive = green)
[ Save ]            <- green filled (positive = green)
[ Delete ]          <- red outlined (destructive = red)
[ Disconnect ]      <- red outlined (destructive = red)
-> Every button color-coded by intent. Screen looks like a Christmas tree.
-> No button hierarchy exists -- just a semantic color map.

CORRECT:
[ Connect Google ]  <- accent filled (primary CTA)
[ Connect Linear ]  <- accent outlined (secondary)
[ Chat ]            <- neutral outlined (tertiary)
[ Save ]            <- accent filled (primary CTA)
[ Delete ]          <- neutral ghost + destructive modal confirmation
[ Disconnect ]      <- neutral ghost (low-emphasis, confirms on click)
-> ONE accent color drives hierarchy. Status colors absent from actions.
```
**Why it's slop**: AI conflates action intent with status semantics. It sees "connect = positive = green" and "delete = destructive = red" in its training data and applies this logic to every button. The result: 4+ competing colors, no clear primary CTA, and button hierarchy replaced by a color-coded emotion map.
**Fix**: Buttons use the **accent color + hierarchy** (filled/outlined/ghost), never status colors. Green/red/yellow are reserved for **system feedback after an action** (success toast, error banner, warning badge) -- not for the action itself. The one exception: a destructive confirmation button inside a modal ("Delete forever" in red) where the context is already isolated.

**The rule**: Status colors answer "what happened?" -- never "what will happen?"

**See also**: `/design-judgment` L1 -- "Semantic colors are for system states, NOT content decoration"
**See also**: `/buttons-cta` -- "Filled (solid accent color)" for primary actions
**See also**: `/colors` -- "Status colors only when needed"

---

## THE SIGNAL TEST

Every visual choice in a design must pass this test:

> **"Why this and not the default?"**

If you cannot articulate the decision, it is probably a default. Defaults are not decisions.

| Element | Ask | Default (slop) | Decision (design) |
|---|---|---|---|
| Accent color | Why this hue? | "It's indigo-500" | "Our brand blue is #1A73E8 (Google Blue) for trust" |
| Font | Why this typeface? | "Inter, it's clean" | "We use DM Sans for its geometric personality" |
| Corner radius | Why this radius? | "rounded-lg everywhere" | "8px for containers, 4px for inputs, full for avatars" |
| Card elevation | Why shadow? | "shadow-lg looks good" | "No shadows -- we use bg-gray-50 for elevation like Linear" |
| Grid layout | Why this arrangement? | "Bento, it's modern" | "Featured item 2x width because it has 3x the conversion" |
| Animation | Why this motion? | "Fade-up looks cool" | "Skeleton shimmer on load, no entrance animation on static content" |
| Button color | Why green/red? | "Connect is positive, delete is negative" | "All actions use accent. Status colors only for feedback after the action" |

---

## CODE-LEVEL PREVENTION (Tailwind/CSS)

### Never Use These as Defaults
- `bg-indigo-*` or `bg-purple-*` as accent colors -- pick a brand color
- `bg-gradient-to-*` with `from-indigo-*` / `from-purple-*` / `from-violet-*` -- gradient only from brand tokens
- `backdrop-blur-*` without explicit design justification in comments
- `rounded-2xl` uniformly on all elements -- vary by component role
- `shadow-*` + `border` + `bg-*` on the same element -- pick ONE elevation method
- `shadow-[0_0_*px_*]` glow effects as primary affordances
- `animate-bounce` on non-playful interfaces
- `bg-green-*` / `bg-red-*` / `text-green-*` / `text-red-*` on buttons -- status colors are for feedback, not actions

### Healthy Defaults
- Solid backgrounds (`bg-white`, `bg-gray-50`, `bg-[brand-surface]`)
- Single elevation method per element (shadow OR border OR background)
- Corner radius scale (e.g., `rounded-sm` for chips, `rounded-md` for inputs, `rounded-lg` for cards)
- Transitions only on interactive elements (`transition-colors duration-150`)
- System fonts as fallback, chosen fonts as primary with documented rationale

---

## THE AI SLOP AUDIT

Run this checklist before declaring any screen done:

### Visual Identity
- [ ] Could you identify this product with the logo removed?
- [ ] Is there at least ONE deliberate design choice that differs from the generic version?
- [ ] Does the accent color trace to a brand decision (not a Tailwind default)?
- [ ] Does the typeface choice have a documented rationale?

### Restraint
- [ ] Zero decorative blobs, orbs, or mesh gradients (unless brand-mandated)?
- [ ] Zero glassmorphism (or at most 1 element with functional justification)?
- [ ] Zero glow effects as primary affordances?
- [ ] Shadow stacking: no element combines shadow + border + colored background?
- [ ] Gradients: maximum 1 per screen, derived from brand tokens?
- [ ] Buttons use accent + hierarchy (filled/outlined/ghost), not status colors (green/red/yellow)?
- [ ] Status colors (green/red/yellow) appear ONLY in feedback after actions (toasts, badges, banners)?

### Hierarchy
- [ ] Grid layout varies cell sizes to reflect content importance?
- [ ] Corner radii vary by component role (not uniform across the screen)?
- [ ] Empty states are visually quieter than populated states?
- [ ] Hero section passes the "cover the logo" test?

### Motion
- [ ] Every animation answers "what information does this motion convey?"
- [ ] No entrance animations on static, above-the-fold content?
- [ ] No bounce/spring physics in professional/financial contexts?

---

## CROSS-REFERENCES

This skill focuses on patterns NOT covered elsewhere. For adjacent rules:

| Topic | Skill | Key Rule |
|---|---|---|
| Color restraint | `/design-judgment` L1 | <=2 non-neutral colors, accent in <=5% of screen |
| Color max per screen | `/colors` | 1 accent, 1 background, 1-2 neutrals, status only when needed |
| Gradient restraint | `/colors` | Maximum 1 gradient per screen, use sparingly |
| Whitespace density | `/design-judgment` L4 | 60-70% content, 30-40% background |
| Animation overuse | `/anti-patterns` AP-15 | No bounce in financial/professional apps |
| Card clutter | `/anti-patterns` AP-17 | Card with Too Much Information |
| Visual noise | `/anti-patterns` AP-16 | Ignoring Information Hierarchy |
| Minimalism examples | `/visual-references` | Cash App, Nubank, Linear patterns |
| Shadow-free elevation | `/visual-references` | Revolut/Linear: surface color for elevation, not shadows |
| Type hierarchy | `/typography` | Type scale, weights, formatting |
| Visual hierarchy | `/core-principles` | The #1 pillar: hierarchy determines where the eye goes |
| Status vs action colors | `/design-judgment` L1 | Semantic colors for system states, not content decoration |
| Button hierarchy | `/buttons-cta` | Primary = filled accent, secondary = outlined, tertiary = ghost |
