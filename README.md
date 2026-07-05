# jekyll-tailwind-platform

Source of truth for shared theme, Tailwind config, layouts, includes, docs, and scripts

## Background

I have many static websites, each with their own Git repo, each getting pushed to GitLab and there pulled to CloudFlare pages. 

This repo is the central source of truth for all of these' themes, layouts, includes, docs, and scripts. i.e. it is a central repo used across all the sites.  

In other words it is my technology repo for building static websites. 

## Associated Repo's

jekyll-tailwind-theme-public   -- Public mirror used for remote_theme distribution

This public GitHub repo, is required for documented remote_theme workflow.


## Structure

```
jekyll-tailwind-platform/
├── README.md
├── docs/
│   ├── adoption-guide.md
│   ├── override-guide.md
│   ├── release-process.md
│   └── component-catalog.md
├── theme/
│   ├── _layouts/
│   │   ├── default.html
│   │   ├── page.html
│   │   ├── post.html
│   │   ├── home.html
│   │   └── tool.html
│   ├── _includes/
│   │   ├── head.html
│   │   ├── header.html
│   │   ├── footer.html
│   │   ├── hero.html
│   │   ├── breadcrumbs.html
│   │   ├── related-links.html
│   │   ├── prose.html
│   │   ├── dark-mode-toggle.html
│   │   └── ad-slot.html
│   ├── _data/
│   │   └── theme.yml
│   ├── assets/
│   │   ├── css/
│   │   │   └── main.css
│   │   ├── js/
│   │   │   └── theme.js
│   │   └── img/
│   ├── _sass/
│   ├── package.json
│   ├── postcss.config.js
│   ├── tailwind.config.js
│   ├── Gemfile
│   └── jekyll-theme-platform.gemspec
├── starter/
│   ├── _config.yml.example
│   ├── Gemfile.fragment
│   └── site-override-examples/
├── scripts/
│   ├── bootstrap-remote-theme.sh
│   ├── set-theme-version.sh
│   ├── verify-site.sh
│   ├── batch-upgrade-sites.sh
│   └── diff-theme-overrides.sh
└── examples/
    └── pilot-site/
```


### Jekyll + Tailwind Platform Blueprint

This blueprint defines a reusable platform for upgrading multiple existing Jekyll websites to a shared, minimalist, professional design system using Tailwind, a central theme repository, and bash-based rollout tooling. Jekyll themes can package layouts, includes, assets, and styles, and local site files can override theme files when needed.

### Objectives

The platform is designed for these constraints and goals:

Keep Jekyll as the site generator and preserve existing content workflows.

Introduce a professional, minimalist design system with fast UI and little or no animation.

Reuse one shared design layer across about ten existing websites and future utility sites.

Keep current sites ad-free now, while leaving room for optional ad placeholders later without structural redesign.

Support gradual rollout, version pinning, and per-site overrides.

Fit a workflow where each site has its own Git repository and deploys through mirrored remotes to Cloudflare Pages.

### Architecture

The recommended architecture uses a separate central repository for the shared design platform, and each individual website consumes it via remote_theme pinned to a tag or commit. The jekyll-remote-theme plugin supports public GitHub-hosted themes and allows pinning a branch, tag, or commit such as owner/repo@v1.0.0.

### Repository roles

Repository	Purpose	Visibility	Notes
jekyll-tailwind-platform	Source of truth for shared theme, Tailwind config, layouts, includes, docs, and scripts	Private in Gitea	Main development repo
jekyll-tailwind-theme-public	Public mirror used for remote_theme distribution	Public on GitHub	Required for documented remote_theme workflow.
site-a, site-b, ...	Content repos for each Jekyll website	Private in Gitea, mirrored to GitLab	Keep site-specific content and overrides
Flow
Develop the theme platform in the private Gitea repo.

Mirror or publish releases to the public GitHub theme repo.

Tag a version such as v0.1.0 in the public repo.

