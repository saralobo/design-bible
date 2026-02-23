---
name: design-context
description: Audit a codebase for design context and generate a DESIGN.md. Use when landing in a new repo, onboarding to an existing project, or when someone asks "where are the design decisions", "what's the design system here", "audit design context", or "what design info is missing".
allowed-tools: Bash(bash *), Bash(chmod *), Read, Write, mcp__*, Figma*, Notion*, Linear*
execution: subagent
---

# Design Context Audit

You are running as a sub-agent. Discover what design context exists in this codebase, enrich it with MCP data when available, and return findings + questions.

## Phase 1: Scan the Codebase

Find and run the `design-scan.sh` script from this skill's `scripts/` directory against the project root:

```bash
# The script is at scripts/design-scan.sh relative to this SKILL.md file.
# Resolve the path dynamically:
SKILL_DIR="$(find "$(pwd)" ~/.claude -path "*/design-context/scripts/design-scan.sh" 2>/dev/null | head -1 | xargs dirname 2>/dev/null | xargs dirname 2>/dev/null)"
bash "${SKILL_DIR}/scripts/design-scan.sh" .
```

If the path resolution fails, search for `design-scan.sh` in the plugin installation directories and run it against `.` (the project root).

Scans 5 layers: documents, external links, code tokens, code comments, structure.
Read the output carefully — it's your foundation.

## Phase 2: Enrich with MCPs

After the scan, check which MCP servers are available and auto-pull relevant data. Do NOT ask the user — pull automatically if the MCP is connected.

### Figma MCP

**Trigger:** Figma link found in scan, OR user mentions Figma, OR project has design system needs.

**Pull these (in order of priority):**

1. **Color styles / variables**
   - Get all color styles from the file
   - Extract names, hex values, and any grouping (e.g., `primary/500`, `neutral/100`)
   - Note which map to existing CSS variables in the codebase and which are missing

2. **Typography styles**
   - Font families, weights, sizes, line heights
   - Style names and hierarchy (e.g., `heading/h1`, `body/default`)
   - Compare with what the code scan found — flag mismatches

3. **Component inventory**
   - List of components in the Figma file
   - Compare with code components — what exists in Figma but not code? What's in code but not Figma?
   - Note component variants if available

4. **Spacing / layout tokens**
   - Any spacing variables or auto-layout values
   - Grid/layout definitions

**Output format for findings:**
```
### Figma: [file name]
- Colors: [X] styles ([Y] mapped to code tokens, [Z] missing from code)
- Typography: [X] styles (font: [name], scale: [sizes])
- Components: [X] in Figma, [Y] in code, [Z] only in Figma, [W] only in code
- Spacing: [system or "not defined in Figma"]
- Drift: [mismatches between Figma and code]
```

### Notion MCP

**Trigger:** Notion link found in scan, OR project likely has docs in Notion.

**Search for and pull:**

1. **Brand guidelines / style guides**
   - Search for pages with keywords: "brand", "style guide", "visual identity", "design system", "brand guidelines"
   - Extract key decisions: brand colors, voice/tone, logo usage, dos and don'ts
   - Summarize — don't dump the full page content

2. **Design specs / PRDs**
   - Search for: "design spec", "PRD", "product requirements", "feature spec", the project name
   - Extract design-relevant sections: user flows, wireframe descriptions, interaction patterns
   - Note which specs are recent vs. potentially outdated

3. **Design decision records**
   - Search for: "design decision", "design review", "design critique", "retro"
   - Extract key decisions and their rationale
   - These are gold — they capture the "why" that code never does

**Output format for findings:**
```
### Notion: Design Context
- Brand guide: [found/not found] — [summary of key points]
- Design specs: [X] relevant pages found — [list titles and dates]
- Design decisions: [X] records found — [key decisions summarized]
- Staleness: [most recent update date — flag if >6 months old]
```

### Linear MCP

**Trigger:** Always check if available — design debt often lives in issue trackers.

**Search for:**

1. **Design-related issues**
   - Search for labels/tags: "design", "UX", "UI", "design-debt", "accessibility", "a11y"
   - Search in issue titles/descriptions for: "redesign", "design system", "component", "visual", "responsive"

2. **Active design work**
   - Any in-progress issues related to design
   - Upcoming design milestones

**Output format for findings:**
```
### Linear: Design Issues
- Open design issues: [X] total
- Design debt: [list top 5 by priority]
- Active design work: [in-progress items]
- Labels used: [design-related labels that exist]
```

### If an MCP is NOT available

Don't fail or warn — just note it in findings as "not connected" and move on.
The questions phase will ask the user about the gaps.

```
### Figma: Not connected
  -> Figma link found in README: https://figma.com/file/...
  -> Cannot pull design tokens automatically
  -> Ask: Can you connect Figma MCP, or export tokens manually?
```

## Phase 3: Synthesize & Return

Combine everything into TWO outputs for the main agent:

### 1. Findings (~25-35 lines)

```
## Design Context Audit

### Available Design Surfaces
**Figma:** [connected / not connected — link if found in repo]
**Browser:** [dev server detected at URL / not detected — check package.json scripts]
**Agentation:** [MCP connected / not available]
**Code:** [framework, styling approach, component library]
**Primary surface:** [figma | browser | code-only | both]

### In the Repo
**Documents:** [written context found]
**External links:** [tool URLs discovered]
**Code tokens:** [colors, fonts, spacing — maturity level]
**Components:** [library, count, structure]
**Inconsistencies:** [problems]
**Design rationale:** [comments/ADRs found]

### From Figma [if connected]
**Colors:** [X styles, Y mapped to code, Z missing]
**Typography:** [font, scale, mismatches]
**Components:** [Figma vs code comparison]
**Drift:** [key mismatches between design and implementation]

### From Notion [if connected]
**Brand guide:** [found — key points / not found]
**Specs:** [X pages, titles, freshness]
**Decisions:** [key rationale captured]

### From Linear [if connected]
**Design debt:** [top issues]
**Active work:** [in-progress items]
```

### 2. Questions for the User

Generate 4-8 targeted questions. These should be SMARTER now because you have MCP data:

- If Figma shows colors that don't match code → "Figma has 12 color styles but code only uses 7 of them. Should the code be updated, or has the Figma file drifted?"
- If Notion has a brand guide but code doesn't reflect it → "Found brand guidelines in Notion from [date]. Are these still current?"
- If Linear has design debt → "There are [X] open design issues. Should these inform the DESIGN.md priorities?"
- If no MCPs connected → fall back to asking about external tools directly

**Always ask:**
- What are the 3 core user flows?
- Are there other surfaces beyond this codebase?
- Who owns design decisions?

DO NOT generate DESIGN.md yet. Return findings + questions to the main agent.
