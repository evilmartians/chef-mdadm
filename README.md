# mdadm

## Description

This cookbook installs and autoconfigures [mdadm](http://neil.brown.name/git/mdadm) Management tool for Linux md/raid.

## Requirements

## Supported Platforms

The following platforms are supported by this cookbook, meaning that the recipes run on these platforms without error:

* Ubuntu
* Debian


## Recipes

* `mdadm-conf` - The default recipe.

# Usage

This cookbook installs the mdadm components if not present, and pulls updates if they are installed on the system.
After that it generates correct /etc/mdadm/mdadm.conf


## Attributes

```ruby
default[:mdadm][:mail_to]         = "admin@example.com"
default[:mdadm][:initrdstart]     = "all"
default[:mdadm][:autostart]       = true
default[:mdadm][:autocheck]       = true
default[:mdadm][:start_daemon]    = true
default[:mdadm][:verbose]         = true
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Maintainers

* gfrntz (<gfrntz@evilmartians.com>)
* dragonsmith (<agon.smith@gmail.com>)

## License

**mdadm-conf**

* Freely distributable and licensed under the [MIT license](http://phlipper.mit-license.org/2012/license.html).
* Copyright (c) 2013 Kirill Kouznetsov (<agon.smith@gmail.com>)