Update one site’s _config.yml to reference remote_theme: yourorg/jekyll-tailwind-theme-public@v0.1.0.

Build and verify locally, then deploy through the existing GitLab to Cloudflare Pages path.

Roll out to the remaining sites in batches.


### Theme strategy

The shared theme should own design, structure, and component behavior; each site should mainly own content, navigation, metadata, and minor branding. This keeps rollout simple while still allowing local overrides where necessary.

#### Shared theme responsibilities

Global layout structure.

Header and footer patterns.

Typography scale and font loading.

Tailwind tokens and utility composition.

Card, CTA, grid, content, and utility-page styles.

Dark mode support.

Future ad placeholder component, disabled by default.

Optional JavaScript for mobile nav and theme toggle.

#### Site responsibilities

Content pages and posts.

Site title, description, social metadata.

Navigation and footer links.

Brand accent or logo text.

Site-specific includes or layout overrides when absolutely needed.

### Tailwind design system

Tailwind is a utility-first CSS framework, which makes it well-suited to a reusable design system because it encourages composition from a constrained set of spacing, typography, layout, and color utilities rather than ad hoc page-by-page CSS.

The initial design system should aim for restrained, professional defaults:

Sans-serif body font with strong legibility.

One restrained accent color per site.

Neutral surfaces, subtle borders, and limited shadow use.

Generous whitespace and consistent content widths.

Minimal or no animation beyond small state transitions.

Suggested token categories
Define these centrally in tailwind.config.js:

Colors: neutral scale, primary accent, muted foreground, border, surface.

Typography: body font, heading font, font sizes, line heights.

Spacing: 4px-derived scale.

Radii: small, medium, large.

Shadows: subtle only.

Widths: prose, content, wide.

Breakpoints: mobile-first defaults.

Component set for v0.1.0
Build these first:

Header and responsive nav.

Footer.

Hero section.

Page title block.

Prose styling for articles and standard pages.

Card grid.

CTA panel.

Related links block.

Utility/tool page shell.

Quiet future ad-slot include, disabled by config.


# Web Sites

Each of these static websites have their own Git repository, held both locally on my LAN at ms2022, and remotely in GitLab.com. 

The working directory, locally, is under $HOME/dev, or a sub-dir thereof. 

I have now abandoned DNS domain 
`epatterns.com.au`
and moved (or will move) to 
`itchy.studio`

### Target Websites

http://gitea.ms2022:3003/mattharg/architecture.itchy.studio
http://gitea.ms2022:3003/mattharg/wendy-hargreaves.itchy.studio
http://gitea.ms2022:3003/mattharg/www.itchy.studio
http://gitea.ms2022:3003/mattharg/ai.itchy.studio
http://gitea.ms2022:3003/mattharg/the-bright-red-kite.itchy.studio
http://gitea.ms2022:3003/mattharg/sweng.itchy.studio
http://gitea.ms2022:3003/mattharg/petpamperers.itchy.studio
http://gitea.ms2022:3003/mattharg/cf.itchy.studio
http://gitea.ms2022:3003/mattharg/mattharg.itchy.studio

http://gitea.ms2022:3003/mattharg/www.nettracks.org
http://gitea.ms2022:3003/mattharg/smallchurchmusic.nettracks.org

# Scheduled For Migration to Itchy Studio domain

http://gitea.ms2022:3003/mattharg/operations.epatterns.com.au
http://gitea.ms2022:3003/mattharg/architecture.epatterns.com.au

# Special Cases Repos. 

http://gitea.ms2022:3003/mattharg/website-www-itchy-studio

This failed experiment, was initially created using Wordpress and then converted to flat file using,
wget and then added to this new git repo for upload to Cloudflare Pages.  It was a bad idea and was abandoned. 

http://gitea.ms2022:3003/mattharg/MyStaticWebsites

This is just a doco repo for all of the websites. It contains information about bootstrapping a new website and any information across all websites, such as tips, tools and techniques. 

It will refer to this repo on this migration effort. 



