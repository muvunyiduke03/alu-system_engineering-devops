# This Puppet script configures the global SSH client file (/etc/ssh/ssh_config) to use a specific private key and disable password authentication.

file_line { 'Add Host block':
  path   => '/etc/ssh/ssh_config',
  line   => 'Host *',
  match  => '^Host\s+\*',
}

file_line { 'Set IdentityFile':
  path  => '/etc/ssh/ssh_config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^\s*IdentityFile\s+',
}

file_line { 'Disable PasswordAuthentication':
  path  => '/etc/ssh/ssh_config',
  line  => '    PasswordAuthentication no',
  match => '^\s*PasswordAuthentication\s+',
}