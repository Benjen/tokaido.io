---
title: Using Tokaido 
description: Create, manage, and destroy local Drupal 8 dev environments
date: 2018-07-08T11:39:59+10:00
weight: 20
draft: false
bref: Learn how to create, manage, and destroy local Drupal 8 dev environments in seconds with Tokaido
toc: true
---

Each Tokaido local development environment is a collection of Docker containers working together to run your Drupal site.

You can use the Tokaido command line environment (CLI) to easily start and manage these environments. In this guide, we're going to 
show you how to launch and maintain each environment. 

Note that Tokaido only supports Drupal 8.5 or newer, and requires that you use PHP Composer to manage your site.

### Creating Environments
Creating a Tokaido environment is as simple as moving to the root of your Drupal repository (one level beneath the document root) and running `tok up`

```
$ tok up
🚀  Tokaido is starting up!
🔄  Creating a background process to sync your local repo into the Tokaido environment
🚅  Tokaido started your containers

WELCOME TO TOKAIDO
==================

Your Drupal development environment is now up and running

💻  Run "ssh drupal-site.tok" to access the Drush container
🌎  Run "tok open" to open the environment in your browser
🤔  Run "tok status" check the status of your environment

Check out https://docs.tokaido.io/environments for tips on managing your Tokaido environment
```

That's all you need to do! As the output suggests, you can access the SSH container and Drush by running `ssh your-project-name.tok`. 

You can also run `tok open` to have the Tokaido site in your browser. But if you've only just run `tok up`, you'll probably just get an error message. Let's move on... 

#### What Happens When you Create an Environment
The very first time `tok up` is run on a Drupal site, it performs the following functions:

* Scans your repo to find out where the document root is (such as `/docroot`, or `/web`)
* Automatically creates a `settings.tok.php` file with database settings for the Tokaido environment
* Downloads and starts a collection of Docker containers, such as PHP, Nginx, and Varnish. 
* Creates an active sync process (Unison) to keep your local repo and the Tokaido environment in-sync

If you don't want Tokaido to modify your Drupal site, you can choose "No" when asked about creating the relevant settings files. Tokaido would then give you instructions on how to add the database setting manually. 

#### Checking the Status of your Environment
You can run `tok status` from the repo root at any time and Tokaido will check your environment to make sure that it's working properly. 

```
$ tok status
✅  All containers are running
✅  SSH access is configured
✅  Background sync service is running
😓  A Drupal site is not installed or is not working

Tokaido is running but it looks like your Drupal site isn't installed.

```

This error is expected on a new project, because the Drupal Site Install process hasn't been run yet. You can do that by opening the site in your browser by running `tok open`. 

Optionally, you can run `tok ps` to get a list of individiual Docker containers and their status. 

### Access Using SSH 
It's time to access the Tokaido environment directly, which you can do via SSH.

- Run `ssh project-name.tok`. Substitute 'project-name' as necessary; By default Tokaido uses the directory name of the repo root.

This logs you into a container that shares a copy of your site with the other containers like Nginx. 

```
$ ssh tokaido-test-project.tok

      PHP Version      : 7.1.17
      Composer Version : 1.6.5
      Drush Version    : 9.2.3
      Database Status  : Failed

The Tokaido local development system is ephemeral. Each time you restart the
local Tokaido instance, your database is reset. Content not saved in the
/tokaido/site folder will also be lost forever.

tok@tokaido:/tokaido/site/docroot$
```
When you first log in, you'll be in the `/tokaido/site/docroot` folder. If you haven't run `composer install` on your Drupal site yet, now is a good time (you'll need to move up one directory).

After Composer, you can run `drush site-install` to install Drupal:

```
🚅 LOCAL project-name 03:53:45 /tokaido/site/docroot $ drush site-install -y

 // You are about to DROP all tables in your 'tokaido' database. Do you want to continue?: yes.

 [notice] Starting Drupal installation. This takes a while. Consider using the --notify global option.
 [success] Installation complete.  User name: admin  User password: wowzer
```

Outstanding! Go ahead and run `drush status` to see how everything looks. 

You can type `exit` at any time to leave the SSH environment and go back to you local system. 

### Open in the browser
To access your site, run the following command from your host (make sure you exit the SSH container):

- `tok open`

This opens the site via the HAProxy container using HTTPS. 

Since Tokaido uses dynamic port numbers, we added this command to make it easy to open your site in your default browser. On Mac, this runs the `open` command, or on Linux it runs `xdg-open`.

If you can't use `tok open` for some reason, or you want to use a different browser, you can look up the port number with the `tok ports` command.

### Stopping the Tokaido environment

`tok stop`

You can temporarily pause your Tokaido environment, such as to save system resources, by running `tok stop`. This will put all your containers into a stopped or paused state. 

This is also what happens when you reboot your computer. When you first boot back up, the containers will all be in the stopped state. 

The Tokaido MySQL database content will survive any stop/up commands, as the database container is not deleted.

You can restart your environment at any time by running `tok up`

### Destroying the Tokaido environment

`tok destroy`

This command will _completely_ and _irreversably_ destroy your Tokaido environment. Your local copy of the Drupal repository will remain untouched, but the database inside Tokaido will be destroyed. 

When you want to restart the environment, just run `tok up` again. 
