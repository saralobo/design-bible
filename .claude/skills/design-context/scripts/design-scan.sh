#!/usr/bin/env bash
# design-scan.sh — Discovers design context in a codebase
# Exploratory, not prescriptive. Reports what it finds, flags what's absent.
# Runs OUTSIDE the context window. Target: <120 lines output.

ROOT="${1:-.}"
cd "$ROOT" 2>/dev/null || { echo "ERROR: Cannot access $ROOT"; exit 1; }

echo "=== DESIGN CONTEXT SCAN ==="
echo "Project: $(basename "$(pwd)")"
echo "Scanned: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo ""

########################################################################
# 1. DOCUMENTS — any written context that already exists
########################################################################
echo "## Written Context"

# Markdown/text docs (any, not just design-specific names)
DOCS=$(find . -maxdepth 3 \( -name "*.md" -o -name "*.txt" -o -name "*.rst" \) \
  ! -path "*/node_modules/*" ! -path "*/.git/*" ! -name "CHANGELOG*" ! -name "LICENSE*" \
  2>/dev/null | sort)
if [ -n "$DOCS" ]; then
  echo "  Markdown/text files:"
  echo "$DOCS" | while read -r f; do
    LINES=$(wc -l < "$f" 2>/dev/null || echo "?")
    echo "    $f ($LINES lines)"
  done | head -20
  DOC_COUNT=$(echo "$DOCS" | wc -l)
  [ "$DOC_COUNT" -gt 20 ] && echo "    ... and $((DOC_COUNT - 20)) more"
fi

# ADRs (Architecture Decision Records)
ADR_DIR=$(find . -maxdepth 3 -type d -iname "adr*" ! -path "*/node_modules/*" 2>/dev/null | head -1 || true)
[ -n "$ADR_DIR" ] && echo "  ADRs: $ADR_DIR/ ($(find "$ADR_DIR" -type f | wc -l) files)"

