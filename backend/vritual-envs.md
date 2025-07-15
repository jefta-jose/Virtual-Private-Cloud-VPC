
### 🧩 What Are Dependencies?
When you install a library like SQLAlchemy, it often relies on other libraries to work properly. These are called **dependencies**. Pip installs them automatically, but if different projects need different versions of the same dependency, things can get messy.

### 🌍 Global Conflicts
By default, pip installs packages **globally** — meaning they’re available system-wide. This can lead to:
- **Version clashes** between projects
- **Unintended upgrades** or downgrades of shared libraries
- A chaotic environment where one project breaks another

### 🧪 Virtual Environments to the Rescue
A **virtual environment** is like a sandbox for your project:
- It isolates your project’s dependencies from the rest of your system.
- You can install packages without affecting other projects.
- It keeps things clean and conflict-free.

Here’s how to set one up:
```bash
# Create a virtual environment named 'venv'
python -m venv venv

# Activate it (Windows)
source venv/Scripts/activate

# Activate it (macOS/Linux)
source venv/bin/activate

# Now install SQLAlchemy safely inside the sandbox
pip install sqlalchemy
```

Once activated, any `pip install` will go into that environment — not your global Python setup.

### 🧠 Why It Matters
Imagine you're working on two projects:
- One needs SQLAlchemy v1.4
- Another needs v2.0

Without virtual environments, installing one version could break the other. With them, each project gets its own setup — no drama.

Want help setting up your first virtual environment or using it with VS Code or GitHub Actions? I’ve got your back.
