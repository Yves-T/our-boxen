class people::yves_t {
	# install applications
	include people::yves::applications

	$my_homedir = "/Users/${::boxen_user}"
	$dotfiles_dir = "/Users/${::boxen_user}/dotfiles"

	file { $my_homedir:
		ensure => directory
	}

	# My dotfile repository
	repository { "$my_homedir/dotfiles":
		source => "${::github_user}/dotfiles_work"
	}

	file { "$my_homedir/.vim":
		ensure  => link,
		mode    => '0644',
		target  => "$my_homedir/dotfiles/vim",
		require => Repository[$dotfiles_dir]
	}

	file { "$my_homedir/.vimrc":
		ensure => link,
		mode   => '0644',
		target => "$dotfiles_dir/vimrc",
		require => Repository[$dotfiles_dir]
	}

	file { "$my_homedir/.bash_profile":
		ensure => link,
		mode   => '0644',
		target => "$dotfiles_dir/bash_profile",
		require => Repository[$dotfiles_dir]
	}

	file { "$my_homedir/.oh-my-zsh":
		ensure => link,
		mode   => '0644',
		target => "$dotfiles_dir/oh-my-zsh",
		require => Repository[$dotfiles_dir]
	}

	file { "$my_homedir/.zshrc":
		ensure => link,
		mode   => '0644',
		target => "$dotfiles_dir/zshrc",
		require => Repository[$dotfiles_dir]
	}
}
