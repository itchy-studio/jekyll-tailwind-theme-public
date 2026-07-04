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






