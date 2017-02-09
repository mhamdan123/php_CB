#######################PHP Installation########################
case node['platform']
  when 'centos'
#######################Centos 6#########################
    if node['platform_version'].to_i == 6
      package node["add_packages"] do
        action :install
      end
      cookbook_file "/tmp/epel-release-latest-6.noarch.rpm" do
        source "epel-release-latest-6.noarch.rpm"
        mode '0775'
        action :create
      end
      rpm_package node["rpm_remi6"] do
        source "/tmp/epel-release-latest-6.noarch.rpm"
  	action :install
      end
      execute 'enable_remi' do
  	command '/bin/yum-config-manager --enable remi'
      end
      execute 'enable_remi-5.6' do
  	command '/bin/yum-config-manager --enable remi-php56'
      end
#######################Centos 7#########################
    elsif node['platform_version'].to_i == 7
      package node["add_packages"] do
        action :install
      end
      cookbook_file "/tmp/epel-release-latest-7.noarch.rpm" do
        source "epel-release-latest-6.noarch.rpm"
        mode '0775'
        action :create
      end
      rpm_package node["rpm_remi6"] do
        source "/tmp/epel-release-latest-7.noarch.rpm"
  	action :install
      end
      execute 'enable_remi' do
  	command '/bin/yum-config-manager --enable remi'
      end
      execute 'enable_remi-5.6' do
  	command '/bin/yum-config-manager --enable remi-php56'
      end
    end
#######################AWS#########################
  when 'amazon'
      package node["add_packages"] do
        action :install
      end
      cookbook_file "/tmp/epel-release-latest-6.noarch.rpm" do
        source "epel-release-latest-6.noarch.rpm"
        mode '0775'
        action :create
      end
      rpm_package node["rpm_remi6"] do
        source "/tmp/epel-release-latest-6.noarch.rpm"
  	action :install
      end
      execute 'enable_remi' do
  	command '/bin/yum-config-manager --enable remi'
      end
      execute 'enable_remi-5.6' do
  	command '/bin/yum-config-manager --enable remi-php56'
      end
#######################Ubuntu#########################
  when 'ubuntu'
    apt_repository 'nginx' do
        uri        'ppa:ondrej/php'
    end
end
###################PHP Installation####################
package node["add_packages"] do
        action :install
end
#######################PHP Configuration########################
file "/etc/php-fpm.d/www.conf" do
        action :delete
end
cookbook_file "/etc/php-fpm.d/www.conf" do
        source "www.conf"
        mode '0775'
        owner 'nginx'
        group 'nginx'
        action :create
end
service node["service_name_php"] do
        action [:enable, :start]
        supports :reload => true
end

