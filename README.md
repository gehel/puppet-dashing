# Puppet module: dashing

This is a Puppet module for dashing based on the second generation layout ("NextGen") of Example42 Puppet Modules.

Made by Guillaume Lederrey

Official git repository: http://github.com/gehel/puppet-dashing

Released under the terms of Apache 2 License.

This module requires functions provided by the Example42 Puppi module (you need it even if you don't use and install Puppi)

For detailed info about the logic and usage patterns of Example42 modules check the DOCS directory on Example42 main modules set.


## USAGE - Basic management

* Install dashing with default settings

        class { 'dashing': }

* Install a specific version of dashing package

        class { 'dashing':
          version => '1.0.1',
        }

* Disable dashing service.

        class { 'dashing':
          disable => true
        }

* Remove dashing package

        class { 'dashing':
          absent => true
        }

* Enable auditing without without making changes on existing dashing configuration *files*

        class { 'dashing':
          audit_only => true
        }

* Module dry-run: Do not make any change on *all* the resources provided by the module

        class { 'dashing':
          noops => true
        }


## USAGE - Overrides and Customizations
* Use custom sources for main config file 

        class { 'dashing':
          source => [ "puppet:///modules/example42/dashing/dashing.conf-${hostname}" , "puppet:///modules/example42/dashing/dashing.conf" ], 
        }


* Use custom source directory for the whole configuration dir

        class { 'dashing':
          source_dir       => 'puppet:///modules/example42/dashing/conf/',
          source_dir_purge => false, # Set to true to purge any existing file not present in $source_dir
        }

* Use custom template for main config file. Note that template and source arguments are alternative. 

        class { 'dashing':
          template => 'example42/dashing/dashing.conf.erb',
        }

* Automatically include a custom subclass

        class { 'dashing':
          my_class => 'example42::my_dashing',
        }


## USAGE - Example42 extensions management 
* Activate puppi (recommended, but disabled by default)

        class { 'dashing':
          puppi    => true,
        }

* Activate puppi and use a custom puppi_helper template (to be provided separately with a puppi::helper define ) to customize the output of puppi commands 

        class { 'dashing':
          puppi        => true,
          puppi_helper => 'myhelper', 
        }

* Activate automatic monitoring (recommended, but disabled by default). This option requires the usage of Example42 monitor and relevant monitor tools modules

        class { 'dashing':
          monitor      => true,
          monitor_tool => [ 'nagios' , 'monit' , 'munin' ],
        }

* Activate automatic firewalling. This option requires the usage of Example42 firewall and relevant firewall tools modules

        class { 'dashing':       
          firewall      => true,
          firewall_tool => 'iptables',
          firewall_src  => '10.42.0.0/24',
          firewall_dst  => $ipaddress_eth0,
        }


## CONTINUOUS TESTING

Travis {<img src="https://travis-ci.org/gehel/puppet-dashing.png?branch=master" alt="Build Status" />}[https://travis-ci.org/gehel/puppet-dashing]
