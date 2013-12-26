class mysql (
  $module_root = 'puppet:///modules/mysql/',
  $packages = [
    'mysql-common',
    'mysql-server'
  ],
  $conf_files = [
    'conf.d/char.cnf',
    'conf.d/innodb.cnf',
  ],
  $password = 'opdb.local',
  $hostname = 'opdb.local',
  $local_only = true,
  $create_opdb_user = false,
  $opdb_user = '',
  $opdb_password = '',
  $opdb_host = 'opdb.local',
) {
  package { $packages:
    ensure => installed,
    # We need to have innodb settings in place before installation.
    require => File['/etc/mysql/conf.d/innodb.cnf']
  }

  service { mysql:
    enable    => true,
    ensure    => running,
    subscribe => Package['mysql-server'],
  }

  exec { 'mysqladmin password':
    unless => "mysqladmin -uroot -p${password} status",
    path => ['/bin', '/usr/bin'],
    command => "mysqladmin -uroot password ${password}",
    require => Service['mysql'],
  }

  exec { 'mysql-remove-anonymous':
    onlyif => 'mysqladmin -ubingoberra status',
    path => ['/bin', '/usr/bin'],
    command => "echo \"DROP USER ''@'localhost'; DROP USER ''@'${hostname}';\" | mysql -uroot -p${password}",
    require => [Service['mysql'], Exec['mysqladmin password']],
  }

  file { "/etc/mysql":
    ensure => directory
  }

  file { "/etc/mysql/conf.d":
    ensure => directory
  }

  
  define conf_file() {
    file { "/etc/mysql/${name}":
      owner => root,
      group => root,
      mode => 0444,
      source => "puppet:///modules/mysql/${name}",
      require => [File["/etc/mysql"],File["/etc/mysql/conf.d"]]
    }
  }

  conf_file { $conf_files:
  }

  if ! $local_only {
    file { '/etc/mysql/dbnode-my.cnf':
      owner  => root,
      group  => root,
      mode   => '0444',
      source => 'puppet:///modules/mysql/dbnode-my.cnf',
      path   => '/etc/mysql/my.cnf',
      notify => Service['mysql']
    }

    if $create_opdb_user {
      exec { 'mysql-create-opdb-user':
        unless => "echo 'use mysql;select user, host from user;' | mysql -uroot -ppassword | grep ${opdb_user} | grep ${opdb_host} > /dev/null",
        path => ['/bin', '/usr/bin'],
        command => "echo \"CREATE USER ${opdb_user} IDENTIFIED BY '${opdb_password}'; GRANT ALL PRIVILEGES ON *.* TO '${opdb_user}'@'${opdb_host}' IDENTIFIED BY '${opdb_password}' WITH GRANT OPTION;\" | mysql -uroot -p${password}",
        require => Service['mysql']
      }
    }
  }
}
