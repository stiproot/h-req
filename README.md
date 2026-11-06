# h-req

h-req helps collaborators who are not engineers explain something they would like built, changed, or
fixed. It asks a few plain questions, shows the request before sending it, and can explain what is
happening with requests already sent.

It uses the collaborator's existing GitHub CLI login. It never handles a GitHub token itself.

## Install

In Claude Code, run:

```text
/plugin install h-req --marketplace stiproot/h-req
```

Then open the project folder and describe what you want. For example, in a recipe-sharing app: “I'd
like cooks to be able to save a recipe for later.” You can also ask “Any news on my requests?”

## Project setup

A maintainer adds `.h/request-rubric.md` to the project. This is the project's half of the checklist: it
can name the people the app serves, describe project principles as observable checks, and identify
sensitive areas that need special care. The plugin combines it with its built-in generic checklist.

If Git cannot identify the project from the current folder, a maintainer can add `.h/h-req.json`:

```json
{
  "repo": "fictional-cookbook/recipe-sharing-app"
}
```

This setting is optional. The value is the GitHub owner and project name.

## What happens after a request is sent

The plugin adds the `request` label. The project team then moves it through these stages:

- `request`: waiting to be looked at.
- `agent-needs-info`: there is a question for the collaborator.
- `ready-for-approval`: the request is complete and waiting for a maintainer's approval.
- `agent-approved`: a maintainer approved it and it is being built.
- closed: done; the plugin shows the change that completed it when one is linked.

Only a maintainer adds `agent-approved`.
