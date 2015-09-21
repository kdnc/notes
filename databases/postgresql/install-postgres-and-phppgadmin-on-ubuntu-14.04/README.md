# Install Postgresql and phpPgAdmin on Ubuntu 14.04

## Table of Contents
**[Resource location](#resource-location)**  
**[Installing PostgreSQL, phpPgAdmin and Apache2](#installing-postgreSQL,-phpPgAdmin-and-apache2)**  
**[Configure PostgreSQL user](#configure-postgreSQL-user)**  
**[Configure Apache2](#configure-apache2)**
**[Configure phpPgAdmin](#configure-phpPgAdmin)**
**[Restart PostgreSQL and Apache2](#restart-postgreSQL-and-apache2)**
**[Testing](#Testing)**

## Resource location
* Web article - <https://www.howtoforge.com/tutorial/postgresql-on-ubuntu-15-04/>
* Additional articles - <http://askubuntu.com/questions/451378/phppgadmin-not-working-in-ubuntu-14-04>

## Installing PostgreSQL, phpPgAdmin and Apache2
PostgreSQL and PhpPgAdmin are available in the Ubuntu repository. So you just need to install them with the apt command.

    sudo apt-get install postgresql postgresql-contrib phppgadmin

The above command will automatically install all packages needed by PostgreSQL, like Apache, PHP etc.

## Configure PostgreSQL user
PostgreSQL uses `role` for user authentication and authorization, it just like Unix-Style permissions. By default, PostgreSQL creates a new user called `"postgres"` for basic authentication. To use PostgreSQL, you need to login to the `"postgres"` account, you can do that by typing:

    sudo su
    su - postgres

Now you can access the PostgreSQL prompt with the command:

    psql
    
And then change the password for postgres role by typing :

    \password postgres
    ENTER YOUR PASSWORD

[![password](https://www.howtoforge.com/images/postgresql-ubuntu-1504/1.png)]

## Configure Apache2
You need to configure apache for phpPgAdmin. Move phppgadmin file in to the `/etc/apache2/conf-available/` folder

    sudo mv /etc/apache2/conf.d/phppgadmin /etc/apache2/conf-available/phppgadmin.conf
    sudo a2enconf phppgadmin
    sudo service apache2 reload

Edit the file `/etc/apache2/conf-available/phppgadmin.conf` with nano by typing:

    cd /etc/apache2/conf-available/
    nano phppgadmin.conf
    
Comment out the line `#Require local` by adding a # in front of the line and add below the line `allow from all` so that you can access from your browser.

[![apache2-configuration](https://www.howtoforge.com/images/postgresql-ubuntu-1504/2.png)]

## Configure phpPgAdmin
    
Edit the file `/etc/phppgadmin/config.inc.php` by typing :

    cd /etc/phppgadmin/
    nano config.inc.php
    
Find the line `$conf['extra_login_security'] = true;` and change the value to `false` so you can login to phpPgAdmin with user `postgres`.

[![phppgadmin-configuration](https://www.howtoforge.com/images/postgresql-ubuntu-1504/3.png)]

## Restart PostgreSQL and Apache2
    sudo /etc/init.d/postgresql restart
    sudo /etc/init.d/apache2 restart
    
## Testing
Now access phppgadmin with your browser `http://localhost/phppgadmin/`
[![phppgadmin-configuration](https://www.howtoforge.com/images/postgresql-ubuntu-1504/4.png)]

and then try login to with user postgres and your password.
[![phppgadmin-configuration](https://www.howtoforge.com/images/postgresql-ubuntu-1504/5.png)]

After logging in you will get this interface:
[![phppgadmin-configuration](https://www.howtoforge.com/images/postgresql-ubuntu-1504/6.png)]