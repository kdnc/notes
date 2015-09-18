## Table of Contents
**[Resource location](#resource-location)**  
**[Create Tomcat User](#create-tomcat-user)**  
**[Install Tomcat](#install-tomcat)**  
**[Configure Tomcat Web Management Interface](#configure-tomcat-web-management-interface)**
**[Access the Web Interface](#access-the-web-interface)** 

## Resource location
* Web article - <https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-8-on-ubuntu-14-04>

## Create Tomcat User
We will create a new user and group that will run the Tomcat service.

First, create a new tomcat group:

    sudo groupadd tomcat
    
Then create a new tomcat user. We'll make this user a member of the tomcat group, with a home directory of `/opt/tomcat` (where we will install Tomcat), and with a shell of `/bin/false` (so nobody can log into the account):

    sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
    
## Install Tomcat

### Download Tomcat Binary

Download the latest binary distribution to our home directory.

    cd ~
    wget http://mirror.sdunix.com/apache/tomcat/tomcat-8/v8.0.23/bin/apache-tomcat-8.0.23.tar.gz
    
Install Tomcat to the /opt/tomcat directory

    sudo mkdir /opt/tomcat
    sudo tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1

### Update Permissions

Give the tomcat user write access to the conf directory, and read access to the files in that directory:

    cd /opt/tomcat
    sudo chgrp -R tomcat conf
    sudo chmod g+rwx conf
    sudo chmod g+r conf/*
    
Make the tomcat user the owner of the work, temp, and logs directories:

    sudo chown -R tomcat work/ temp/ logs/
    
### Install Upstart Script

Because we want to be able to run Tomcat as a service, we will set up an Upstart script.

Tomcat needs to know where Java was installed. This path is commonly referred to as "JAVA_HOME". The easiest way to look up that location is by running this command:

    sudo update-alternatives --config java

Output:
    
    There is only one alternative in link group java (providing /usr/bin/java): /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java
    Nothing to configure.
    
The JAVAHOME will be in the output, without the trailing /bin/java

Now we're ready to create the Upstart script. Create and open it by running this command:

    sudo nano /etc/init/tomcat.conf
    
Paste in the following script, and modify the value of JAVA_HOME if necessary. You may also want to modify the memory allocation settings that are specified in CATALINA_OPTS:

    description "Tomcat Server"

      start on runlevel [2345]
      stop on runlevel [!2345]
      respawn
      respawn limit 10 5
    
      setuid tomcat
      setgid tomcat
    
      env JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
      env CATALINA_HOME=/opt/tomcat
    
      # Modify these options as needed
      env JAVA_OPTS="-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"
      env CATALINA_OPTS="-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
    
      exec $CATALINA_HOME/bin/catalina.sh run
    
      # cleanup temp directory after stop
      post-stop script
        rm -rf $CATALINA_HOME/temp/*
      end script
      
This script tells the server to run the Tomcat service as the tomcat user, with the settings specified. It also enables Tomcat to run when the server is started.

Now let's reload the Upstart configuration, so we can use our new Tomcat script:

    sudo initctl reload-configuration
    
Tomcat is ready to be run. Start it with this command:

    sudo initctl start tomcat

you can access the default splash page by going to your domain or IP address followed by :8080 in a web browser:

Open in web browser:

    http://server_IP_address:8080
    
## Configure Tomcat Web Management Interface

In order to use the manager webapp that comes with Tomcat, we must add a login to our Tomcat server. We will do this by editing the tomcat-users.xml file:

    sudo nano /opt/tomcat/conf/tomcat-users.xml
    
Add a user who can access the manager-gui and admin-gui (webapps that come with Tomcat). You can do so by defining a user similar to the example below.

tomcat-users.xml file — Admin User
    
    <tomcat-users>
        <user username="admin" password="password" roles="manager-gui,admin-gui"/>
    </tomcat-users>
    
Save and quit the tomcat-users.xml file. Restart the Tomcat service:

    sudo initctl restart tomcat
    
## Access the Web Interface

Let's access the web management interface in a web browser.

Open in web browser:

    http://server_IP_address:8080
    
You will see something like the following image

[2]: https://assets.digitalocean.com/articles/tomcat8_ubuntu/splashscreen.png (hover text)

Let's take a look at the Manager App, accessible via the link or http://`server_IP_address`:8080/manager/html:

[2]: https://assets.digitalocean.com/articles/tomcat8_ubuntu/manager.png (hover text)

The Web Application Manager is used to manage your Java applications. You can Start, Stop, Reload, Deploy, and Undeploy here. You can also run some diagnostics on your apps (i.e. find memory leaks).

Now let's take a look at the Host Manager, accessible via the link or http://`server_IP_address`:8080/host-manager/html/

[2]: https://assets.digitalocean.com/articles/tomcat8_ubuntu/host-manager.png (hover text)

From the Virtual Host Manager page, you can add virtual hosts to serve your applications from.

