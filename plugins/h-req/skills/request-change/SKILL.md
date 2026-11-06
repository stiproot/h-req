---
name: request-change
description: Help a collaborator ask for something to be built, changed, or fixed, including when they say something is broken or does not work.
---

# Request a change

Help the collaborator turn their words into a clear request. Speak plainly. Unless they use one first,
never say "issue", "PR", "spec", "label", "repo", or "rubric"; say "request", "the project", and "the
checklist". Keep messages short and ask only one or two questions at a time.

Never ask for, read, display, or store a password, credential, or token. GitHub access always uses the
collaborator's existing `gh` login.

## Before the first question

1. Run `gh auth status`. If the collaborator is not logged in, explain how to run `gh auth login` and
   choose GitHub.com, HTTPS, **Login with a web browser**, and **yes** to authenticating Git. Continue
   only after login succeeds.
2. Look for `.h/h-req.json` in the current directory. If it exists, read its `repo` value in
   `{"repo":"owner/name"}` form and use that project. Otherwise run
   `gh repo view --json nameWithOwner` and use `nameWithOwner`.
3. If neither method finds a project, say plainly that this needs to be run inside the project's folder,
   then stop.

## Build the request

Always read [references/rubric.md](references/rubric.md). Also read `.h/request-rubric.md` when it exists.
That project checklist supplies vocabulary to use in questions and in the filed text, principles that
become observable acceptance checks, and any sensitive areas to cover.

Use everything the collaborator has already said. Decide whether this is a feature, change, bug, or
research request and confirm that choice. Ask only for unanswered MUST items in the bundled and project
checklists. Ask each SHOULD item once. Accept "don't know" and put it under `Open questions`.

Judge size without asking about size. If the work is larger than one pull request, explain a proposed
split in plain words. If the collaborator agrees, prepare a parent request and one separately filed
request for each piece, linking every piece to the parent. Never file an oversized request as one piece.

Before filing, choose a few key words and run:

```sh
gh issue list -R <repo> --state open --search "<key words>"
```

Show likely matches by title and link. Let the collaborator choose whether to add to one or continue
with a new request. Before adding a comment to an existing request, show the proposed comment and get
confirmation. Use `gh issue comment` only after that confirmation.

Draft the body in the exact **Issue shape** from the bundled checklist, adding one line for each section
from the project checklist. Show the complete draft, then ask exactly: **Shall I send this?** Do not run
any create or comment command until the collaborator explicitly says yes. A request such as "draft it
but do NOT send it" must never create a request or post a comment.

After confirmation, write the body to a temporary file and run:

```sh
gh issue create -R <repo> --title <title> --label request --body-file <tmp>
```

Add only `request`. Never add, remove, or mention any other label in the collaborator-facing flow. Print
the resulting link.

If the collaborator mentions a screenshot, photo, or document, explain that files are added in the
browser. File the request first, then run `gh issue view <number> -R <repo> --web`. Tell them to drag the
files into a new comment and press **Comment**. Never upload a file another way and never paste its
contents into the request.
