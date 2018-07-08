---
title: How Sync Works
description: Tokaido has a unique solution to keeping environments in-sync.
date: 2018-07-08T11:39:59+10:00
weight: 30
draft: false
bref: Tokaido has a unique solution to keeping environments in-sync
toc: true
---

The Unison container runs a local Unison server, an rsync-like utility that performs fast bi-directional sync. 

When you start Tokaido by running `tok up`, it creates a background sync service using launchd (MacOS) or systemd (Linux). This will keep your local repo and the Tokaido environment in sync. 

You can disable the automatic creation of the background sync service with the `createsyncservice: false` config setting. If you do this, you can manually sync with the `tok sync` command, or start your own (foreground) sync process with `tok watch`. This command will re-sync whenever changes are detected in your filesystem. 