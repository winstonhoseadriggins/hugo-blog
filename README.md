[Demo site](http://humboldtux.github.io/sbcb-demo/) for [Start Bootstrap Clean Blog](http://startbootstrap.com/template-overviews/clean-blog/) ported to a Hugo theme.

# Instructions

This demo site has been setup with the following commands.

## Create a new site

    hugo new site sbcb-demo
    cd sbcb-demo

## Init repo and  master branch

    git init
    git remote add origin git@github.com:humboldtux/sbcb-demo.git
    git add .
    git commit -m "Initial commit"
    git push --set-upstream origin master
    git push

## Create gh-pages branch

    git checkout --orphan gh-pages
    git rm --cached $(git ls-files)
    rm -f *
    touch index.html
    git add index.html
    git commit -m "Initial commit on gh-pages branch"
    git push origin gh-pages

## Clone Theme repo

    git checkout master
    git clone git@github.com:humboldtux/startbootstrap-clean-blog.git themes/startbootstrap-clean-blog
    nano .gitignore

## Edit ***config.toml***

A sample configuration file follows. Some options are optional:

* If **.Params.Ganalytics** is not set, the Google analytics JS script
  in **themes/startbootstrap-clean-blog/layouts/partials/ga.html** won't be rendered.
* For each entry in the params.social map, an icon will be shown in the footer.

``` toml
baseurl = "http://humboldtux.github.io/sbcb-demo"
title = "Start Bootstrap Clean Blog"
canonifyurls = true
paginate = 10
theme = "startbootstrap-clean-blog"
languageCode = "en"
copyright = "Code released under the Apache 2.0 license.."

[author]
    name = "Benoît Benedetti"
[params]
  DateForm = "Mon, Jan 2, 2006"
  Author = "Benoît Benedetti"
  email = "benoit.benedetti@gmail.com"
  Ganalytics = "XX-00000000-0"

[[params.social]]
    title = "twitter"
    url = "https://twitter.com/humboldtux"
[[params.social]]
    title = "github"
    url = "https://github.com/humboldtux"
[[params.social]]
    title = "facebook"
    url = "https://www.facebook.com/FACEBOOKHANDLE"

[[menu.main]]
  name = "home"
  url = "/"
  weight = -200
[[menu.main]]
  name = "Archives"
  url = "/post/"
  weight = -180
```

## Add about and contact page

    hugo new about/index.md

Change title metadata from **index** to what you want (**about** here)

    sed -i s/index/about/g content/about/index.md

    hugo new contact/index.md

Change title metadata from **index** to what you want (**contact** here)

    sed -i s/index/contact/g content/contact/index.md

You need also to change your email in **themes/startbootstrap-clean-blog/static/js/clean-blog.js**
to configure correctly the contact form to use Formspree.

## Add some posts

    for i in {01..10};do hugo new post/post-${i}.md;done

## Commit site

    git add .
    git commit -m'Add base content'

## Configure gh-pages subtree to **public** directory

    rm -rf public
    git subtree add --prefix=public git@github.com:humboldtux/sbcb-demo.git gh-pages --squash
    git subtree pull --prefix=public git@github.com:humboldtux/sbcb-demo.git gh-pages --squash

## Generate site

    hugo

## Commit **public** content

    git add -A
    git commit -m "Updating site"

## Deploy **public** content to remote gh-pages

    git push origin mastergit subtree push --prefix=public git@github.com:humboldtux/sbcb-demo.git gh-pages --squash
