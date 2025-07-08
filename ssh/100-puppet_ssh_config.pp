file { '/home/ubuntu/.ssh':
  ensure => directory,
  mode   => '0700',
  owner  => 'ubuntu',
  group  => 'ubuntu',
}

file { '/home/ubuntu/.ssh/config':
  ensure => present,
  mode   => '0644',
  owner  => 'ubuntu',
  group  => 'ubuntu',
}

file_line { 'Declare identity file':
  path  => '/home/ubuntu/.ssh/config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^\s*PasswordAuthentication',
}

file_line {'Add host block':
  path  => '/home/ubuntu/.ssh/config',
  line  => 'Host *',
  match => '^Host\s+',
  before => "File_line[Declare identity file]',
}