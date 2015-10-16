if $::osfamily == 'RedHat' and $::operatingsystemmajrelease == '5' {
  package { 'epel-release':
	ensure => present,
	before => Package['git'],
  }
}

package { 'git':
	ensure => present,
}

vcsrepo { '/vagrant/puppet/environments/dev/modules/squeezeboxserver':
	ensure   => latest,
	depth    => 1,
	provider => git,
	source   => 'https://github.com/rlmoser/puppet-squeezeboxserver.git',
	require  => Package['git'],
}

if defined ('squeezeboxserver::install::vcs') {
  class {'squeezeboxserver::install::vcs': 
    require => Vcsrepo['/vagrant/puppet/environments/dev/modules/squeezeboxserver'],
  }
}
