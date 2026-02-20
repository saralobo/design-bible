# Diamond 1: From "Something's Wrong" to "Here's the Problem"

A practical process for design engineers who work directly with clients.

---

## The Situation

A client shows up with *something*. It could be:
- A symptom: "our dashboard is confusing"
- A goal: "we need to increase retention"
- A feature request: "add a reporting page"
- A vibe: "it doesn't feel professional"
- A comparison: "we want something like what Stripe does"
- A panic: "users are leaving and we don't know why"

Every starting point is different. But the process is always the same three moves.

---

## Move 1: Listen and Capture

**Goal:** Get everything out of their head and into a document. Don't filter. Don't solve.

### The Session

You have a call or meeting with the client. Your only job is to make them talk and to write down what they say. You are a reporter, not a consultant — yet.

**Questions that make clients talk:**

Start wide, then narrow:

1. "Tell me about the project. What is it, who is it for?"
2. "What's working well right now?"
3. "What's frustrating you most?"
4. "What are your users telling you? Any support tickets, complaints, feedback?"
5. "If you could fix one thing overnight, what would it be?"
6. "What does success look like in 3 months?"
7. "What have you already tried?"
8. "What are the constraints I should know about?" (budget, timeline, tech, team)

**Rules for yourself during this phase:**

- Do NOT suggest solutions. If your brain screams "that's a nav problem," write it down privately but don't say it.
- Do NOT say "I think you should..." — not yet.
- DO ask "why?" and "can you give me an example?" and "what happened when...?"
- DO capture their exact words. "It feels clunky" is useful data. Don't translate it into your language yet.
- DO ask about their users, not just their opinions. "You say it's confusing — has a user told you that, or is that your sense?"

**What you capture:**

After the session, you should have a raw document with:

```
## Raw Capture: [Project Name] — [Date]

### What they told me
- [verbatim quotes and paraphrases, unfiltered]
- [everything, even contradictions]
- [especially contradictions]

### What they want (stated goals)
- [what they said they want to achieve]

### What they feel (symptoms)
- [frustrations, worries, things that "feel off"]

### What they've tried
- [previous attempts and why they didn't work]

### Constraints
- [budget, timeline, tech stack, team size, politics]

### Who are the users?
- [what I learned about actual users vs. assumed users]

### Red flags / contradictions
- [things that don't add up — these are gold]
```

### The Discipline Problem

This is where you said it breaks down — you jump to solutions too fast.

The fix is structural: **don't have the solution conversation and the problem conversation in the same session.** End the first call with: "I need to process everything you told me. I'll come back to you with what I think the real problems are, and then we'll talk about solutions."

This gives you permission to not solve anything yet. It gives the client confidence that you're being thorough. And it gives you time to think.

---

## Move 2: Reframe as Problems

**Goal:** Translate raw client input into clear problem statements. This is where thinking happens.

### The Technique: "What → Why → Who → Problem"

Take each thing the client said and run it through this:

**What** did they say?
→ "The dashboard is confusing"

