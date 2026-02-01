#!/bin/bash

REPO_URL="https://github.com/pkwbim/windsurf-config"

show_help() {
  cat << EOF
Setup .windsurf submodule in a target directory

USAGE:
  $0 [OPTIONS] <target_directory>

OPTIONS:
  -h, --help          Show this help message
  -v, --verbose       Enable verbose output

ARGUMENTS:
  <target_directory>  Path to the target directory (can be empty)

EXAMPLES:
  # Basic usage
  $0 /path/to/project

  # With verbose output
  $0 --verbose /path/to/project

DESCRIPTION:
  This script initializes a git repository in the target directory
  and adds a .windsurf submodule from the specified repository.

  Repository: $REPO_URL

  Steps performed:
  1. Initialize git repository (if not already initialized)
  2. Add .windsurf submodule
  3. Update and initialize submodule recursively
  4. Commit changes with message "Add .windsurf submodule"

EOF
}

VERBOSE=0

while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      show_help
      exit 0
      ;;
    -v|--verbose)
      VERBOSE=1
      shift
      ;;
    *)
      break
      ;;
  esac
done

TARGET_DIR="$1"

if [ -z "$TARGET_DIR" ]; then
  echo "❌ Error: Missing required argument <target_directory>"
  echo ""
  show_help
  exit 1
fi

if [ $VERBOSE -eq 1 ]; then
  echo "📍 Target directory: $TARGET_DIR"
  echo "📦 Repository URL: $REPO_URL"
fi

cd "$TARGET_DIR" || exit 1

if [ ! -d .git ]; then
  if [ $VERBOSE -eq 1 ]; then
    echo "🔧 Initializing git repository..."
  fi
  git init
  git checkout -b main
fi

if [ $VERBOSE -eq 1 ]; then
  echo "📥 Adding .windsurf submodule..."
fi
git submodule add "$REPO_URL" .windsurf

if [ $VERBOSE -eq 1 ]; then
  echo "🔄 Updating submodule..."
fi
git submodule update --init --recursive

if [ $VERBOSE -eq 1 ]; then
  echo "💾 Committing changes..."
fi
git add .gitmodules .windsurf
git commit -m "Add .windsurf submodule"

echo "✅ Submodule setup completed!"
