---
name: figma-execution
description: "Figma API technical rules, correct code patterns, auto-layout order of operations, color format, font loading. Use when writing Figma plugin code, executing designs via MCP, or debugging Figma API errors."
---

# Figma Execution Rules — How to Build Correctly

> This document contains TECHNICAL rules specific to building screens in Figma
> using the Figma API via MCP. Common errors and their fixes.

---

## BEFORE CREATING ANYTHING

### 1. Check/Create Container
```javascript
// ALWAYS check if a Section or Frame exists
let section = figma.currentPage.findOne(n => n.type === 'SECTION');
if (!section) {
  section = figma.createSection();
  section.name = 'Design Components';
}
// Create your elements INSIDE the section
```

### 2. Use figma.getNodeByIdAsync (NOT getNodeById)
```javascript
// WRONG (with documentAccess: dynamic-page)
const node = figma.getNodeById('123:456');

// CORRECT
const node = await figma.getNodeByIdAsync('123:456');
```

### 3. Use setReactionsAsync (NOT set_reactions)
```javascript
// WRONG
node.reactions = [...];

// CORRECT
await node.setReactionsAsync([...]);
```

---

## AUTO-LAYOUT — ORDER OF OPERATIONS

### CRITICAL RULE:
> Add the element to the auto-layout parent BEFORE setting `layoutSizingHorizontal = 'FILL'`.
> `FILL` only works on direct children of auto-layout frames.

```javascript
// CORRECT — Proper order
const parent = figma.createFrame();
parent.layoutMode = 'VERTICAL';
parent.resize(393, 852);

const child = figma.createFrame();
parent.appendChild(child);              // 1. Add to parent FIRST
child.layoutSizingHorizontal = 'FILL';  // 2. Then set FILL
child.layoutSizingVertical = 'HUG';

// WRONG — Will throw an error
const child2 = figma.createFrame();
child2.layoutSizingHorizontal = 'FILL'; // ERROR: not inside an auto-layout parent
parent.appendChild(child2);
```

---

## CIRCULAR BUTTON — CORRECT IMPLEMENTATION

```javascript
// CORRECT — Perfectly circular button
const btn = figma.createFrame();
const SIZE = 56;  // or 44, 48, etc.
btn.resize(SIZE, SIZE);
btn.cornerRadius = SIZE / 2;  // EXACT HALF

// Auto-layout to center the icon
btn.layoutMode = 'HORIZONTAL';
btn.primaryAxisAlignItems = 'CENTER';
btn.counterAxisAlignItems = 'CENTER';

// CRITICAL: FIXED on BOTH axes
btn.primaryAxisSizingMode = 'FIXED';
btn.counterAxisSizingMode = 'FIXED';

// DO NOT:
// btn.primaryAxisSizingMode = 'AUTO';  <- Will stretch with content!
// btn.layoutSizingHorizontal = 'HUG'; <- Same problem!
```

### Rule: For ANY element that must be circular
1. `width` MUST equal `height`
2. `cornerRadius` = `width / 2`
3. Sizing mode = `FIXED` on both axes
4. NEVER use HUG or AUTO which can distort the shape

---

## COLORS — CORRECT FORMAT

```javascript
// In Figma API, colors are normalized RGB (0-1), NOT hex

// CORRECT — Convert hex to normalized RGB
function hexToFigmaRGB(hex) {
  hex = hex.replace('#', '');
  return {
    r: parseInt(hex.substring(0, 2), 16) / 255,
    g: parseInt(hex.substring(2, 4), 16) / 255,
    b: parseInt(hex.substring(4, 6), 16) / 255
  };
}

// Apply fill
frame.fills = [{
  type: 'SOLID',
  color: hexToFigmaRGB('#276EF1')
}];

// WRONG — hex directly does not work
frame.fills = [{ type: 'SOLID', color: '#276EF1' }];
```

---

## TEXT — LOAD FONT FIRST

```javascript
// CORRECT — Load font BEFORE creating/modifying text
await figma.loadFontAsync({ family: 'Inter', style: 'Regular' });
await figma.loadFontAsync({ family: 'Inter', style: 'Semi Bold' });
await figma.loadFontAsync({ family: 'Inter', style: 'Bold' });

const text = figma.createText();
text.fontName = { family: 'Inter', style: 'Semi Bold' };
text.characters = 'Hello World';
text.fontSize = 16;

// WRONG — Without loading the font
const text2 = figma.createText();
text2.characters = 'Will throw error';  // ERROR: font not loaded
```

---

## PROTOTYPING — CORRECT REACTIONS FORMAT

