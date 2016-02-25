require 'docker'
require 'serverspec'

describe 'cntlm' do

  image = Docker::Image.build_from_dir('.')

  set :os, family: :debian
  set :backend, :docker
  set :docker_container_create_options, {'entrypoint' => '/bin/bash'}
  set :docker_image, image.id

  describe command('/usr/sbin/cntlm -h') do
    its(:stdout){ should include('version 0.92.3') }
    its(:exit_status){ should eq 1 }
  end

end
