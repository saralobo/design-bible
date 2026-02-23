# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A design rules repository ("bible") for AI assistants creating interfaces across any design surface -- Figma, browser, or straight to code. Combined with a design engineering workflow and agent architecture. No build system, no tests, no application code -- the content IS the product. All files are Markdown.

## Architecture: Dual Format

Content exists in two parallel formats that must stay in sync:

| Format | Location | Structure |
|---|---|---|
| **Agent Skills** | `.claude/skills/` | 25 on-demand skills (invoked via `/slash-command`) -- [open standard](https://agentskills.io), works across compatible agents |
| **Cursor Rules** | `.cursor/rules/` | 22 `.mdc` files (numbered 00-21) -- legacy Cursor-specific format |

### Claude Code structure
- **All 25 skills** live in `.claude/skills/*/SKILL.md` -- nothing is preloaded
- 22 design quality skills are loaded on-demand when relevant to the design task, or invoked directly via slash command
- 3 process workflow skills (`problem-definition`, `design-context`, `design-engineering`) orchestrate how to approach design work
- **The priest** (`.claude/agents/design-bible-priest.md`) is a custom agent that enforces the bible -- launch with `claude --agent design-bible-priest` for an isolated design session

### Cursor structure
- `.cursor/rules/*.mdc` -- numbered 00-21, frontmatter has `alwaysApply: true/false`

### Mapping between formats
| Cursor `.mdc` | Claude skill |
|---|---|
| `00-core-principles` | `/core-principles` |
| `01-ux-laws` | `/ux-laws` |
| `02-gestalt` | `/gestalt` |
| `03-layout-spacing` | `/layout-spacing` |
| `04-typography` | `/typography` |
| `05-colors` | `/colors` |
| `06-buttons-cta` | `/buttons-cta` |
| `07-forms-inputs` | `/forms-inputs` |
| `08-navigation` | `/navigation` |
| `09-cards-lists` | `/cards-lists` |
| `10-feedback-states` | `/feedback-states` |
| `11-motion-transitions` | `/motion-transitions` |
| `12-micro-interactions` | `/micro-interactions` |
| `13-accessibility` | `/accessibility` |
| `14-nielsen-heuristics` | `/nielsen-heuristics` |
| `15-figma-execution` | `/figma-execution` |
| `16-anti-patterns` | `/anti-patterns` |
| `17-icons` | `/icons` |
| `18-responsiveness-constraints` | `/responsiveness` |
| `19-visual-references` | `/visual-references` |
| `20-design-judgment` | `/design-judgment` |
| `21-ai-slop` | `/ai-slop` |

**Note:** The 3 process skills (`problem-definition`, `design-context`, `design-engineering`) have no `.mdc` equivalent -- they live only in `.claude/skills/`. Cursor can read them directly from there via its skills support.

## When Editing Rules

- If you modify a Claude skill, the corresponding Cursor `.mdc` file likely needs the same update (and vice versa)
- Cursor `.mdc` files use YAML frontmatter (`alwaysApply: true/false`); Claude skills use SKILL.md with name/description frontmatter
- Keep rules concrete and verifiable -- every rule should be checkable against a screenshot
- The 3 process skills (problem-definition, design-context, design-engineering) have no `.mdc` equivalent -- Cursor reads them directly from `.claude/skills/`

## Available Skills

| Skill | When to Use |
|---|---|
| `/core-principles` | Starting any screen, visual hierarchy, 4 pillars, mobile rules |
| `/figma-execution` | Writing Figma API code, auto-layout, colors, fonts, prototyping |
| `/anti-patterns` | Reviewing designs for common mistakes, pre-launch checklist |
| `/design-judgment` | Resolving rule conflicts, final design review, taste over mechanics |
| `/ux-laws` | Designing interactions, layout positions, simplifying choices |
| `/gestalt` | Grouping elements, organizing visual hierarchy, structuring layouts |
| `/layout-spacing` | Building screen structure, defining spacing, page layout |
| `/typography` | Adding text elements, headings, body text, type hierarchy |
| `/colors` | Choosing colors, defining tokens, themes, contrast |
| `/buttons-cta` | Creating buttons, CTAs, interactive action components |
| `/forms-inputs` | Building forms, login screens, data input interfaces |
| `/navigation` | Designing navigation structure, screen flow, wayfinding |
| `/cards-lists` | Displaying collections, product listings, card layouts |
| `/feedback-states` | Loading indicators, error/success states, toasts |
| `/motion-transitions` | Prototyping, screen transitions, animation design |
| `/micro-interactions` | Interactive details, hover effects, press feedback |
| `/accessibility` | WCAG 2.2 compliance, inclusive design review |
| `/nielsen-heuristics` | Usability evaluation, design audits, heuristic review |
| `/icons` | Adding icons, icon buttons, Material Symbols |
| `/responsiveness` | Responsive screens, constraints, adaptive components |
| `/visual-references` | Design inspiration, best practices from top-tier apps |
| `/ai-slop` | Preventing AI-generated design slop, the 13 hallmarks, signal test |
| `/problem-definition` | Raw client input, meeting notes, defining problems before designing |
| `/design-context` | Auditing codebase design context, generating DESIGN.md, onboarding to repos |
| `/design-engineering` | Full design engineering framework, project audit, Double Diamond, design QA |

## Design Engineering Workflow

The 3 process skills form a pipeline for approaching design work end-to-end:

```
/problem-definition     /design-context       /design-engineering
(Diamond 1: Problem)    (Audit existing)      (Diamond 2: Solution)
       |                      |                       |
  Raw client input     Scan repo + MCPs        Brand -> Tokens -> Assets
  -> Problem statements  -> DESIGN.md           -> IA -> Design -> Build
  -> Design Brief        -> Context gaps         -> Heuristic QA
```

- **`/problem-definition`** -- Start here with raw client notes. Produces a design brief.
- **`/design-context`** -- Run when landing in any existing codebase. Scans repo + Figma/Notion/Linear MCPs.
- **`/design-engineering`** -- The full framework. Takes the brief and context as inputs, guides through all phases.

The `hooks/hooks.json` file contains a forced-evaluation hook that ensures these 3 process skills are considered before every task. The 22 Design Bible skills are handled automatically by Claude's native skill matching.

## The Church (Agents)

The design bible includes two custom Claude Code agents. The bible is the knowledge; the agents are the process. Both agents are **surface-agnostic** -- they detect what's available (Figma, browser, code-only) and adapt.

### The Priest

`.claude/agents/design-bible-priest.md` -- the generalist design worker.

- Launch: `claude --agent design-bible-priest`
- Preloads 4 skills (core-principles, anti-patterns, design-judgment, figma-execution), loads others on demand
- **Surface-agnostic:** detects available surfaces at session start (Figma MCP, browser via agent-browser, agentation, code)
- Builds in Figma (when connected), writes frontend code, reviews designs, makes design decisions
- **Critique mode:** opens a headed browser, scrolls through a page, creates design annotations autonomously (requires agent-browser + agentation)
- **Self-driving mode:** critique + automatic fix of each annotated issue (requires agentation-self-driving skill)
- Self-verifies all work on whatever surface is available
- Uses `memory: user` to accumulate brand tokens, conventions, and patterns across sessions

### The Archbishop

`.claude/agents/design-bible-archbishop.md` -- the orchestrator that coordinates a team of priests.

- Launch: `claude --agent design-bible-archbishop`
- Spawns multiple priest agents for parallel design work (audits, reviews, large redesigns)
- **Surface-agnostic:** holds Figma MCP when connected, orchestrates browser-based critique/self-driving pipelines when agentation is available
- Priests specialize by **design concern** (accessibility, visual quality, interaction), not by tool
- **Critique -> Triage -> Fix pipeline:** spawn critique priests in parallel, triage annotations, then dispatch self-driving priests to fix
- Priests get `isolation: "worktree"` for code work (no file conflicts)
- Synthesizes findings from all priests, resolves conflicts via design-judgment
- Works solo for simple tasks, spawns a team only when parallel work adds value
- Uses agent teams (`CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS`) for full inter-agent communication

### Optional Dependencies (Browser Capabilities)

For critique and self-driving modes, install:

```bash
# Browser control for agents
npx skills add vercel-labs/agent-browser

# Annotation MCP server
npx add-mcp "npx -y agentation-mcp server"

# Self-driving skill (symlink from agentation repo)
ln -s "$(pwd)/skills/agentation-self-driving" ~/.claude/skills/agentation-self-driving
```

These are optional. Without them, priests work in Figma and/or code only.

**When to use which:**

| Task | Agent |
|---|---|
| Single component, quick fix | Priest (solo) |
| Design audit from multiple angles | Archbishop (team) |
| Browser critique of a running app | Priest (critique mode) or Archbishop (parallel critique priests) |
| Autonomous review + fix | Priest (self-driving mode) |
| Code implementation touching many files | Archbishop (team with worktrees) |
| Full redesign (research + design + build) | Archbishop (team) |
