# Integrations Hub

> Convert the Platform Agency roster into every major agentic IDE with two scripts: `convert` to rebuild artifacts, `install` to drop them into place.

## TL;DR
```bash
# Step 1 – regenerate integrations after editing agents
./scripts/convert.sh

# Step 2 – install everywhere (auto-detects what you have configured)
./scripts/install.sh

# Or target a specific tool
./scripts/install.sh --tool claude-code
./scripts/install.sh --tool cursor
./scripts/install.sh --tool windsurf
./scripts/install.sh --tool aider
./scripts/install.sh --tool gemini-cli
./scripts/install.sh --tool antigravity
./scripts/install.sh --tool opencode
```

Regenerate whenever you add or update agents; the `integrations/` directory is rewritten each time `convert.sh` runs.

## Supported Tools

| Tool | Format emitted in `integrations/` | Installer target |
| --- | --- | --- |
| Claude Code | Markdown agents in `claude-code/` | `~/.claude/agents/` |
| Cursor | `.mdc` rules in `cursor/rules/` | `<project>/.cursor/rules/` |
| Windsurf | `.windsurfrules` | `<project>/.windsurfrules` |
| Aider | `CONVENTIONS.md` | `<project>/CONVENTIONS.md` |
| Gemini CLI | Extension + `SKILL.md` files in `gemini-cli/` | `~/.gemini/extensions/agency-devops/` |
| Antigravity | Skill folders in `antigravity/` | `~/.gemini/antigravity/skills/` |
| OpenCode | Agent pack in `opencode/` | `<project>/.opencode/agent/` |

Each subfolder also includes a focused README with extra detail.

---

## Claude Code
Agents were authored for Claude Code first, so no conversion magic is required—copy the generated Markdown files directly:

```bash
./scripts/convert.sh
cp integrations/claude-code/*.md ~/.claude/agents/
# or
./scripts/install.sh --tool claude-code
```

Claude Code will list every agent when you ask, “Use <Agent Name>”.

---

## Cursor
Each agent becomes a `.mdc` rule scoped to your project. Run the installer from the repository you want Cursor to load rules from:

```bash
cd /path/to/project
/path/to/platform-agency-agents/scripts/install.sh --tool cursor
```

Cursor automatically ingests `.cursor/rules/` when the workspace opens.

---

## Windsurf
All agents are merged into a single `.windsurfrules` file so Windsurf can keep the guidance always-on:

```bash
./scripts/install.sh --tool windsurf
# writes <repo>/.windsurfrules
```

Commit the file if you want collaborators to get the same guardrails.

---

## Aider
The installer writes `CONVENTIONS.md` at the repository root with every agent’s guidance merged together:

```bash
./scripts/install.sh --tool aider
```

Aider picks up the conventions file automatically at launch.

---

## Gemini CLI
Agents are packaged as a Gemini CLI extension with individual skills so you can enable/disable them selectively:

```bash
./scripts/install.sh --tool gemini-cli
# installs to ~/.gemini/extensions/agency-devops/
```

List them with `gemini skill list`.

---

## Antigravity
Each agent becomes a standalone skill folder dropped into the Antigravity skills directory:

```bash
./scripts/install.sh --tool antigravity
# installs to ~/.gemini/antigravity/skills/
```

---

## OpenCode
OpenCode consumes `.md` instructions under `.opencode/agent/`. Use the installer from the project root:

```bash
cd /path/to/project
/path/to/platform-agency-agents/scripts/install.sh --tool opencode
```

---

## Manual Copy
Need to paste an agent into another tool (Copilot Chat, Gemini Workspace, bespoke IDE)? Just open any Markdown file under the division folders (`foundation/`, `delivery/`, etc.) or the generated integration artifacts and copy/paste. The agents were written to stand alone without conversion.
