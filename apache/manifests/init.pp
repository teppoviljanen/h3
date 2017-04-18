class apache {

	package {'apache2':
		ensure => 'installed',
	}

	file {'/etc/apache2/sites-available/testsitecom.conf':
		content => template('apache/testsitecom.conf.erb'),
	}

	file {'/etc/hosts':
		content => template('apache/hosts.erb'),
	}

	file {'/home/teppo/public_html/':
		ensure => 'directory',
	}

	file {'/home/teppo/public_html/index.html':
		content => 'Hello world!',
	}

	file { '/etc/apache2/sites-enabled/testsitecom.conf':
		ensure => link,
		target => '/etc/apache2/sites-available/testsitecom.conf',
		notify => Service['apache2'],	
	}

	service {'apache2':
		ensure => true,
		enable => true,
		require => Package['apache2'],
	} 
}
