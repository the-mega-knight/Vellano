# Vellano Brand Identity — Claude Working Document

This file is the single source of truth for all AI-assisted work on the Vellano Shopify theme.
Load this before making any design, copy, or code decisions.

---

## 1. Brand Guidelines

### Visual Aesthetic
Clinical yet luxurious. Premium skincare meets high-end hardware.
Think Aesop or premium dermatological brands — minimal clutter, fine 1px borders, structured layouts.

### Core Colors
| Role | Hex | Usage |
|------|-----|-------|
| Primary Background | `#F8F6F3` | Cream/off-white — headers, footers, hero sections |
| Secondary Background | `#FFFFFF` | Crisp white — content areas |
| Primary Text | `#111111` | Deep black — all headings and body text |
| Borders | `#E8E4DF` | Fine 1px borders on cards, dividers |
| Accent | `#B8A07A` | Warm sand/gold — subtle luxury touches, highlights |

### Typography
| Role | Font | Weight | Notes |
|------|------|--------|-------|
| Headings | Playfair Display | 400–700 | Elegant serif — conveys premium luxury |
| Body / UI | Inter or Jost | 400–600 | Clean sans-serif — clinical readability |

### Tone of Voice
- Authoritative, scientific, premium, and reassuring
- We don't sell shower heads — we sell a **skincare ecosystem**
- Use precise scientific language: redox reactions, lipid barriers, KDF-55 filtration matrices, pH 5.5 acid mantle
- Never dumbed down; always evidence-backed
- Confident, not pushy

---

## 2. Design References & Inspiration

### Primary Reference: Hello Klean
- Multi-step bundle quiz UX
- Header navigation structure
- Clean, minimalist, highly functional aesthetic

### Secondary References
- **Aesop** — understated luxury, editorial copy, minimal UI
- **Premium dermatological brands** — clinical trust signals, lab-like cleanliness

### Design Patterns We Use
- Smooth fade-up scroll animations
- Bento Box grid layouts
- 1px borders (`#E8E4DF`) — never heavy shadows
- 16px border-radius on image cards and grids
- Sticky elements (header, ATC button on product pages)
- Cart drawer (not cart page)

---

## 3. Conversion Priorities

### Hero Product
The **Filtered Shower Head + Filtration System** is the core product — everything else orbits it.
All design, copy, and conversion decisions should serve this product first.

### 1. Bundle Upsell (Highest Priority)
Entry point is the shower head/filtration system → upsell to the Complete System:
- **Hero:** Filtered Shower Head + Filtration System (the main sell)
- 1-Year Filter Refills (recurring revenue)
- Hard Water Body Cleanser (complementary skincare)
- Vitamin C Attachment (upgrade/add-on)

### 2. Quiz Funnel
Drive traffic to "Take the Quiz" — personalized solution for hair/skin concerns.
Quiz completion = high-intent customer who feels understood.

### 3. Frictionless Cart
- Sliding cart drawer (always accessible)
- Sticky "Add to Cart" on product pages
- Minimize steps to purchase

---

## 4. Target Customer

**Primary:** Women, 25–45, skincare and haircare invested
**Problem they have:** Still experiencing breakouts, eczema, dull/brittle hair despite good routines — caused by tap water
**What converts them:**
- Science-backed claims ("Restores pH 5.5 Acid Mantle", "Removes 98% of Chlorine")
- Before/after visual results
- Products that look beautiful in a modern bathroom
- Feeling like they discovered the missing piece of their routine

---

## 5. Competitive Landscape

### Direct Competitors (Filtered Shower Head Space)
- **Jolie** — closest 1:1 competitor, strong DTC brand, minimalist aesthetic
- **Hello Klean** — our UX reference; strong quiz funnel
- **Aquasana / Berkey** — utility-focused, less premium, older demographic

### Our Differentiators
- Clinical scientific positioning (not just "wellness")
- Multi-layer filtration (KDF-55, redox, vitamin C)
- Full skincare ecosystem framing (not just hardware)
- Premium aesthetic that belongs in a luxury bathroom
- Bundle + refill subscription model

### What to Avoid
- Looking "water filter utility" — we are skincare, not plumbing
- Generic wellness soft claims — always be specific and scientific
- Heavy discount messaging — protect brand premium perception

---

## 6. Theme Technical Notes

### Shopify Theme
- Built on Dawn 15.4.1
- Store: `jbh0c6-jp.myshopify.com` / `shopvellano.com`
- Staging theme ID: `#161426211073`

### Key Custom Sections (prefix: `vellano-`)
- `vellano-home-hero` — homepage hero carousel
- `vellano-bestsellers` — product grid
- `vellano-editorial` — image + text blocks
- `vellano-quiz` — interactive quiz section
- `vellano-comparison-table` — competitor vs Vellano table
- `vellano-specs` — technical product specs
- `vellano-reviews-masonry` / `vellano-reviews-slider` — social proof
- `vellano-header` / `vellano-footer` — branded navigation

### Rules
- Never modify standard Dawn sections unless necessary — always extend via custom `vellano-` sections
- Always test on Staging before pushing to live (Mark 3)
- Keep animations subtle — fade-up only, no jarring transitions
- Mobile-first on all new sections
