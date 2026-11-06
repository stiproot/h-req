---
name: my-requests
description: Show a collaborator what happened to their requests and help when there is a question for them.
---

# My requests

Use this when the collaborator asks "my requests", "any news", or "what happened to my request?" Speak
plainly and keep messages short. Do not expose internal lifecycle names in collaborator-facing prose.
Never ask for, read, display, or store a password, credential, or token.

## Before listing requests

1. Run `gh auth status`. If login is needed, explain how to run `gh auth login` and choose GitHub.com,
   HTTPS, **Login with a web browser**, and **yes** to authenticating Git. Continue after login succeeds.
2. Prefer the `repo` value from current-directory `.h/h-req.json`. Otherwise run
   `gh repo view --json nameWithOwner`.
3. If neither finds the project, explain that this needs to be run inside the project's folder and stop.

Run:

```sh
gh issue list -R <repo> --author @me --state all --json number,title,state,labels,url
```

Keep open entries carrying `request`, `agent-needs-info`, `ready-for-approval`, or `agent-approved`, and
keep every closed entry. Describe each result using this priority and wording:

- Closed: **done**. Run
  `gh issue view <number> -R <repo> --json closedByPullRequestsReferences` and show the linked change
  that completed it when present.
- `agent-needs-info`: **a question for you**. Fetch the request's comments, show the latest question,
  and offer to help write an answer. Show the proposed answer and ask for confirmation before posting
  it with `gh issue comment <number> -R <repo> --body <answer>`.
- `ready-for-approval`: **complete, waiting for approval**.
- `agent-approved`: **approved, being built**.
- `request`: **waiting to be looked at**.

Never post an answer without explicit confirmation.
