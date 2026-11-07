---
name: my-requests
description: Show a collaborator what happened to their requests, list questions assigned to them, and help answer them. Use for "my requests", "any news", "any questions for me?", "what does the team need from me?", and "what's waiting for me?".
---

# My requests

Use this when the collaborator asks "my requests", "any news", "what happened to my request?", "any questions for me?", "what does the team need from me?", or "what's waiting for me?" Speak
plainly and keep messages short. Do not expose internal lifecycle names in collaborator-facing prose.
Never ask for, read, display, or store a password, credential, or token.

## Before listing requests

1. Run `gh auth status`. If login is needed, explain how to run `gh auth login` and choose GitHub.com,
   HTTPS, **Login with a web browser**, and **yes** to authenticating Git. Continue after login succeeds.
2. Prefer the `repo` value from current-directory `.h/h-req.json`. Otherwise run
   `gh repo view --json nameWithOwner`.
3. If neither finds the project, explain that this needs to be run inside the project's folder and stop.

## Questions waiting for you

Run:

```sh
gh issue list -R <repo> --assignee @me --state open --limit 200 --json number,title,url,labels
gh issue list -R <repo> --author @me --state open --limit 200 --json number
```

Drop every issue whose number is in the second list: the collaborator wrote those, and "My requests" below covers
them. If nothing is left, say so in one line ("No questions are waiting for you.") and continue to their
requests. Otherwise show these FIRST, under the heading "Questions waiting for you", by title, and offer
to go through one. Handle one issue at a time, when they pick it.

### Answering one

1. Fetch it: `gh issue view <number> -R <repo> --json body,comments`.
2. Show its questions in plain words, ONE OR TWO AT A TIME.
3. Help them decide each one. When they are unsure, offer two or three concrete options grounded in the
   project's own documents, and what each would mean. They may skip a question and come back to it later.
   Do not suggest "don't know" as an answer.
4. When all are answered, show the full answer and ask "Shall I send this?"
5. Only on a clear yes, write the answer to a temporary file (`mktemp`) and run
   `gh issue comment <number> -R <repo> --body-file <tmp>`. Then share the issue link and delete the file.
6. Never close, label, or reassign the issue. The maintainer does that.
7. For attachments, open the issue with `gh issue view <number> -R <repo> --web` and tell them to drag
   the files into a comment themselves. Never upload files any other way.

## My requests

Run:

```sh
gh issue list -R <repo> --author @me --state all --limit 200 --json number,title,state,labels,url
```

Keep open entries carrying `request`, `agent-needs-info`, `ready-for-approval`, or `agent-approved`, and
keep every closed entry. Describe each result using this priority and wording:

- Closed: **done**. Run
  `gh issue view <number> -R <repo> --json closedByPullRequestsReferences` and show the linked change
  that completed it when present.
- `agent-needs-info`: **a question for you**. Fetch the request's comments, show the latest question,
  and offer to help write an answer. Show the proposed answer and ask for confirmation before posting
  it with `gh issue comment <number> -R <repo> --body-file <tmp>` (write the answer to a temporary file first).
- `ready-for-approval`: **complete, waiting for approval**.
- `agent-approved`: **approved, being built**.
- `request`: **waiting to be looked at**.

Never post an answer without explicit confirmation.
