#!/bin/bash

# wait until Mautic is installed
until php -r 'file_exists("/var/www/html/config/local.php") ? include("/var/www/html/config/local.php") : exit(1); exit(isset($parameters["site_url"]) ? 0 : 1);'; do
	echo "Mautic not installed, waiting to start workers"
	sleep 5
done

# Needed to finish the AWS SES plugin installation (started in Dockerfile)
php /var/www/html/bin/console cache:clear
php /var/www/html/bin/console mautic:plugins:reload

supervisord -c /etc/supervisor/conf.d/supervisord.conf
