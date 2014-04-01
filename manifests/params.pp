# Class: dashing::params
#
# This class defines default parameters used by the main module class dashing
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to dashing class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class dashing::params {
  # ## Application related parameters

  $package = $::operatingsystem ? {
    default => 'dashing',
  }

  $service = $::operatingsystem ? {
    default => 'dashing',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'thin',
  }

  $process_args = $::operatingsystem ? {
    default => 'dashing',
  }

  $process_user = $::operatingsystem ? {
    default => 'dashing',
  }

  $process_group = $::operatingsystem ? {
    default => 'dashing',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/dashing',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/dashing/dashing.conf',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/dashing',
    default                   => '/etc/sysconfig/dashing',
  }

  $config_file_init_source = undef

  $config_file_init_template = $::operatingsystem ? {
    default => 'dashing/config-init.erb',
  }

  $config_file_init_script_source = undef

  $config_file_init_script = $::operatingsystem ? {
    default => '/etc/init.d/dashing'
  }
  
  $config_file_init_script_template =$::operatingsystem ? {
    default => 'dashing/init-script.erb'
  }

  $pid_dir = $::operatingsystem ? {
    default => '/var/run/dashing',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/dashing/dashing.pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/lib/dashing',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/dashing',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/dashing/dashing.log',
  }

  $port = '3030'
  $protocol = 'tcp'
  $dashboard_git_url = undef
  $dashboard_git_branch = 'master'
  $dashboard_refresh_cron = '*/5 * * * *'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  # ## General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
