# Request checklist — generic part

A request is ready when every MUST item here, and in the project's own checklist
(`.h/request-rubric.md`), is answered. SHOULD items are asked once; "don't know" is an acceptable answer
and is recorded as an open question.

## A0. Kind of request (decided from the conversation, then confirmed)

| Kind     | Output when built                      | Extra MUSTs                                                               |
| -------- | -------------------------------------- | ------------------------------------------------------------------------- |
| feature  | working behaviour in the app           | A1–A6                                                                     |
| change   | existing behaviour altered             | A1–A6, plus "what it does today"                                          |
| bug      | a fix                                  | A1, A3, plus steps to reproduce, what happened, what should have happened |
| research | a written decision (a spike), not code | the question, the options known, how the answer will be judged, a time box |

## A1. Who and why — MUST
- Who the change is for (a user type in the project's vocabulary, never "users").
- The problem in their words: what they are trying to do and what gets in the way today.

## A2. What they will see and do — MUST (feature/change)
- The steps of the main path, from where the person starts to where they finish.
- What the app shows or says at each step that matters.

## A3. Done means — MUST
- At least three acceptance checks a reviewer can answer yes/no without asking the requester. Each one
  names something observable ("the recipe list shows only recipes saved by this cook"), never a feeling
  ("it feels personal").

## A4. A concrete example — MUST
- At least one worked example with real-looking data: a specific person, specific items, the specific
  result.

## A5. Out of scope — MUST
- At least one thing this request deliberately does NOT include, so the build stays one pull request's worth.

## A6. Edges — SHOULD
- What happens when data is missing, empty or wrong; what happens on a slow or failed connection.

## A7. Size — judged, not asked
- If the request needs more than one pull request, propose splitting it and file the pieces as separate
  requests linked to a parent. A request is never filed larger than one pull request's worth.

## A8. Duplicates — searched, not asked
- Before filing, search open requests and show likely duplicates; the requester chooses to add to an
  existing one or file new.

## Issue shape

<one-paragraph summary in the requester's words>

===SPEC===
Kind: feature | change | bug | research
For: <A1 who>
Problem: <A1 why>
Main path:
  1. ...
Done means:
  - [ ] ...
Example: ...
Out of scope: ...
Edges: ...
<one line per section the project's checklist adds, under its own heading>
Open questions: <anything answered "don't know">
===END===

## Labels
The plugin adds `request`. Grooming moves a request to `agent-needs-info` (with a question as a comment)
or `ready-for-approval`. Only a maintainer adds `agent-approved`; nothing automatic ever does.
