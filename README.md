I3-Spec-s-Coding-Test
Dawid Janse van Rensburg
Created on 17 May 2023

Basic expense tracking system

Installation:
Download and install Java 8 or later. Follow the steps on the official Grails website to install the framework: https://grails.org/install.html. This repository should be cloned to your own system. Navigate to the project's root directory in a terminal window. To launch the webpage, use the following command: grails run-app (This will launch the website) This command will start the website on the default port (8080), and you may view it in your web browser by going to http://localhost:8080.

Testing:
Navigate to the project's root directory in a terminal window. You can use the following to run the app in the console: $ grails run-app

Optimization:
In the event that you anticipate having 10,000 concurrent users, there are a few modifications you may perform to guarantee that the system can manage the load: To manage database connections and decrease the overhead of generating and terminating connections, use a connection pool. To process requests more effectively, use asynchronous programming methods such as non-blocking I/O and reactive programming. Use indexes to optimize database queries and minimize needless joins and subqueries. To minimize database demand, use a distributed caching technology like Redis or Memcached to cache frequently requested data.


