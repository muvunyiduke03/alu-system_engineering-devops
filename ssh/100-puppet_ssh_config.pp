# This Puppet script configures the SSH client to use a specific private key and disables password authentication.

file { 'Add Host block':
  path   => '/etc/ssh/ssh_config',
  line   => 'Host *',
  match  => '^Host\s+',
  before => 'File_line[Set IdentityFile]',
}

file { 'Set IdentityFile':
  path  => '/etc/ssh/ssh_config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^\s*IdentityFile',
}

file_line { 'Disable PasswordAuthentication':
  path  => '/etc/ssh/ssh_config',
  line  => '    PasswordAuthentication no',
  match => '^\s*PasswordAuthentication',
}
