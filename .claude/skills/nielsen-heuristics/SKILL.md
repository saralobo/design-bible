---
name: nielsen-heuristics
description: "Nielsen's 10 Usability Heuristics, usability evaluation, heuristic review. Use when evaluating screen usability, reviewing designs for UX quality, or conducting design audits."
---

# Nielsen's 10 Usability Heuristics — Usability Evaluation

> Jakob Nielsen, 1994. Revised in 2024. The most cited heuristics in the UX world.
> Use as a CHECKLIST before finalizing any screen or flow.

---

## 1. VISIBILITY OF SYSTEM STATUS

**Definition**: The system should always keep the user informed about what is happening, through appropriate feedback within a reasonable time.

### CHECKLIST:
- [ ] Do actions show loading/spinner when processing?
- [ ] Does upload show a progress bar with percentage?
- [ ] Does the user know which step they're on (stepper/breadcrumbs)?
- [ ] Is the active tab/item visually highlighted?
- [ ] Does the form show which fields are filled?
- [ ] Is connection status visible when offline?
- [ ] Is item count visible (3 of 10, cart with 5 items)?

### PRACTICAL APPLICATION:
```
✅ "Sending... 45%" (with progress bar)
❌ (frozen screen with no feedback)

✅ "Step 2 of 4" with visual stepper
❌ (no indication of where in the flow)

✅ Badge with number on the cart icon
❌ Cart icon with no quantity indication
```

---

## 2. MATCH BETWEEN SYSTEM AND THE REAL WORLD

**Definition**: The system should speak the user's language, with words, phrases, and concepts familiar to the user, rather than system-oriented terms.

### CHECKLIST:
- [ ] Is the language natural (not technical)?
- [ ] Are icons universally recognizable?
- [ ] Do metaphors make sense (shopping cart, trash bin)?
- [ ] Is information in a natural logical order?
- [ ] Is data format familiar ($1,234.56, MM/DD/YYYY)?
- [ ] Are error messages human (not codes)?

### PRACTICAL APPLICATION:
```
✅ "Your payment was declined. Try another card."
❌ "Error 402: Payment declined. Code: INSUFFICIENT_FUNDS"

✅ "Shipping address"
❌ "Shipping address object input"

✅ Lock icon 🔒 for security
❌ Abstract icon nobody recognizes
```

---

## 3. USER CONTROL AND FREEDOM

**Definition**: Users often choose functions by mistake and need a clearly marked "emergency exit."

### CHECKLIST:
- [ ] Does every screen have a back or close button?
- [ ] Do destructive actions have undo?
- [ ] Can you cancel an upload/download in progress?
- [ ] Can you edit previously entered information?
- [ ] Can you exit a flow without losing everything?
- [ ] Does the modal close when clicking the overlay?
- [ ] Does the form auto-save drafts?

### PRACTICAL APPLICATION:
```
✅ Toast "Item deleted" with [Undo] button
❌ Item permanently deleted without warning

✅ ← Back button on every sub-screen
❌ Screen with no exit (have to close the app)

✅ "Are you sure? [Cancel] [Delete]"
❌ Deletes directly without confirmation
```

---

## 4. CONSISTENCY AND STANDARDS

**Definition**: Users should not have to wonder whether different words, situations, or actions mean the same thing.

### CHECKLIST:
- [ ] Does the same action have the same visual on all screens?
- [ ] Is the primary button ALWAYS the same color/style?
- [ ] Do icons mean the same thing throughout the app?
- [ ] Is terminology consistent (not "remove" on one screen and "delete" on another)?
- [ ] Is element positioning predictable screen to screen?
- [ ] Are header/footer the same on all screens of the same level?
- [ ] Is border-radius the same on all cards?

### PRACTICAL APPLICATION:
```
✅ "Sign out" on all screens
❌ "Sign out", "Log out", "Disconnect" on different screens

✅ Blue CTA on ALL screens
❌ Blue CTA on Home, green on checkout, purple on profile

✅ Back button always in the top-left corner
❌ Back button on the left on one screen, on the right on another
```

---

## 5. ERROR PREVENTION

**Definition**: Even better than good error messages is a careful design that prevents the error in the first place.

### CHECKLIST:
- [ ] Do fields with defined formats have masks (SSN, ZIP, phone)?
- [ ] Dropdown instead of free text when there are limited options?
- [ ] Confirmation before destructive actions?
- [ ] Disabled fields when not applicable (not hidden)?
- [ ] Real-time inline validation?
- [ ] Default values for fields when possible?
- [ ] Auto-save on long forms?

### PRACTICAL APPLICATION:
```
✅ Visual date picker instead of free text field
❌ "Enter the date in MM/DD/YYYY format" (user will make mistakes)

✅ "Delete" button gray/disabled when nothing is selected
❌ Active "Delete" button with nothing selected (error on click)

✅ ZIP with mask and automatic address lookup
❌ Free "Full address" field (everyone types differently)
```

---

## 6. RECOGNITION RATHER THAN RECALL

