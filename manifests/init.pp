# = Class: dashing
#
# This is the main dashing class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, dashing class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $dashing_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, dashing main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $dashing_source
#
# [*source_dir*]
#   If defined, the whole dashing configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $dashing_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $dashing_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, dashing main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $dashing_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $dashing_options
#
# [*service_autorestart*]
#   Automatically restarts the dashing service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $dashing_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $dashing_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $dashing_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $dashing_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for dashing checks
#   Can be defined also by the (top scope) variables $dashing_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $dashing_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $dashing_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $dashing_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $dashing_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for dashing port(s)
#   Can be defined also by the (top scope) variables $dashing_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling dashing. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $dashing_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $dashing_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $dashing_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $dashing_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in dashing::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of dashing package
#
# [*service*]
#   The name of dashing service
#
# [*service_status*]
#   If the dashing service init script supports status argument
#
# [*process*]
#   The name of dashing process
#
# [*process_args*]
#   The name of dashing arguments. Used by puppi and monitor.
#   Used only in case the dashing process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user dashing runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $dashing_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $dashing_protocol
#
#
# See README for usage patterns.
#
class dashing (
  $my_class       = params_lookup('my_class'),
  $source         = params_lookup('source'),
  $source_dir     = params_lookup('source_dir'),
  $source_dir_purge                 = params_lookup('source_dir_purge'),
  $template       = params_lookup('template'),
  $service_autorestart              = params_lookup('service_autorestart', 'global'),
  $options        = params_lookup('options'),
  $version        = params_lookup('version'),
  $absent         = params_lookup('absent'),
  $disable        = params_lookup('disable'),
  $disableboot    = params_lookup('disableboot'),
  $monitor        = params_lookup('monitor', 'global'),
  $monitor_tool   = params_lookup('monitor_tool', 'global'),
  $monitor_target = params_lookup('monitor_target', 'global'),
  $puppi          = params_lookup('puppi', 'global'),
  $puppi_helper   = params_lookup('puppi_helper', 'global'),
  $firewall       = params_lookup('firewall', 'global'),
  $firewall_tool  = params_lookup('firewall_tool', 'global'),
  $firewall_src   = params_lookup('firewall_src', 'global'),
  $firewall_dst   = params_lookup('firewall_dst', 'global'),
  $debug          = params_lookup('debug', 'global'),
  $audit_only     = params_lookup('audit_only', 'global'),
  $noops          = params_lookup('noops'),
  $package        = params_lookup('package'),
  $service        = params_lookup('service'),
  $service_status = params_lookup('service_status'),
  $process        = params_lookup('process'),
  $process_args   = params_lookup('process_args'),
  $process_user   = params_lookup('process_user'),
  $process_group  = params_lookup('process_group'),
  $config_dir     = params_lookup('config_dir'),
  $config_file    = params_lookup('config_file'),
  $config_file_mode                 = params_lookup('config_file_mode'),
  $config_file_owner                = params_lookup('config_file_owner'),
  $config_file_group                = params_lookup('config_file_group'),
  $config_file_init                 = params_lookup('config_file_init'),
  $config_file_init_source          = params_lookup('config_file_init_source'),
  $config_file_init_template        = params_lookup('config_file_init_template'),
  $config_file_init_script          = params_lookup('config_file_init_script'),
  $config_file_init_script_source   = params_lookup('config_file_init_script_source'),
  $config_file_init_script_template = params_lookup('config_file_init_script_template'),
  $pid_dir        = params_lookup('pid_dir'),
  $pid_file       = params_lookup('pid_file'),
  $data_dir       = params_lookup('data_dir'),
  $log_dir        = params_lookup('log_dir'),
  $log_file       = params_lookup('log_file'),
  $port           = params_lookup('port'),
  $protocol       = params_lookup('protocol'),
  $dashboard_git_url                = params_lookup('dashboard_git_url'),
  $dashboard_git_branch             = params_lookup('dashboard_git_branch'),
  $dashboard_refresh_cron           = params_lookup('dashboard_refresh_cron'),) inherits dashing::params {
  $bool_source_dir_purge = any2bool($source_dir_purge)
  $bool_service_autorestart = any2bool($service_autorestart)
  $bool_absent = any2bool($absent)
  $bool_disable = any2bool($disable)
  $bool_disableboot = any2bool($disableboot)
  $bool_monitor = any2bool($monitor)
  $bool_puppi = any2bool($puppi)
  $bool_firewall = any2bool($firewall)
  $bool_debug = any2bool($debug)
  $bool_audit_only = any2bool($audit_only)
  $bool_noops = any2bool($noops)

  require nodejs

  # ## Definition of some variables used in the module
  $manage_package = $dashing::bool_absent ? {
    true  => 'absent',
    false => $dashing::version,
  }

  $manage_service_enable = $dashing::bool_disableboot ? {
    true    => false,
    default => $dashing::bool_disable ? {
      true    => false,
      default => $dashing::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $dashing::bool_disable ? {
    true    => 'stopped',
    default => $dashing::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $dashing::bool_service_autorestart ? {
    true  => Service[dashing],
    false => undef,
  }

  $manage_file = $dashing::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_directory = $dashing::bool_absent ? {
    true    => 'absent',
    default => 'directory',
  }

  $manage_user = $dashing::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  $manage_group = $dashing::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $dashing::bool_absent == true or $dashing::bool_disable == true or $dashing::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $dashing::bool_absent == true or $dashing::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $dashing::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $dashing::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $dashing::source ? {
    ''      => undef,
    default => $dashing::source,
  }

  $manage_file_content = $dashing::template ? {
    ''      => undef,
    default => template($dashing::template),
  }

  $manage_config_file_init_source = $dashing::config_file_init_source ? {
    ''      => undef,
    default => $dashing::config_file_init_source,
  }

  $manage_config_file_init_content = $dashing::config_file_init_template ? {
    ''      => undef,
    default => template($dashing::config_file_init_template),
  }

  $manage_config_file_init_script_source = $dashing::config_file_init_script_source ? {
    ''      => undef,
    default => $dashing::config_file_init_script_source,
  }

  $manage_config_file_init_script_content = $dashing::config_file_init_script_template ? {
    ''      => undef,
    default => template($dashing::config_file_init_script_template),
  }

  # ## Managed resources
  package { $dashing::package:
    ensure   => $dashing::manage_package,
    provider => 'gem',
    noop     => $dashing::bool_noops,
  }

  file { 'dashing.default':
    ensure  => $dashing::manage_file,
    path    => $dashing::config_file_init,
    mode    => $dashing::config_file_mode,
    owner   => $dashing::config_file_owner,
    group   => $dashing::config_file_group,
    require => Package[$dashing::package],
    notify  => $dashing::manage_service_autorestart,
    source  => $dashing::manage_config_file_init_source,
    content => $dashing::manage_config_file_init_content,
    replace => $dashing::manage_file_replace,
    audit   => $dashing::manage_audit,
    noop    => $dashing::bool_noops,
  }

  file { 'dashing.init-script':
    ensure  => $dashing::manage_file,
    path    => $dashing::config_file_init_script,
    mode    => '0755',
    owner   => $dashing::config_file_owner,
    group   => $dashing::config_file_group,
    require => Package[$dashing::package],
    notify  => $dashing::manage_service_autorestart,
    source  => $dashing::manage_config_file_init_script_source,
    content => $dashing::manage_config_file_init_script_content,
    replace => $dashing::manage_file_replace,
    audit   => $dashing::manage_audit,
    noop    => $dashing::bool_noops,
  }

  file { 'dashing.pid-dir':
    ensure  => $dashing::manage_directory,
    path    => $dashing::pid_dir,
    mode    => '0755',
    owner   => $dashing::process_user,
    group   => $dashing::process_group,
    require => Package[$dashing::package],
    audit   => $dashing::manage_audit,
    noop    => $dashing::bool_noops,
  }

  git::reposync { 'dashing.data.dir':
    ensure            => $dashing::manage_file,
    source_url        => $dashing::dashboard_git_url,
    branch            => $dashing::dashboard_git_branch,
    destination_dir   => $dashing::data_dir,
    owner             => $dashing::process_user,
    group             => $dashing::process_group,
    execute_on_change => true,
    cron              => $dashing::dashboard_refresh_cron,
    post_command      => "cd ${dashing::data_dir} && chown -R ${dashing::process_user}:${$dashing::process_group} *  && /usr/bin/bundle",
    notify            => $dashing::manage_service_autorestart,
  }

  group { $dashing::process_group: ensure => $dashing::manage_group, }

  user { $dashing::process_user:
    ensure => $dashing::manage_user,
    gid    => $dashing::process_group,
    home   => $dashing::data_dir,
    shell  => '/bin/false',
    audit  => $dashing::manage_audit,
    noop   => $dashing::bool_noops,
  }

  service { 'dashing':
    ensure    => $dashing::manage_service_ensure,
    name      => $dashing::service,
    enable    => $dashing::manage_service_enable,
    hasstatus => $dashing::service_status,
    pattern   => $dashing::process,
    require   => [
      Package[$dashing::package],
      File['dashing.default'],
      File['dashing.init-script'],
      File['dashing.pid-dir'],
      Git::Reposync['dashing.data.dir'],
      ],
    noop      => $dashing::bool_noops,
  }

  #  file { 'dashing.conf':
  #    ensure  => $dashing::manage_file,
  #    path    => $dashing::config_file,
  #    mode    => $dashing::config_file_mode,
  #    owner   => $dashing::config_file_owner,
  #    group   => $dashing::config_file_group,
  #    require => Package[$dashing::package],
  #    notify  => $dashing::manage_service_autorestart,
  #    source  => $dashing::manage_file_source,
  #    content => $dashing::manage_file_content,
  #    replace => $dashing::manage_file_replace,
  #    audit   => $dashing::manage_audit,
  #    noop    => $dashing::bool_noops,
  #  }

  # The whole dashing configuration directory can be recursively overriden
  if $dashing::source_dir {
    file { 'dashing.dir':
      ensure  => directory,
      path    => $dashing::config_dir,
      require => Package[$dashing::package],
      notify  => $dashing::manage_service_autorestart,
      source  => $dashing::source_dir,
      recurse => true,
      purge   => $dashing::bool_source_dir_purge,
      force   => $dashing::bool_source_dir_purge,
      replace => $dashing::manage_file_replace,
      audit   => $dashing::manage_audit,
      noop    => $dashing::bool_noops,
    }
  }

  # ## Include custom class if $my_class is set
  if $dashing::my_class {
    include $dashing::my_class
  }

  # ## Provide puppi data, if enabled ( puppi => true )
  if $dashing::bool_puppi == true {
    $classvars = get_class_args()

    puppi::ze { 'dashing':
      ensure    => $dashing::manage_file,
      variables => $classvars,
      helper    => $dashing::puppi_helper,
      noop      => $dashing::bool_noops,
    }
  }

  # ## Service monitoring, if enabled ( monitor => true )
  if $dashing::bool_monitor == true {
    if $dashing::port != '' {
      monitor::port { "dashing_${dashing::protocol}_${dashing::port}":
        protocol => $dashing::protocol,
        port     => $dashing::port,
        target   => $dashing::monitor_target,
        tool     => $dashing::monitor_tool,
        enable   => $dashing::manage_monitor,
        noop     => $dashing::bool_noops,
      }
    }

    if $dashing::service != '' {
      monitor::process { 'dashing_process':
        process  => $dashing::process,
        service  => $dashing::service,
        pidfile  => $dashing::pid_file,
        user     => $dashing::process_user,
        argument => $dashing::process_args,
        tool     => $dashing::monitor_tool,
        enable   => $dashing::manage_monitor,
        noop     => $dashing::bool_noops,
      }
    }
  }

  # ## Firewall management, if enabled ( firewall => true )
  if $dashing::bool_firewall == true and $dashing::port != '' {
    firewall { "dashing_${dashing::protocol}_${dashing::port}":
      source      => $dashing::firewall_src,
      destination => $dashing::firewall_dst,
      protocol    => $dashing::protocol,
      port        => $dashing::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $dashing::firewall_tool,
      enable      => $dashing::manage_firewall,
      noop        => $dashing::bool_noops,
    }
  }

  # ## Debugging, if enabled ( debug => true )
  if $dashing::bool_debug == true {
    file { 'debug_dashing':
      ensure  => $dashing::manage_file,
      path    => "${settings::vardir}/debug-dashing",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'
      ),
      noop    => $dashing::bool_noops,
    }
  }

}
