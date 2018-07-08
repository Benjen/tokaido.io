---
title: Tokaido Container Services
description: How Tokaido services like Varnish, Nginx and SSH work
date: 2018-07-08T11:39:59+10:00
weight: 30
draft: false
bref: Tokaido runs a collection of Docker containers to make amazing local Drupal dev environments. 
toc: true
---

### Memcache
The memcache containers run, well, ahem, it runs memcache. Obviously. We highly recommend using Memcache in your Drupal site. To use this container in Tokaido, simply add the following to your `settings.tok.php` file after you're run the initial Site Install. 

```php
$settings['cache']['default'] = 'cache.backend.memcache';
$settings['memcache_storage']['key_prefix'] = 'default';
$settings['memcache_storage']['memcached_servers'] = ['memcache:11211' => 'default'];
```

### MySQL
Tokaido inclues a MySQL container. This isn't anything special we've created, but rather the [official MySQL Docker image](https://hub.docker.com/_/mysql/) 

The MySQL credentials are as follows:

- Username: tokaido
- Password: tokaido
- Hostname: mysql
- Default Database Name: 

You can access the database from *inside* Tokaido by using either `drush ssh` or `mysql -u tokaido mysql -p `. 

If you want to access the MySQL database from your local system, you need to identify the MySQL Port:

```
tok ports mysql
```

Finally, you can log in as root by using the same password (`tokaido`). For example: 

```
mysql -u root -h 127.0.0.1 -P 32779 -p
```

If you're connecting via the command line, note that you have to use the IP address 127.0.0.1 not the hostname 'localhost'.</p>

### PHP/FPM
The Tokaido PHP FPM container ships with some sane defaults that are generally reasonable for both local development and production environments. 

The container is open source, and you can find it [here](https://github.com/tokaido-io/fpm).

The README for the container lists both the default values, and variable names that you can apply to override them. 

If you want to override any of these settings, you can add the new values to your `.tok/compose.tok.yml` file. 

For example, to increase the PHP memory limit and max input time variables:

```yaml
services:
  fpm:
    environment:
      PHP_MEMORY_LIMIT: 1024M
      PHP_MAX_INPUT_TIME: 300
```

### Solr

Tokaido ships with a Solr 6.6 container that extends the official [Docker Solr 6.6 Slim image](https://github.com/docker-solr/docker-solr/tree/master/6.6/slim)

This container currently launches by default and creates a core called `drupal`. 

You can access the Solr web interface using the exposed Solr port. You can look this up with this command:

- `tok ports 8983`

This default core includes the Solr conf directory from [search_api_solr release 8.x-2.0](https://www.drupal.org/project/search_api_solr/releases/8.x-2.0)

Inside your Drupal site, you can reach the Solr container using the hostname `solr` on the defautl port 8983. This should work with only the minimal, default config. 

### SSH

The SSH/Drush container provides an SSH server and many, many friendly tools for managing PHP and Drupal sites. This includes Composer, Vim, the Mysql client, and of course PHP itself. 

You can think of this container as the portal to managing your site using the command line. If you've used tools like DrupalVM or Beetbox, the idea of running `vagrant ssh` is probably already familiar. 

To access the Drush container:

```
ssh {{your-project-name}}.tok 
```

In this example, `{{your-project-name}}` is generally the name of the directory that your site lives in. For instance, if your site is in `/Users/joe/code/my-drupal-site` then your project name is `my-drupal-site`. 

The Drush container is also your easy access point to all of your site logs, which you'll find in the `/tokaido/logs` folder, or you can run `show-logs` when you're inside the container. 

### Varnish
The Varnish container provides optional caching for content served by Drupal. It receives traffic from the HAProxy container and passses requests for uncached content down to Nginx.  

The Varnish container will simply honour whatever cache headers are supplied by your Drupal site, so you can bypass Varnish by simply turning caching off in Drupal. The only real exception to this rule is for logged in users, where the path is /user, /admin, /ajax and a few others, or the Authorization header is present. 

Varnish also does some basic security enforcement by adding headers to outgoing responses to improve browser security. These include:

- `X-XSS-Protection = 1; mode=block` stops pages loading when the [browser detects cross-site scripting attacks](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-XSS-Protection)
- `Referrer-Policy = same-origin` stops cross-origin requests from [sending "Referer" information](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Referrer-Policy) for strict GDPR compliance
- `Strict-Transport-Security = max-age=31536000` [forces SSL for 1 year](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security). This isn't needed in Tokaido, but it matches best practices in production so we add it in.

There are a few other tips and tricks that our Varnish image applies. You can review the Varnish config for full details [here](https://github.com/tokaido-io/varnish/blob/master/config/default.vcl). 