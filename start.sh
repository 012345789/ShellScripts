# There is no easy way to stop this service from running other than to delete this file.
# so we force delete it before starting the service to make sure there are no issues with the server already running.
rm -f /root/PlayGifService/target/universal/stage/RUNNING_PID

cd ./PlayGifService

# Capping the maximum memory that these commands can take because SBT requires 700 MB+ and most DigitalOcean VMs have 512 MB of memory.
env JAVA_OPTS="-Xmx256m" sbt playUpdateSecret start

return