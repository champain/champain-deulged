# Install the necessary delulge repo

class deluged::install {
  include apt
  apt::ppa { 'ppa:deluge-team/ppa': }

  $deluge_packages =  ['deluged', 'deluge-web', 'deluge-console']
  $deluge_packages.each |String $deluge_package| {
    package {$deluge_package:
      ensure  => installed,
      require => Apt::Ppa['ppa:deluge-team/ppa']
    }
  }

 $group = $::deluged::group
 $user = $::deluged::user

 group { $group:
   ensure => present,
   name   => $group,
   system => true,
 }

 user { $user:
   ensure => present,
   name   => $user,
   gid  => $group,
   system => true,
   shell  => '/usr/sbin/nologin',
 }
}
