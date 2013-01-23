Devstack
==========
If you used devstack, prepare to face many odd problems when manually install openstack.
Try to remove everything that devstack installed on your PC. Remove all config it create.
Ex:
Before install keystone, try to::
    apt-get purge keystone python-keystone python-keystoneclient
    locate keystone

and manually remove anything relate to keystone. Do same for glance, nova...

Keystone
==========
After install keystone and ran ``sample_data.sh``. 
``keystone user-list``, ``keystone tenant-list`` run properly but 
you get error when run ``keystone catalog`` or ``keystone token-get`` as bellow::

    [hvn@hvnatvcc] ~ keystone catalog
    Configuration error: Client configured to run without a service catalog. 
    Run the client using --os-auth-url or OS_AUTH_URL, instead of --os-endpoint or OS_SERVICE_ENDPOINT, for example.

or::

    root@controller:~# keystone catalog
    'Client' object has no attribute 'service_catalog'

To fix this, unset two variables::

    [hvn@hvnatvcc] ~  unset SERVICE_ENDPOINT; unset SERVICE_TOKEN       

See more detail here:
    http://paste.ubuntu.com/876375/

This bug should be fixed in folsom

ubuntu-cloud-keyring
====================
On Ubuntu12.04, if you want to install Folsom, you have to ensure that you have 
installed the Ubuntu Cloud Archive packages by adding the following 
to /etc/apt/sources.list.d/folsom.list::

    deb http://ubuntu-cloud.archive.canonical.com/ubuntu precise-updates/folsom main

After run ``apt-get update``::

    GPG error: http://ubuntu-cloud.archive.canonical.com precise-updates/folsom Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY 5EDB1B62EC4926EA

You have to re-add that key::

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5EDB1B62EC4926EA
