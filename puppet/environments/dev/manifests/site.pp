if $::osfamily == 'RedHat' and $::operatingsystemmajrelease == '5' {
  package { 'epel-release':
	ensure => present,
	before => Package['git'],
  }
}

package { 'git':
	ensure => present,
}

vcsrepo { '/opt/repo/slimserver-platforms':
	ensure => present,
	provider => git,
	source => 'https://github.com/Logitech/slimserver-platforms.git',
	revision => 'public/7.9',
	depth => 1,
	require => Package['git'],
}

