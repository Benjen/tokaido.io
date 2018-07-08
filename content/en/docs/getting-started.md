---
title: Getting Started
description: Installation and System Requirements - Start here
date: 2018-07-08T11:39:59+10:00
weight: 10
draft: false
bref: Install and run the Tokaido CLI
toc: true
---

### Drupal Requirements
One of the most beautiful but challenging things about Drupal is that there are so many different ways you can use it. Tokaido is designed to support the most common use case:

- Drupal 8.5 or newer is supported (Sorry, no Drupal 7 support yet)
- Your Drupal site should be installed and managed with Composer (although this isn't essential)

<div class="message focus" data-component="message">Your Drupal site needs to be installed in one level down from your repository root. For example, if your repository root is <var>/Users/joe/code/my-drupal-repo</var> then your Drupal root would be <var>/Users/joe/code/my-drupal-repo/web</var> (or similar). 
<br/><br/>
Tokaido <em>will not work</em> if your Drupal root is mixed in with your repository root.</div>


If you can't satisfy these requirements, but would still like to use Tokaido, please get in touch. We want to hear from you so that we know that there is demand for other use cases, and we hope we can ask you to help us test support for these new configurations.

### Installing on MacOS

#### System Requirements
- MacOS High Sierra. Older versions may work, but they're untested.
- [Docker for Mac](https://www.docker.com/docker-mac)
- [Homebrew](https://brew.sh/) package manager

#### Installing

With Docker and Homebrew installed, getting Tokaido on MacOS is easy!

```
brew install tokaido-io/tok/tok
```

### Installing on Linux

#### System Requirements
- Debian/Ubuntu, Archlinux, Redhat/CentOS should all work fine
- Either a native Docker installation, or Docker Machine (we recommend native CE for better performance)
- [Unison File Synchronizer](https://www.cis.upenn.edu/~bcpierce/unison/)
- [fsmonitor](https://pypi.org/project/fsmonitor/) (Install with `pip install fsmonitor`)

#### Installing
Once you've satisfied the requirements, you can simply [download Tokaido from https://releases.tokaido.io/tok-latest.tar.gz](releases.tokaido.io/tok-latest.tar.gz). 

Place the downloaded binary in your `/usr/local/bin` directory or similar globally-pathed location.


### Starting Up
Creating a Tokaido environment is as simple as moving to the root of your Drupal _repository_ and running `tok up`

Check out the [usage guideline]({{< ref "using.md" >}}) for more detailed information on how to use and manage Tokaido environments