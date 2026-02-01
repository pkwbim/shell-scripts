# Shell Scripts

Collection of useful shell scripts for development and automation.

## Scripts

### setup-submodule.sh

Setup `.windsurf` submodule in a target directory.

**Most Common:**

```bash
curl -fsSL https://raw.githubusercontent.com/pkwbim/shell-scripts/main/setup-submodule.sh | bash -s -- --verbose .
```

**Quick Usage:**

```bash
# Direct execution from GitHub (no download needed)
curl -fsSL https://raw.githubusercontent.com/pkwbim/shell-scripts/main/setup-submodule.sh | bash -s -- /path/to/project

# With verbose output
curl -fsSL https://raw.githubusercontent.com/pkwbim/shell-scripts/main/setup-submodule.sh | bash -s -- --verbose /path/to/project

# Use current directory
curl -fsSL https://raw.githubusercontent.com/pkwbim/shell-scripts/main/setup-submodule.sh | bash -s -- "$PWD"
```


**What it does:**
1. Initializes git repository (if not already initialized)
2. Adds `.windsurf` submodule from `https://github.com/pkwbim/windsurf-config`
3. Updates and initializes submodule recursively
4. Commits changes

**Options:**
- `-h, --help`: Show help message
- `-v, --verbose`: Enable verbose output

## Installation

No installation needed! Use the direct execution commands above.

If you prefer to download:

```bash
# Download the script
curl -fsSL https://raw.githubusercontent.com/pkwbim/shell-scripts/main/setup-submodule.sh -o setup-submodule.sh

# Make it executable
chmod +x setup-submodule.sh

# Run it
./setup-submodule.sh /path/to/project
```

## License

MIT
