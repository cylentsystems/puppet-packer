class packer::params {
  $version = '0.1.4'

  $_real_kernel = downcase($::kernel)
  $_real_arch   = $::architecture ? {
    'x86_64' => 'amd64',
    'x86'    => '386',
    default  => 'arm'
  }

  $_real_platform = "${_real_kernel}_${_real_arch}"

  $download_uri = "http://dl.bintray.com/mitchellh/packer/${version}_${_real_platform}.zip?direct"

  case $::operatingsystem {
    'Darwin': {
      include boxen::config

      $user = boxen::config::user

      $root = "${boxen::config::home}/packer"
    }

    default: {
      $user = 'root'
      $root = '/usr/local/packer'
    }
  }
}