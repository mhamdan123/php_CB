case node["platform"]
when "ubuntu"
        default["pakage_name_php"] = 'php-apc', 'php-pear', 'php5-cli', 'php5-common', 'php5-curl', 'php5-fpm', 'php5-gd', 'php5-mysql', 'php5-xmlrpc'
	default["service_name_php"] = 'php-fpm'
when "centos"
        default["pakage_name_php"] = 'php56-php-apcu', 'php56-php-pear', 'php56-php-cli', 'php56-php-common', 'php56-php-curl', 'php56-php-fpm', 'php56-php-gd', 'php56-php-mysql', 'php56-php-xmlrpc'
	default["add_packages"] = 'yum-utils', 'epel-release'
	default["service_name_php"] = 'php-fpm'
when "amazon"
        default["pakage_name_php"] = 'php56-php-apcu', 'php56-php-pear', 'php56-php-cli', 'php56-php-common', 'php56-php-curl', 'php56-php-fpm', 'php56-php-gd', 'php56-php-mysql', 'php56-php-xmlrpc'
	default["add_packages"] = 'yum-utils'
	default["service_name_php"] = 'php-fpm'
end
