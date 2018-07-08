---
title: Help & Support
description: Let us know if you have any problems or feedback, we're here to help!
date: 2018-07-08T11:39:59+10:00
weight: 50
draft: false
bref: 
toc: false
---


### Asking Questions
You can also find us in the #Tokaido channel on the [Drupal Slack](https://www.drupal.org/slack) if you want to ask us any questions. This is a good place to start if you're looking for help using Tokaido, or if you're encountering some strange behaviour. 

Alternatively, you can message us on [Twitter](https://www.twitter.com/tokaido-io) for small questions. 

### Submitting Bugs
The [Github issue tracker](https://github.com/tokaido-io/tokaido-cli/issues) is our preferred channel for bug reports, but please respect the following restrictions:

- Please do not use the issue tracker for personal support requests (use #Tokaido in [Drupal Slack](https://www.drupal.org/slack)).
- Please do not derail or troll issues. Keep the discussion on topic and respect the opinions of others.
- Please do not reply "+1" on any issues you agree with, use the emoticon response feature to express yourself

Good bug reports are extremely helpful - thank you!

#### Guidelines for bug reports

- Use the GitHub issue search — check if the issue has already been reported.
- Check if the issue has been fixed — make sure you're running the latest version of Tokaido
- Isolate the problem — create a reduced test case and a live example.

A good bug report shouldn't leave others needing to chase you up for more information. Please try to be as detailed as possible in your report. What is your environment? What steps will reproduce the issue? What browser(s) and OS experience the problem? What would you expect to be the outcome? All these details will help people to fix any potential bugs.

Example:
```
Short and descriptive example bug report title

The output of `tok version` as well as the affect command(s) using the `-d` debug flag. 

A summary of the issue and the browser/OS environment in which it occurs. If suitable, include the steps required to reproduce the bug.

This is the first step
This is the second step
Further steps, etc.
```

Any other information you want to share that is relevant to the issue being reported. This might include the lines of code that you have identified as causing the bug, and potential solutions (and your opinions on their merits).

<div class="message focus" data-component="message">In every case, the more detailed your bug report is the faster we'll be able to fix it.</div>

### Requesting Features
Feature requests are always welcome and can be opened in the [Github issue tracker](https://github.com/tokaido-io/tok/issues). 

Be sure to have a search to see if someone has requested that feature before. 

We have tough decisions to make about what features we can include in the project. Some features will distract us from Tokaido's core goals, and other features won't deliver enough value to justify the time required to implement them, but we are always happy to discuss the merits of each feature request, and of course, contributions towards implementing that feature. 

### Contributing
Good pull requests - patches, improvements, new features - are a fantastic help. They should remain focused in scope and avoid containing unrelated commits.

**Please ask first** before embarking on any significant pull request (e.g. implementing features, refactoring code, porting to a different language), otherwise you risk spending a lot of time working on something that the we might not want to merge into the project.

Please adhere to the coding conventions used throughout the project (indentation, accurate comments, etc.). Your code should have good test coverage associated. Pull requests without tests will not be accepted.

We follow this process if you'd like your work considered for inclusion in the project:

* [Fork](http://help.github.com/fork-a-repo/) the project, clone your fork,
   and configure the remotes:

   ```bash
   # Clone your fork of the repo into the current directory
   git clone https://github.com/tokaido-io/tok
   # Navigate to the newly cloned directory
   cd tok
   # Assign the original repo to a remote called "upstream"
   git remote add upstream https://github.com/<upstream-owner>/tok
   ```

* If you cloned a while ago, get the latest changes from upstream:

   ```bash
   git checkout develop
   git pull upstream develop
   ```

* Create a new topic branch (off the main project development branch) to
   contain your feature, change, or fix:

   ```bash
   git checkout -b <topic-branch-name>
   ```

* Commit your changes in logical chunks. Please adhere to these [git commit
   message guidelines](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)
   or your code is unlikely be merged into the main project. Use Git's
   [interactive rebase](https://help.github.com/articles/interactive-rebase)
   feature to tidy up your commits before making them public.

* Locally merge (or rebase) the upstream development branch into your topic branch:

   ```bash
   git pull [--rebase] upstream develop
   ```

* Push your topic branch up to your fork:

   ```bash
   git push origin <topic-branch-name>
   ```

* [Open a Pull Request](https://help.github.com/articles/using-pull-requests/)
    with a clear title and description.

**IMPORTANT**: By submitting a patch, you agree to allow the project owner to
license your work under the same license as that used by the project.

