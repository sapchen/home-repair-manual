# CODEBUDDY.md

This file provides guidance to CodeBuddy Code when working with code in this repository.

## Project Overview

**家庭维修手册 (Home Repair Manual)** — a Chinese-language documentation book built with HonKit (successor to GitBook). It covers DIY repair guides for bicycles, home appliances, electronics, furniture, plumbing, lifestyle tips, and car upgrades. Content is in Simplified Chinese.

- **License**: CC BY-NC-SA 4.0 (content), CC BY-SA 4.0 (code in package.json)
- **Author**: _061837@bupt

## Commands

```bash
# Install dependencies
npm install

# Local dev server with live reload (default http://localhost:4000)
npm run serve
# or: npx honkit serve

# Production build (output to _book/)
npm run build
# or: npx honkit build

# Generate ebook formats
npm run pdf
npm run epub
npm run mobi
```

## Architecture

This is a **content-only project** — no application code, no tests, no linting. The entire codebase consists of Markdown documents and images organized into chapters.

### HonKit Build Pipeline

- `book.json` — HonKit configuration (title, language, styles, cover image, plugins)
- `SUMMARY.md` — Table of contents; defines the book structure and navigation. **Must be updated** when adding/removing/reordering chapters.
- `styles/website.css` — Website rendering styles
- `styles/epub.css` — EPUB rendering styles
- Output goes to `_book/` (gitignored)

### Content Structure

Chapters are numbered directories at the root level:

```
0-维修自行车/     Chapter 1: Bicycle repair
1-维修家电/       Chapter 2: Home appliances
2-维修电子设备/   Chapter 3: Electronics
3-维修家具/       Chapter 4: Furniture
4-改造管道/       Chapter 5: Plumbing
5-生活小技巧/     Chapter 6: Lifestyle tips
6-升级汽车/       Chapter 7: Car upgrades
```

Each chapter directory contains:
- `README.md` — Chapter landing page (typically a chapter cover image)
- `00-xxx.md`, `01-xxx.md`, ... — Individual articles, numbered sequentially
- `images/` — Chapter-specific images in subdirectories matching article names

### Image Conventions

- Images are stored under `images/<chapter-dir>/<article-dir>/<descriptive-name>.webp`
- Referenced in Markdown with absolute paths from project root: `![alt](/images/0-维修自行车/00-自己补胎/准备工具.webp)`
- Chapter cover images: `images/covers/cover.jpg`, `cover2.jpg`, etc.
- Book cover: `images/covers/cover.jpg`
- Logo: `images/logo/logo.png`

### Adding a New Article

1. Create `XX-<title>.md` in the appropriate chapter directory (XX = next sequential number)
2. Create matching image directory: `images/<chapter-dir>/XX-<title>/`
3. Add entry to `SUMMARY.md` under the correct chapter
4. Place images as `.webp` files and reference with absolute paths

### Adding a New Chapter

1. Create `<N>-<chapter-name>/` directory at root
2. Create `README.md` inside (chapter cover page)
3. Create `images/<N>-<chapter-name>/` for chapter images
4. Add chapter cover image to `images/covers/`
5. Add chapter and all articles to `SUMMARY.md`

### Special Pages

- `cover.md` — Book cover/front matter
- `back-cover.md` — Book back cover

## Deployment

GitHub Actions workflow (`.github/workflows/deploy.yml`) builds and deploys to GitHub Pages on push to `master`. Uses Node.js 22, runs `npx honkit build`, uploads `_book/` directory.
