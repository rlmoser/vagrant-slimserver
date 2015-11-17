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
	ensure   => present,
	depth    => 1,
	provider => git,
	source   => 'https://github.com/rlmoser/puppet-squeezeboxserver.git',
	require  => Package['git'],
}

file { '/opt/slimserver':
  ensure => link,
  target => '/opt/repo/slimserver',
}

if $::fqdn == 'builder.slimdevices.com' {
  # generally needed
  package { ['perl',
             'rsync',
             'gcc',
             'perl-File-Which',
            ]:
    ensure => present,
  }
  # packages for building Debian packages
  package { ['debhelper',
             'dpkg-dev',
             'fakeroot',
            ]:
    ensure => present,
  }
  # packages for building rpm packages
  package { 'rpm-build':
    ensure => present,
  }
}

#if defined ('squeezeboxserver::install::vcs') {
if false {
  class {'squeezeboxserver::install::vcs': 
    require => [ Vcsrepo['/vagrant/puppet/environments/dev/modules/squeezeboxserver'],
                 File['/opt/slimserver'], ],
  }
}
