If you want to deploy your wordpress on a Windows container, with nginx, just use the following command line.

To start, deploy a mysql server, with the Microsoft image:

    docker run --name mysqlwordpress -p 3306:3306 -d microsoft/sample-mysql ping -t localhost

Now, use this image to deploy your wordpress:

    docker run --name wordpress -p 80:80 -d flodu31/wordpressnginxwinserver ping -t localhost

Browse the IP of your VM where the container is running, with adding /wordpress:

__http://192.168.0.12/wordpress__

Install your wordpress :)
