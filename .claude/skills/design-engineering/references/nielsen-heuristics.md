# Nielsen's 10 Usability Heuristics — Deep Reference

Jakob Nielsen's 10 heuristics have been the standard for evaluating interface usability since 1994. They're lenses for evaluating whether your UI actually works for humans.

## The 10 Heuristics

### 1. Visibility of System Status
The system should always keep users informed about what's happening through appropriate, timely feedback.

**Applied:** Loading states, progress indicators, confirmation messages, real-time status updates. E.g., "Your booking is confirmed," "Driver is 5 min away," "Payment processed."

**Check:** Does the user always know what the system is doing? Are state changes communicated immediately?

### 2. Match Between System and Real World
Use language, concepts, and conventions familiar to the user — not system-oriented jargon.

**Applied:** Use "Book a Lesson" not "Create Session Instance." Use domain-appropriate metaphors. Icons should represent real-world objects users recognize.

**Check:** Would a non-technical user understand every label, button, and message?

### 3. User Control and Freedom
Users make mistakes. Provide clear "emergency exits" — undo, cancel, go back — without friction.

**Applied:** Cancel a booking, undo a rating, go back in a flow. Never trap users in a dead-end screen.

**Check:** Can users always escape the current state? Is undo available for destructive actions?

### 4. Consistency and Standards
Users shouldn't wonder whether different words, situations, or actions mean the same thing. Follow platform conventions.

**Applied:** If "Agendar" means "Book" in one place, use it everywhere. Follow iOS/Android conventions for navigation. This is where cross-surface consistency (Phase 5) becomes critical.

**Check:** Are labels, icons, and interactions consistent across all screens and surfaces?

### 5. Error Prevention
Even better than good error messages is design that prevents errors from occurring.

**Applied:** Disable the "Book" button when required fields are empty. Don't let users select an unavailable time slot. Confirm destructive actions.

**Check:** Are common mistakes structurally impossible? Are destructive actions gated?

### 6. Recognition Rather Than Recall
Minimize memory load. Make objects, actions, and options visible. Don't require users to remember information across screens.

**Applied:** Show the provider's name and photo on the booking confirmation, not just an ID. Display recent searches. Keep context visible during multi-step flows.

**Check:** Does the user need to remember anything from a previous screen to complete this task?

### 7. Flexibility and Efficiency of Use
Cater to both novice and expert users. Shortcuts and customization for power users.

**Applied:** Quick re-book with the same provider. Saved payment methods. Admin dashboard with bulk management features.

**Check:** Can expert users accomplish frequent tasks faster? Are there shortcuts for power users?

### 8. Aesthetic and Minimalist Design
Every extra element competes with relevant information. Keep interfaces focused on what matters.

**Applied:** Don't clutter the booking flow with marketing. The in-progress screen should show only what's essential: map, time, contact info.

**Check:** Can you remove any element without losing functionality? Is every pixel earning its space?

### 9. Help Users Recognize, Diagnose, and Recover from Errors
Error messages should be in plain language, precisely indicate the problem, and suggest a solution.

**Applied:** "This time slot was just booked by another user. Here are 3 similar slots available." Not "Error 409: Conflict."

**Check:** Does every error message explain what happened AND what the user can do about it?

### 10. Help and Documentation
It's best if the system works without docs, but provide searchable, task-focused help when needed.

**Applied:** Onboarding flow for first-time users. FAQ for common questions. In-context help for complex features like identity verification.

**Check:** Can a first-time user complete the core flow without external help?

---

## When to Evaluate

### During Design (Phase 3)
For each key screen, scan the top 5 heuristics that matter most:
- **Booking flow** -> #1 (status), #3 (control), #5 (error prevention)
- **Dashboard** -> #6 (recognition), #7 (flexibility), #8 (minimalism)
- **Onboarding** -> #2 (real world), #6 (recognition), #10 (help)
- **Error states** -> #1 (status), #9 (error recovery), #3 (control)

### During QA (Phase 4-5)
Walk through every core flow and score each heuristic 1-5. Anything below 3 needs attention before shipping. Takes 30-60 minutes per flow.

---

## Heuristic Audit Template

Copy this for each core flow:

```
HEURISTIC AUDIT
Flow: [e.g., User books a session]
Date: [Date]
Evaluator: [Name]

 #  Heuristic                        Score (1-5)   Notes
 1  Visibility of system status      ___           ___
 2  Match with real world            ___           ___
 3  User control and freedom         ___           ___
 4  Consistency and standards        ___           ___
 5  Error prevention                 ___           ___
 6  Recognition over recall          ___           ___
 7  Flexibility and efficiency       ___           ___
 8  Aesthetic and minimalist         ___           ___
 9  Error recovery                   ___           ___
10  Help and documentation           ___           ___

AVERAGE SCORE: ___
PRIORITY FIXES (top 3):
1. ___
2. ___
3. ___

PASS THRESHOLD: All heuristics >= 3
```

### Scoring Guide

| Score | Meaning |
|---|---|
| 1 | Violation — actively harms usability |
| 2 | Weak — noticeable friction, needs work |
| 3 | Adequate — functional but room for improvement |
| 4 | Good — well-implemented, minor polish possible |
| 5 | Excellent — best-in-class implementation |
