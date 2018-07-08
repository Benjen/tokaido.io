---
title: Advanced Config
description: Unleash the full power of Tokaido by learning about it's config structure
date: 2018-07-08T11:39:59+10:00
weight: 60
draft: false
bref: Unleash the full power of Tokaido by learning about it's config structure
toc: false
---

Tokaido is incredibly flexible, and you can modify much of how your environment is created. 

There are four main configuration files that Tokaido utilises:

##### .tok/config.yml
This file provides a global config that is committed to your Git repo and shared by all of your peers. Think of this as _project-wide_ settings. 

##### .tok/local/config.yml
Not committed to Git and is used only in your local installation. This is useful if you want to do something specific with Tokaido, but not affect other developers. 

##### docker-compose.tok.yml
By default, this file is generated and maintained by Tokaido. You must be careful when modifying this file as Tokaido will update it each time `tok up` is run. 

##### .tok/compose.tok.yml
Gives you the ability to completely override the settings that Tokaido writes into the `docker-compose.tok.yml` file in your repository root. 

### Tokaido Configuration Parameters
The `.tok/config.yml` and `.tok/local/config.yml` files are _Tokaido configuration files_. The following is a list of the declarations you can make in either of these files and their impact. 

All of these flags are applied at the root of the yaml document. 

- <kbd>port</kbd>: The port that the Unison sync service binds to inside the container (default: 5000)
- <kbd>project</kbd>: The project name (defaults to the name of the repo directory)
- <kbd>path</kbd>: The path to the repo. 
- <kbd>force</kbd>: Set to true or use `--force` in the command line to override any safety prompts
- <kbd>customCompose</kbd>: Set to true to stop Tokaido from auto-managing your docker-compose.tok.yml file
- <kbd>systemdPath</kbd>: Override the location of systemd user service definitions
- <kbd>lauchdPath</kbd>: Override the location of launchd user agent definition

In addition to these, you can also override the Drupal root directory name by specifying:

```
drupal: 
    path: {{directory name}}
```

And finally, you can enable xdebug by setting:

```
xdebug:
    port: {{port of your listening ide}}
```

After modifying any of these parameters, you can apply them with `tok up`

### Modifying the Docker configuration
Tokaid offers two methods for modifying the Docker configuration. 

##### Per-item config for Docker Compose
The first and recommend way is to write your updated configuration to the `.tok/custom.tok.yml` file. This file will be mixed in with the `docker-compose.tok.yml` file, so values from both will be used to calculate the final Docker Compose file. 

For example, if you want to add an environment variable to the FPM container, you can specify just that setting in the `compose.tok.yml` file in just the same way you would in the Docker Compose file, but without any of the other Compose declarations:

```
services:
  fpm:
    environment:
      PHP_MEMORY_LIMIT: 1024M
      PHP_MAX_INPUT_TIME: 300
```

Similarly, you can change the image name or version that is used by Docker:

```
services:
    fpm:
        version: 0.0.5
    drush:
        image: myusername/my-custom-ssh-container
        version: latest
```

##### Whole config override for Docker Compose
For very advanced users, you can have Tokaido completely stop managing your `docker-compose.tok.yml` file. This lets you do whatever you want using the standard Docker Compose v2 file spec. 

If you find yourself actually needing to do this, you're probably doing something wrong, as we've designed Tokaido to avoid this situation. If you do need to do this, please take a moment to let us know why so that we can improve Tokaido. 
