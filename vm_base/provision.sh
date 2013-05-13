
# Break open the var cache here for metacpan.org
mkdir -p /tmp/meta_var/tmp
chmod -R 777 /tmp/meta_var
ln -s /tmp/meta_var /home/metacpan/metacpan.org/var

# start up the services
for service in elasticsearch metacpan-api metacpan-www;
  { service $service start; }