# PDFs, images, design files in the repo
PDFS=$(find . -maxdepth 3 -name "*.pdf" ! -path "*/node_modules/*" 2>/dev/null)
IMAGES=$(find . -maxdepth 3 \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.webp" -o -name "*.gif" \) \
  ! -path "*/node_modules/*" ! -path "*/public/icons/*" ! -path "*/.next/*" 2>/dev/null)
SKETCH=$(find . -maxdepth 3 \( -name "*.sketch" -o -name "*.fig" -o -name "*.xd" \) ! -path "*/node_modules/*" 2>/dev/null)

[ -n "$PDFS" ] && echo "  PDFs: $(echo "$PDFS" | wc -l) files" && echo "$PDFS" | head -5 | sed 's/^/    /'
[ -n "$IMAGES" ] && echo "  Images (non-icon): $(echo "$IMAGES" | wc -l) files"
[ -n "$SKETCH" ] && echo "  Design files: $(echo "$SKETCH" | wc -l) files" && echo "$SKETCH" | head -5 | sed 's/^/    /'

echo ""

########################################################################
# 2. EXTERNAL LINKS — references to tools and resources outside the repo
########################################################################
echo "## External Links (found in repo files)"

# Search all text-readable files for known design tool URLs
LINK_PATTERNS="figma.com|storybook|chromatic.com|zeroheight.com|notion.so|confluence|zeplin.io|invisionapp|abstract.com|whimsical.com|miro.com|excalidraw|penpot.app|framer.com"
LINKS=$(grep -roh "https\?://[^ \"')\`>]*" --include="*.md" --include="*.txt" --include="*.json" --include="*.ts" --include="*.tsx" --include="*.js" --include="*.jsx" --include="*.yaml" --include="*.yml" --include="*.html" --include="*.css" . 2>/dev/null \
  | grep -iE "$LINK_PATTERNS" | sort -u || true)

if [ -n "$LINKS" ]; then
  echo "$LINKS" | while read -r url; do
    # Classify the link
    case "$url" in
      *figma.com*)     echo "  Figma: $url" ;;
      *storybook*)     echo "  Storybook: $url" ;;
      *chromatic.com*) echo "  Chromatic: $url" ;;
      *zeroheight*)    echo "  Zeroheight: $url" ;;
      *notion.so*)     echo "  Notion: $url" ;;
      *confluence*)    echo "  Confluence: $url" ;;
      *zeplin*)        echo "  Zeplin: $url" ;;
      *invision*)      echo "  InVision: $url" ;;
      *miro.com*)      echo "  Miro: $url" ;;
      *excalidraw*)    echo "  Excalidraw: $url" ;;
      *penpot*)        echo "  Penpot: $url" ;;
      *framer.com*)    echo "  Framer: $url" ;;
      *)               echo "  Link: $url" ;;
    esac
  done | head -15
else
  echo "  NONE FOUND"
fi

# Storybook config (could be local, not just a link)
for sb in .storybook/main.ts .storybook/main.js .storybook/main.mjs storybook.config.js; do
  [ -f "$sb" ] && echo "  Storybook config: $sb (local setup)" && break
done

echo ""

########################################################################
# 3. CODE — design decisions embedded in the implementation
########################################################################
echo "## Code: Design Tokens & System"

# Tailwind / CSS tokens
for cfg in tailwind.config.ts tailwind.config.js tailwind.config.mjs; do
  if [ -f "$cfg" ]; then
    echo "  Config: $cfg"
    # Color definitions
    COLORS=$(grep -E "(primary|secondary|accent|background|foreground|border|muted|destructive|warning|success)" "$cfg" 2>/dev/null | head -10 || true)
    [ -n "$COLORS" ] && echo "$COLORS" | sed 's/^/    /'
    CSSVAR_COUNT=$(grep -c "var(--" "$cfg" 2>/dev/null || echo "0")
    [ "$CSSVAR_COUNT" -gt 0 ] && echo "    -> $CSSVAR_COUNT CSS variable references"
    HAS_SPACING=$(grep -c "spacing" "$cfg" 2>/dev/null || echo "0")
    [ "$HAS_SPACING" -gt 0 ] && echo "    -> Custom spacing defined" || echo "    -> Default spacing"
    break
  fi
done

# CSS custom properties
for css in src/app/globals.css app/globals.css src/styles/globals.css src/index.css styles/globals.css; do
  if [ -f "$css" ]; then
    echo "  CSS vars: $css"
    grep -E "^\s*--" "$css" 2>/dev/null | head -10 | sed 's/^/    /'
    break
  fi
done

# Token/theme files (any naming)
TOKEN_FILES=$(find . -maxdepth 3 \( -name "tokens.*" -o -name "theme.*" -o -name "variables.*" -o -name "design-tokens.*" \) \
  ! -path "*/node_modules/*" ! -path "*/.next/*" 2>/dev/null || true)
[ -n "$TOKEN_FILES" ] && echo "  Token files:" && echo "$TOKEN_FILES" | sed 's/^/    /'

# Hardcoded color consistency check
HEX_UNIQUE=$(grep -roh '#[0-9a-fA-F]\{6\}' --include="*.tsx" --include="*.jsx" --include="*.css" --include="*.scss" . 2>/dev/null \
  | sort -u | wc -l || echo "0")
echo "  Hardcoded hex colors: $HEX_UNIQUE unique values"
[ "$HEX_UNIQUE" -gt 20 ] && echo "  WARNING: HIGH — likely inconsistent"

echo ""

echo "## Code: Typography"
FONTS=$(grep -rh "font-family\|fontFamily\|@import.*font\|next/font\|google.*font" \
  --include="*.ts" --include="*.tsx" --include="*.js" --include="*.jsx" --include="*.css" . 2>/dev/null \
  | sort -u | head -5 || true)
[ -n "$FONTS" ] && echo "$FONTS" | sed 's/^/  /' || echo "  No font declarations found"

echo ""

echo "## Code: Dependencies"
if [ -f "package.json" ]; then
  # UI / components
  for lib in "@shadcn" "shadcn" "@radix-ui" "@mui/material" "@chakra-ui" "@mantine" "antd" "@headlessui" "daisyui" "@nextui" "flowbite"; do
    grep -q "\"$lib" package.json 2>/dev/null && echo "  UI: $lib"
  done
  # Icons
  for lib in "lucide-react" "@heroicons" "phosphor-react" "@phosphor-icons" "react-icons" "@tabler/icons" "@iconify"; do
    grep -q "\"$lib" package.json 2>/dev/null && echo "  Icons: $lib"
  done
  # Animation
  for lib in "framer-motion" "@react-spring" "react-transition-group" "gsap" "animejs"; do
    grep -q "\"$lib" package.json 2>/dev/null && echo "  Animation: $lib"
  done
  # CSS tooling
  for lib in "tailwindcss" "sass" "styled-components" "@emotion" "vanilla-extract" "linaria" "stitches"; do
    grep -q "\"$lib" package.json 2>/dev/null && echo "  Styling: $lib"
  done
fi

echo ""

echo "## Code: Component Structure"
COMP_DIRS=$(find . -maxdepth 3 -type d \( -name "components" -o -name "ui" \) ! -path "*/node_modules/*" 2>/dev/null || true)
if [ -n "$COMP_DIRS" ]; then
  for dir in $COMP_DIRS; do
    COUNT=$(find "$dir" -maxdepth 2 \( -name "*.tsx" -o -name "*.jsx" \) 2>/dev/null | wc -l || echo "0")
    [ "$COUNT" -gt 0 ] && echo "  $dir/ — $COUNT files"
  done
fi
SVG_COUNT=$(find . -name "*.svg" ! -path "*/node_modules/*" 2>/dev/null | wc -l || echo "0")
echo "  SVG files: $SVG_COUNT"

echo ""

echo "## Code: Pages & Structure"
PAGES=$(find . -maxdepth 4 -name "page.tsx" -o -name "page.jsx" -o -name "page.js" 2>/dev/null \
  | grep -v node_modules | wc -l || echo "0")
ROUTES=$(find . -maxdepth 4 -path "*/pages/*.tsx" -o -path "*/pages/*.jsx" 2>/dev/null \
  | grep -v node_modules | grep -v "_" | wc -l || echo "0")
[ "$PAGES" -gt 0 ] && echo "  App Router pages: $PAGES"
[ "$ROUTES" -gt 0 ] && echo "  Pages Router routes: $ROUTES"
LAYOUTS=$(find . -maxdepth 4 \( -name "layout.tsx" -o -name "layout.jsx" \) 2>/dev/null \
  | grep -v node_modules | head -5 || true)
[ -n "$LAYOUTS" ] && echo "$LAYOUTS" | sed 's/^/  Layout: /'

echo ""

########################################################################
# 4. COMMENTS — design rationale buried in code
########################################################################
echo "## Design Rationale in Code Comments"
# Look for comments that explain design decisions
DESIGN_COMMENTS=$(grep -rn "TODO.*design\|FIXME.*design\|HACK.*design\|NOTE.*design\|XXX.*design\|// design\|// UX\|// UI\|// style\|// layout\|// a11y\|// accessibility\|/\* design\|/\* UX" \
  --include="*.ts" --include="*.tsx" --include="*.js" --include="*.jsx" --include="*.css" . 2>/dev/null \
  | grep -v node_modules | head -10 || true)
if [ -n "$DESIGN_COMMENTS" ]; then
  echo "$DESIGN_COMMENTS" | sed 's/^/  /'
else
  echo "  None found"
fi

echo ""

########################################################################
# 5. SUMMARY
########################################################################
echo "## Quick Assessment"
# What we know
echo "  CAN INFER FROM CODE:"
echo "    Colors, typography, spacing, dependencies, components, pages, assets"
echo ""
echo "  CANNOT INFER — NEEDS HUMAN INPUT:"
echo "    - Where does the design source of truth live? (Figma? Sketch? Notion? Someone's head?)"
echo "    - What are the core user flows?"
echo "    - Why were these specific design decisions made?"
echo "    - What's the brand identity and where is it documented?"
echo "    - Are there other surfaces beyond this codebase? (mobile app, marketing site, etc.)"
echo "    - Who owns design decisions on this project?"
echo ""
echo "=== END SCAN ==="
