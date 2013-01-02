class users {
	user { 'hef':
		groups => ["adm", "dialout", "cdrom", "sudo", "audio", "video", "plugdev", "games", "users", "netdev", "input"],
		ensure => 'present',
		managehome => 'true',
	}

	file { '/home/hef/.ssh':
		ensure => 'directory',
		require => User['hef'],
		owner => 'hef',
		mode => '0700',
	}

	ssh_authorized_key { "hef-rsa-key":
		ensure => 'present',
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC0caC2BvCVl/l/mDJ2QnoVt+VfbIHUuhYScBEccmNJ5yhM7Z32/Z3JsQaWvhj0zig+PuKCUNoZ5LdmX8rw+dn9YQ+pT7TmnB5KaUutxc/421Z/tPlxlJtBZqleVTGGAmFQBJ2EikdmXPnSdqZ1PvGBOcShTu36O0My63a6s7L8ql0OzLZ1Q3pGohNcryEYHaBMubQjHtOtLrhLD4MNo58GqgIzrJdnBCv+u9Mf3YSNDjm93iSfllNNAy87Lk7wztsncGoAwq/aeputq6a6X2EsTXAT+sJwiI7Nu7g3/yXxeFZTnDWLFRnjkBmpcSTglT5uqlo3xbqy/HdMs7mwNYDL',
		user => 'hef',
		type => 'ssh-rsa',
		require => File["/home/hef/.ssh"]
	}
}
