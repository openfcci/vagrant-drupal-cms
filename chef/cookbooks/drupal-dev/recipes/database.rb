include_recipe 'apt'

apt_repository 'docker' do
  uri 'http://get.docker.io/ubuntu'
  distribution 'docker'
  components ['main']
  key 'https://get.docker.io/gpg'
end

package 'lxc-docker'
