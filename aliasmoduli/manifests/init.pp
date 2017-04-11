class aliasmoduli {
		file {'/etc/bash.bashrc':
		content => template('aliasmoduli/bash.bashrc.erb')
		}
}
