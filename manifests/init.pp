class bash {

  package { "bash": }

  # Shell initialization files
  file {
    "/usr/local/etc/bash":
      ensure => directory;
    "/usr/local/etc/bash/init":
      source => "puppet:///modules/bash/init";
    "/usr/local/etc/bash/bashrc":
      source => "puppet:///modules/bash/bashrc";
    "/usr/local/etc/bash/bash_profile":
      source => "puppet:///modules/bash/bash_profile";
    "/usr/local/etc/bash/bash_logout":
      source => "puppet:///modules/bash/bash_logout";
    "/usr/local/etc/bash/bash_env":
      source => "puppet:///modules/bash/bash_env";
    "/usr/local/etc/bash/profiles":
      ensure => directory;
    "/usr/local/etc/bash/profiles/logout":
      ensure => directory;
    "/usr/local/etc/bash/skel":
      ensure => directory;
    "/usr/local/etc/bash/skel/.hushlogin":
      source => "puppet:///modules/common/comment";
    "/usr/local/etc/bash/skel/.bash":
      ensure => "/usr/local/etc/bash";
    "/usr/local/etc/bash/skel/.bashrc":
      ensure => ".bash/bashrc";
    "/usr/local/etc/bash/skel/.bash_profile":
      ensure => ".bash/bash_profile";
    "/usr/local/etc/bash/skel/.bash_logout":
      ensure => ".bash/bash_logout";
  }

  # Profile files
  file {
    "/usr/local/etc/bash/profiles/alias-functions":
      source => "puppet:///modules/bash/profiles/alias-functions";
    "/usr/local/etc/bash/profiles/basic-shell":
      source => "puppet:///modules/bash/profiles/basic-shell";
    "/usr/local/etc/bash/profiles/default-login":
      source => "puppet:///modules/bash/profiles/default-login";
    "/usr/local/etc/bash/profiles/freebsd":
      content => template("bash/profiles/freebsd.erb");
    "/usr/local/etc/bash/profiles/freebsd-interactive":
      source => "puppet:///modules/bash/profiles/freebsd-interactive";
    "/usr/local/etc/bash/profiles/tmux-list":
      source => "puppet:///modules/bash/profiles/tmux-list";
    "/usr/local/etc/bash/profiles/logout/freebsd-ttyclear":
      source => "puppet:///modules/bash/profiles/logout/freebsd-ttyclear";
  }

}