**Definition**: Minimize the user's memory load by making objects, actions, and options visible.

### CHECKLIST:
- [ ] Visible labels (not just placeholders that disappear)?
- [ ] Do icons HAVE text labels?
- [ ] Does recent search show history?
- [ ] Are saved addresses/payments visible?
- [ ] Is help/tooltip available without leaving the screen?
- [ ] Does action preview show the result before confirming?

### PRACTICAL APPLICATION:
```
✅ Bottom nav with icon + label "Home", "Search", "Profile"
❌ Bottom nav with only icons (have to memorize what each does)

✅ "Recent recipients" at the top of the payment flow
❌ Have to type the key from scratch every time

✅ Payment card shows "Visa •••• 1234" with the brand icon
❌ Just "Primary card" (which card?)
```

---

## 7. FLEXIBILITY AND EFFICIENCY OF USE

**Definition**: Accelerators — invisible to novices — can speed up interaction for experts.

### CHECKLIST:
- [ ] Shortcuts for frequent actions (favorites, recents)?
- [ ] Gestures as shortcuts (swipe to delete, long press)?
- [ ] Quick actions on home (quick transfer)?
- [ ] Customization possible (reorder, favorite)?
- [ ] Search available in relevant contexts?
- [ ] Copy/paste works in value fields?

### PRACTICAL APPLICATION:
```
✅ "Repeat last payment" on the home screen
✅ Swipe left to delete (shortcut for advanced users)
✅ QR Code as a shortcut for transfer
✅ Balance widget on phone home screen

❌ Forcing all steps every time (no shortcuts)
❌ Forcing tutorial every time the app opens
```

---

## 8. AESTHETIC AND MINIMALIST DESIGN

**Definition**: Interfaces should not contain irrelevant or rarely needed information. Every extra unit of information competes with the relevant units.

### CHECKLIST:
- [ ] Does each element on screen have a PURPOSE?
- [ ] Is secondary information collapsed/hidden?
- [ ] Is there enough breathing room?
- [ ] Maximum 3-4 information blocks per screen?
- [ ] Are colors limited (1 accent + neutrals + status)?
- [ ] Is typography limited (2 weights per screen)?
- [ ] Should decoration that doesn't communicate be removed?

### PRACTICAL APPLICATION:
```
✅ Balance screen: Large value + clean card + 3 quick actions
❌ Balance screen: Value + chart + 8 buttons + banner + notifications

✅ Transaction card: Logo + Name + Amount + Date
❌ Transaction card: Logo + Name + Amount + Date + Category + ID + Hash + Status + Type

✅ Generous white space (32-48px between sections)
❌ Everything crammed together, no visual breathing room
```

---

## 9. HELP USERS RECOGNIZE, DIAGNOSE, AND RECOVER FROM ERRORS

**Definition**: Error messages should be expressed in plain language, precisely indicate the problem, and constructively suggest a solution.

### Error Message Formula:
```
[WHAT happened] + [WHY it happened] + [WHAT to do]
```

### Examples:
```
✅ "Invalid SSN. Check that you entered all 9 digits correctly."
❌ "Error in SSN field"

✅ "Payment declined. Your bank didn't authorize. Try another card or contact your bank."
❌ "Payment failed"

✅ "No internet connection. Check your Wi-Fi and try again."
❌ "Network error"
```

### CHECKLIST:
- [ ] Message in human language (not code)?
- [ ] Indicates WHAT went wrong?
- [ ] Suggests HOW to fix it?
- [ ] Has a recovery action (retry button, help link)?
- [ ] Doesn't blame the user ("You made a mistake" → "The SSN appears invalid")?
- [ ] Is the error positioned near the relevant field?

---

## 10. HELP AND DOCUMENTATION

**Definition**: Even though the system should be usable without documentation, it may be necessary to provide help.

### CHECKLIST:
- [ ] Tooltips for complex fields/icons?
- [ ] Onboarding for new features?
- [ ] FAQ/Help accessible from within the app?
- [ ] Coach marks for first experience?
- [ ] Contextual help (help where needed, not on a separate page)?
- [ ] Chat/support accessible?

### PRACTICAL APPLICATION:
```
✅ (i) icon next to "Payment Key" that explains the types
✅ Coach mark on first use: "Tap here to send payment"
✅ Tooltip on complex field: "CVV is the 3 digits on the back of your card"

❌ Generic help page with no search
❌ 50-page PDF manual
❌ No help anywhere
```

---

## HOW TO USE THIS CHECKLIST

### Before finalizing any screen:
1. Go through each heuristic (1-10)
2. Answer each checklist question
3. If any answer is "NO" → fix it before delivering
4. Ask someone else to test (if possible)

### Severity Scale (when finding an issue):
| Level | Description | Action |
|---|---|---|
| 0 | Not a usability issue | Ignore |
| 1 | Cosmetic | Fix if time allows |
| 2 | Minor | Low priority |
| 3 | Major | High priority, fix before launch |
| 4 | Catastrophic | Fix IMMEDIATELY |
