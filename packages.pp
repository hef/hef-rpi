package { 'vim':
	ensure => present,
}
package { 'git':
	ensure => present,
}

package { 'avahi-daemon':
	ensure => present,
}