```javascript
// CORRECT — Complete reactions format
await sourceNode.setReactionsAsync([{
  trigger: { type: 'ON_CLICK' },
  actions: [{                          // PLURAL: actions (not action)
    type: 'NODE',
    destinationId: targetNode.id,
    navigation: 'NAVIGATE',
    transition: {
      type: 'SLIDE_IN',               // or SLIDE_OUT, DISSOLVE, SMART_ANIMATE
      direction: 'LEFT',              // LEFT, RIGHT, TOP, BOTTOM
      matchLayers: false,
      duration: 0.35,                 // in SECONDS (not ms!)
      easing: { type: 'GENTLE' }     // or EASE_IN_AND_OUT, EASE_OUT, etc.
    },
    preserveScrollPosition: false
  }]
}]);

// WRONG — singular action
await node.setReactionsAsync([{
  trigger: { type: 'ON_CLICK' },
  action: { ... }  // WRONG: use actions (plural)
}]);
```

---

## OVERFLOW AND SCROLL

```javascript
// CORRECT — Horizontal scroll
frame.overflowDirection = 'HORIZONTAL';  // Correct enum
frame.clipsContent = true;

// WRONG
frame.overflowDirection = 'HORIZONTAL_SCROLLING';  // Invalid enum!
```

### Valid values for overflowDirection:
- `'NONE'` — no scroll
- `'HORIZONTAL'` — horizontal scroll
- `'VERTICAL'` — vertical scroll
- `'BOTH'` — scroll in both directions

---

## FLOW STARTING POINTS

```javascript
// CORRECT — Define flow starting point
figma.currentPage.flowStartingPoints = [{
  nodeId: startFrame.id,
  name: 'Flow Name'
}];

// WRONG — Setting on the node directly
startFrame.flowStartingPoints = [...];  // Does not work
```

---

## COMPONENTS AND VARIANTS

```javascript
// Create component
const component = figma.createComponent();

// Create component set (variants)
const variant1 = figma.createComponent();
variant1.name = 'State=Default';

const variant2 = figma.createComponent();
variant2.name = 'State=Hover';

// Combine into set
const componentSet = figma.combineAsVariants([variant1, variant2], figma.currentPage);
componentSet.name = 'Button';
```

---

## PRE-EXECUTION CHECKLIST

Before executing code in Figma:

- [ ] Does the container/Section exist or will it be created?
- [ ] Will fonts be loaded with `loadFontAsync` BEFORE use?
- [ ] Are colors in normalized RGB format (0-1), not hex?
- [ ] Does the auto-layout parent exist BEFORE setting FILL on children?
- [ ] Do circular buttons have FIXED size on both axes?
- [ ] Does prototyping use `actions` (plural) and `setReactionsAsync`?
- [ ] Are durations in reactions in SECONDS (0.35), not ms (350)?
- [ ] Using `getNodeByIdAsync` (not `getNodeById`)?
- [ ] Does `overflowDirection` use the correct enum ('HORIZONTAL', not 'HORIZONTAL_SCROLLING')?

---

## NAMING CONVENTION

### Layers in Figma:
```
Screen/HomePage                    <- Main screen
|-- Section/Header                 <- Section
|   |-- Row/TopBar                 <- Horizontal row
|   |   |-- Icon/Back              <- Icon
|   |   |-- Text/ScreenTitle       <- Text
|   |   +-- Icon/Settings          <- Icon
|   +-- Row/BalanceCard            <- Card
|-- Section/Content                <- Section
|   |-- Text/SectionTitle          <- Section title
|   |-- Card/Transaction           <- Individual card
|   +-- Card/Transaction           <- Individual card
+-- Section/BottomNav              <- Navigation
    |-- NavItem/Home               <- Nav item
    |-- NavItem/Search             <- Nav item
    +-- NavItem/Profile            <- Nav item
```

### Rule: Prefix indicates the type:
| Prefix | Type |
|---|---|
| Screen/ | Full screen frame |
| Section/ | Screen section |
| Row/ | Horizontal layout |
| Card/ | Card container |
| Text/ | Text node |
| Icon/ | Icon |
| Button/ | Button |
| Input/ | Input field |
| NavItem/ | Navigation item |
| Badge/ | Badge/indicator |
| Avatar/ | Avatar/photo |
| Divider/ | Separator line |

---

## STANDARD SIZES FOR REFERENCE

| Element | Width | Height |
|---|---|---|
| Mobile screen | 393px | 852px |
| Header | Fill | 56px |
| Bottom nav | Fill | 56px + safe area |
| Button large | Fill | 48-56px |
| Button medium | Hug | 44px |
| Input | Fill | 48-56px |
| Card | Fill | Hug |
| Avatar small | 32px | 32px |
| Avatar medium | 40px | 40px |
| Avatar large | 48px | 48px |
| Icon | 24px | 24px |
| Icon small | 20px | 20px |
| Icon large | 32px | 32px |
| FAB | 56px | 56px |
| Badge | auto | 20px |
| Divider | Fill | 1px |
