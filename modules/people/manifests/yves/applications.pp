class people::yves::applications {
	include omnigraffle::pro
	include macvim
	include dropbox

	class { 'intellij':
		edition => 'ultimate',
		version => '12.1.4'
	}

# install libre office with en-GB language pack

	package { 'LibreOffice':
		ensure => installed,
		provider => 'appdmg',
		source   => 'http://download.documentfoundation.org/libreoffice/stable/4.1.0/mac/x86/LibreOffice_4.1.0_MacOS_x86.dmg'
	}

	package { 'LibreOffice LanguagePack':
		ensure => installed,
		provider => 'appdmg',
		source   => "http://download.documentfoundation.org/libreoffice/stable/4.1.0/mac/x86/LibreOffice_4.1.0_MacOS_x86_langpack_en-GB.dmg",
	}

# install brew packages

	package { "gibo":
		ensure => installed,
	}

	package { "yuicompressor":
		ensure => installed,
	}
}