**Why** is that happening? (You hypothesize — you don't need to be certain)
→ Because there are 40 metrics on one screen and no hierarchy

**Who** is affected and how?
→ Engineering managers can't find the 3 numbers they need for their standup

**Problem statement:**
→ "Engineering managers can't quickly extract the metrics they need from the dashboard because information density is too high and there's no hierarchy guiding their eyes."

That's a problem you can design against. "The dashboard is confusing" is not.

### Do this for everything in your raw capture

Some inputs will produce clear problems. Some will collapse into the same underlying problem (which is a good signal). Some will turn out to be symptoms of something deeper. Some won't be design problems at all — they're business problems, or tech debt, or organizational issues.

**Output format:**

```
## Problem Statements: [Project Name]

### Primary Problems (these need solving)
1. [Problem statement — clear, specific, names the user and the impact]
2. [Problem statement]
3. [Problem statement]

### Secondary Problems (real but lower priority)
4. [Problem statement]
5. [Problem statement]

### Not Design Problems (flag but don't own)
- [thing that's actually a business/org/tech issue]

### Open Questions (things I still don't understand)
- [stuff that needs more investigation]

### Hypotheses (my early instincts — NOT commitments)
- [what I think might be going on, held loosely]
```

### How many problems should you have?

If you have more than 5 primary problems, you haven't converged enough. Push yourself: which of these are actually the same problem wearing different masks?

If you have fewer than 2, you probably collapsed too fast. Are you sure there's only one thing going on?

3-5 primary problems is the sweet spot for most projects.

### The Writing Is the Thinking

This is where the writing helps you. You said you think by writing things out. This phase IS writing. You're not writing for the client yet — you're writing to figure out what you think.

Write out a problem statement. Read it back. Does it feel right? Does it capture what the client was actually saying? If it feels too generic ("users find it hard to use"), it's not a problem yet — it's a symptom. Push deeper.

Talk through it out loud. Does it make sense when you say it? If you can't explain the problem in one sentence to someone who doesn't know the project, you don't understand the problem yet.

Sketch. Draw the user's journey. Where do they get stuck? Where do they make mistakes? Where do they give up? The sketch isn't design — it's a thinking tool. You're mapping the problem space, not proposing solutions.

---

## Move 3: Validate and Align

**Goal:** Present the problems (NOT solutions) to the client and get agreement before you design anything.

### The Presentation

Go back to the client with your problem statements. This is a short, focused conversation:

"Based on everything you told me, here's what I think the actual problems are:

1. [Problem statement]
2. [Problem statement]
3. [Problem statement]

Before I start thinking about solutions, I want to make sure I got this right. Am I missing anything? Is the priority right?"

### What happens next

**Best case:** They say "yes, that's exactly it." You're aligned. Move to Diamond 2.

**Good case:** They correct you. "Actually #3 is more important than #1" or "you're missing something — the mobile experience is also broken." Great. Update your problems. You just avoided designing the wrong thing.

**Hard case:** They say "just show me designs." This happens. They want to skip to solutions. Resist gently: "I want to make sure we're solving the right problems first. If I design the wrong thing, we waste time. Let me validate these problems and then I'll move fast on solutions."

**Worst case:** You realize the problems are deeper than design. Maybe the product strategy is unclear, or the user base isn't who they think it is. Flag it honestly: "Before I can design effectively, we need to answer [X]. This is a product/business question, not a design question."

### The Output: A Brief

After validation, write a brief. This is the bridge between Diamond 1 and Diamond 2:

```
## Design Brief: [Project Name]

### Context
[1-2 sentences: what this project is, who it's for]

### Problems We're Solving (agreed with client)
1. [Problem statement]
2. [Problem statement]
3. [Problem statement]

### Out of Scope (agreed with client)
- [Things we're explicitly not touching]

### Success Criteria
- [How will we know the problems are solved?]
- [Specific, measurable if possible]

### Constraints
- [Tech, budget, timeline, team]

### What I'll Deliver
- [What the client will get and when]
```

This brief is the handoff to yourself. It's the input to Phase 0 of the design engineering framework. Everything in Diamond 2 — audit, tokens, design, build — flows from these problem statements.

---

## The Full Sequence

```
Client says something vague
        |
        v
   MOVE 1: LISTEN
   One call. Capture everything.
   Don't solve. Don't filter.
        |
        v
   [time to think — hours or days]
        |
        v
   MOVE 2: REFRAME
   Write problem statements.
   Sketch the problem space.
   Talk it through out loud.
   3-5 primary problems.
        |
        v
   MOVE 3: VALIDATE
   Present problems to client.
   Get corrections and alignment.
   Write the brief.
        |
        v
   DESIGN BRIEF
   -> feeds into /design-engineering
   -> Diamond 2 begins
```

---

## How Long Does This Take?

- Move 1: 1 session (30-60 min) + 30 min to write up raw capture
- Move 2: 1-4 hours of thinking and writing (depends on complexity)
- Move 3: 1 session (30 min) + 30 min to finalize brief

**Total: 1-2 days for most projects.** Not weeks. Not a big formal research phase. Just enough structure to make sure you're solving the right problem before you start designing the solution.

For bigger projects (multi-surface, enterprise, unclear users), Move 2 might take longer because you need to research or talk to actual users. But the structure stays the same.

---

## Common Traps

**"The client knows what they want."**
They know what they *feel*. They rarely know what the actual problem is. That's why you're there.

**"I don't have time for this, I need to start designing."**
You don't have time to design the wrong thing. Move 1-3 costs 1-2 days. Redesigning after you built the wrong thing costs weeks.

**"What if I get the problems wrong?"**
That's what Move 3 is for. You're not committing to a solution — you're proposing a problem definition and asking the client to correct you. It's low-risk.

**"The client keeps asking for features, not describing problems."**
Every feature request has a problem behind it. "Add a reporting page" → why? "Because I can't see how the team is performing." → Now you have a problem. The solution might not be a reporting page at all.

**"I feel like I'm not doing 'real work' because I'm not designing yet."**
Reframing problems IS the work. It's the most valuable thing you do. Anyone can push pixels. The person who figures out the right problem to solve is the one who makes the project succeed.
