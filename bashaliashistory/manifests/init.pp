class bashaliashistory {
		file {'/etc/bash.bashrc':
		content => template('bashaliashistory/bash.bashrc.erb')
		}
}
