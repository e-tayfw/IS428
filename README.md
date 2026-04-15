# IS428 Visual Analytics Project — MC1: Sailor Shift and Oceanus Folk

A Quarto-based visual analytics website that traces Sailor Shift's rise to global stardom and the diffusion of Oceanus Folk through the wider music ecosystem. Built for the VAST Challenge 2025 Mini-Challenge 1 as part of **IS428 Visual Analytics for Business Intelligence** at Singapore Management University.

**Live site:** deployed via Vercel (see `vercel.json`).
**Report:** [Google Docs](https://docs.google.com/document/d/1KA-uyi1I4SQDHvP02JSvKpccqVfCqnmbfZ6sm0Dlxvo/edit?usp=drive_link)
**Tableau:** [Public dashboard](https://public.tableau.com/app/profile/ethan.tay2301/viz/IS428ProjectGroup1TableauVisualisations/SailorShiftandOceanusFolkImpactontheMusicIndustry?publish=yes)

---

## Project Overview

In 2040, journalist Silas Reed uses a large music knowledge graph to trace Sailor Shift's journey from her beginnings in the band Ivy Echoes (2023) to becoming the first Oceanus Folk artist to top global charts in 2028. This project transforms that knowledge graph into a set of visual analytics that reveal:

- Sailor Shift's career trajectory, collaboration network, and influence lineage.
- The outward diffusion of Oceanus Folk into other genres and its inward evolution.
- Early signals of emerging artists likely to achieve breakout success in the coming years.

The underlying data is a semi-structured graph with roughly 17,000 nodes and 37,000 edges describing artists, bands, releases, record labels, genres, collaborations, and influence relationships.

## Analytical Objectives

The project is organised around five focused analyses, each contributing a distinct perspective to the same knowledge graph:

1. **Sailor Shift Career Trajectory Analysis** — temporal development of Sailor Shift's career through her release history, popularity trends, and genre transitions.
2. **Sailor Shift Influence and Lineage Analysis** — inward and outward influence flows tracing who shaped her artistic development and whom she later influenced.
3. **Sailor Shift Collaboration and Network Analysis** — band affiliations, collaborations, and production relationships that drive visibility and cross-community reach.
4. **Oceanus Folk Genre Diffusion and Evolution Analysis** — the outward spread of Oceanus Folk into other genres and the inward evolution of the genre itself.
5. **Emerging Artist and Rising Star Analysis** — data-driven profile of a rising star, applied to predict future breakout artists.

## Tech Stack

| Layer | Tool | Purpose |
|-------|------|---------|
| Site generator | **Quarto** | Multi-page static website from `.qmd` files |
| Styling | **Custom CSS** (`styles.css`) | Design tokens, cards, grids, accordions, timeline, people grid |
| Network construction | **Python** (NetworkX, pandas) | Filter raw JSON graph into analysis-specific GEXF/CSV files |
| Graph visualisation | **Gephi** | Ego networks, force-directed layouts, community detection, centrality-based styling |
| Dashboarding | **Tableau Public** | Temporal charts, bar charts, diffusion visualisations |
| Deployment | **Vercel** | Static hosting (see `vercel.json`) |

## Website Structure

The site has **seven** pages, registered in `_quarto.yml`:

| Page | File | Role |
|------|------|------|
| Home | `index.qmd` | Hero banner, project overview, scope carousel, and links to all core pages |
| Proposal | `proposal.qmd` | Motivation, problem statement, five analytical objectives (accordion), and Week 9 – Week 14 timeline |
| Data | `data.qmd` | Raw data sources (`MC1_graph.json`, `mc1_edges.csv`, `mc1_nodes.csv`) and the Python-generated CSVs used by Tableau |
| Methodology | `methodology.qmd` | Dataset, workflow, and per-analysis design choices including visual encoding channels for each network |
| Insights | `insights.qmd` | Full analytical findings: figures, interpretation, and references to the Google Doc report, GitHub repo, and Tableau dashboards |
| Poster | `poster.qmd` | Final poster (PNG preview and PDF download) |
| About | `about.qmd` | Teaching professor, student authors, and key takeaways from the project |

Navigation is configured in `_quarto.yml`: `Home`, `Proposal`, `Data`, `Methodology`, `Insights`, `Poster` on the left; `About` on the right next to the search icon.

## Authors

- **Hann Danish Bin Mohd Nazry** — Year 4 Business Student, Singapore Management University
- **Leong Rui Tao** — Year 4 Information Systems Student, Singapore Management University
- **Ethan Tay Fu Wen** — Year 4 Information Systems Student, Singapore Management University

**Teaching Professor:** Prof. Kam Tin Seong, Associate Professor of Information Systems, Singapore Management University.

## Project Structure

```text
.
├── _quarto.yml           # Site config — navbar, render list, theme
├── README.md             # This file
├── styles.css            # Centralised styling for the whole site
├── build.sh              # Convenience build script used by deployment
├── vercel.json           # Vercel static hosting config
│
├── index.qmd             # Home
├── proposal.qmd          # Proposal
├── data.qmd              # Data Sources and Preparation
├── methodology.qmd       # Methodology
├── insights.qmd          # Analysis & Insights
├── poster.qmd            # Poster
├── about.qmd             # About (faculty, authors, key takeaways)
│
├── images/               # All static assets referenced by the site
│   ├── about/            # Portrait photos for the About page
│   │   ├── kam-tin-seong.jpg
│   │   ├── hann-danish.jpg
│   │   ├── leong-rui-tao.jpg
│   │   └── ethan-tay.png
│   ├── fig1-ego-network.png … fig14-rising-star-3.png
│   ├── proposal-timeline.png
│   ├── poster.png
│   └── poster.pdf
│
├── _site/                # Rendered HTML output (generated — do not edit)
├── _quarto_cache/        # Quarto local cache (generated)
└── .gitignore
```

## External Resources

- **Full Report (Google Docs):** <https://docs.google.com/document/d/1KA-uyi1I4SQDHvP02JSvKpccqVfCqnmbfZ6sm0Dlxvo/edit?usp=drive_link>
- **Source Code (GitHub):** <https://github.com/e-tayfw/IS428>
- **Tableau Dashboards:** <https://public.tableau.com/app/profile/ethan.tay2301/viz/IS428ProjectGroup1TableauVisualisations/SailorShiftandOceanusFolkImpactontheMusicIndustry?publish=yes>
- **Raw Data and Intermediate CSVs:** linked from the Data page via Google Drive.

## Running Locally

### Prerequisites

Install [Quarto](https://quarto.org/docs/get-started/) (version 1.4+ recommended):

```bash
quarto --version
```

### Live Preview

While editing content, start Quarto's live-reloading preview:

```bash
quarto preview
```

To bind a fixed port and skip the browser auto-open:

```bash
quarto preview --no-browser --port 4200
```

### Full Render

Build the complete static site into `_site/`:

```bash
quarto render
```

Or use the bundled convenience script (matches the deployment build):

```bash
./build.sh
```

Render a single page (useful while iterating):

```bash
quarto render about.qmd
```

## Deployment

The site is deployed as a static website on **Vercel**. Deployment configuration lives in `vercel.json`, and `build.sh` is the build command used by Vercel to render the Quarto project into `_site/`.

## Recommended Editing Workflow

1. Pull latest `main`.
2. Run `quarto preview` in one terminal to get live reload.
3. Edit the relevant `.qmd` file — content sections are mostly markdown, with embedded raw HTML blocks (`` ```{=html} ``) for custom cards, carousels, and accordions.
4. Update `styles.css` if a change requires new classes or tokens. All visual tokens (colours, radii, shadows) are declared in the `:root` block at the top of the stylesheet.
5. Verify with `quarto render` before committing.
6. Commit only source files — never `_site/` or `.quarto/`.

## Styling Notes

All visual styling lives in `styles.css`. Key design tokens are exposed as CSS variables at the top of the file:

```css
--site-bg, --site-surface, --site-ink, --site-muted,
--site-primary, --site-primary-soft, --site-accent,
--site-shadow, --site-radius-lg, --site-radius-md
```

Reusable patterns include `.feature-card`, `.proposal-card`, `.scope-card`, `.methodology-step`, `.insights-figure`, `.people-grid` / `.person-card`, `.takeaway-card`, and `.timeline-image-shell`.

## Git Ignore Notes

The following are ignored and should **not** be committed:

- `.quarto/` — local Quarto cache
- `_site/` — generated HTML output
- `**/*.quarto_ipynb` — temporary notebook-related files
- Large raw data files under any local `data/` or `datasets/` folder

## Summary

This repository hosts the IS428 MC1 Visual Analytics Project by Hann Danish, Leong Rui Tao, and Ethan Tay, supervised by Prof. Kam Tin Seong. Using Python, Gephi, Tableau, and Quarto, it transforms the VAST 2025 MC1 music knowledge graph into a seven-page visual analytics website that traces Sailor Shift's career, the global diffusion of Oceanus Folk, and the characteristics of future breakout artists.
