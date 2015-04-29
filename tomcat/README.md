Tomcat 8 docker file based on b0c1/java:latest image with psi-probe.

Exposed port ```8080```

You can change the administrator password with ```TOMCAT_PASS``` environment variable.

The image mount /data directory, and try to run the config.sh in this mounted directory.