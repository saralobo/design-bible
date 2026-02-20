# Project Audit Template

## Audit Card

Copy and fill in for each new project:

```
PROJECT AUDIT: [Project Name]
Date: [Date]
Evaluator: [Name]

MATURITY ASSESSMENT (L0-L3 per axis):

Brand Identity:     L_ — [notes]
Design Artifacts:   L_ — [notes]
Design System:      L_ — [notes]
Codebase:           L_ — [notes]
Content & Copy:     L_ — [notes]

CONTEXT:
Surfaces needed:    [Landing page / Mobile app / Web app / Other]
My role:            [Solo / Lead / Contributor]
Constraints:        [Timeline, budget, team size, tech constraints]
```

## Maturity Levels

### Brand Identity
- **L0 — Nothing:** No brand exists
- **L1 — Seed:** Name chosen, maybe rough color ideas
- **L2 — Guided:** Brand guide exists (logo, colors, typography, basic rules)
- **L3 — Established:** Full brand system with tokens, voice guidelines, asset library

### Design Artifacts
- **L0 — Nothing:** No designs of any kind
- **L1 — Sketches:** Rough wireframes, napkin drawings, loose ideas
- **L2 — Designed:** Key screens designed in Figma/Sketch with some detail
- **L3 — Specified:** Full design spec with interactions, states, responsive behavior

### Design System
- **L0 — Nothing:** No reusable components
- **L1 — Ad-hoc:** Some components exist but inconsistent, no tokens
- **L2 — Partial:** Component library started, some tokens defined
- **L3 — Systematic:** Full token system, consistent component library, documented

### Codebase
- **L0 — Nothing:** No code exists
- **L1 — Prototype:** POC or prototype, not production-ready
- **L2 — Partial:** Some features built, partial implementation
- **L3 — Mature:** Production app, tested, deployed, maintained

### Content & Copy
- **L0 — Nothing:** No copy or content strategy
- **L1 — Rough:** Concept defined, placeholder copy
- **L2 — Drafted:** Real copy written, needs review/refinement
- **L3 — Final:** Copy finalized, reviewed, approved

## Archetype Decision Tree

After scoring, determine the project archetype:

```
Brand >= L2 AND everything else L0?
  -> Greenfield with Brand (full framework)

Design >= L2 AND Code <= L1?
  -> Build What's Designed (skip to Phase 4)

Brand changed AND Code >= L2?
  -> Redesign/Rebrand (restart at Phase 1)

Code >= L1 AND Design <= L1 AND Brand <= L1?
  -> Rescue/Takeover (audit gaps, then fix)

Code >= L2 AND Design >= L2?
  -> Polish & Ship (Phase 4-5 only)
```

## Phase Priority Matrix

| Archetype | Ph0 Audit | Ph1 Tokens | Ph2 Assets | Ph3 Design | Ph4 Build | Ph5 QA |
|---|---|---|---|---|---|---|
| Greenfield | HIGH | HIGH | MED | HIGH | HIGH | MED |
| Build Designed | Quick | Verify | Export | Skip | HIGH | HIGH |
| Redesign | HIGH | HIGH | HIGH | MED | MED | HIGH |
| Rescue | HIGH | Fill gaps | Fill gaps | Fill gaps | MED | HIGH |
| Polish | Quick | Verify | Verify | Skip | HIGH | HIGH |
