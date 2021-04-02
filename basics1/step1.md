# Create containers using Docker

Lets create long running docker job that each second will write increasing number to file simulating data generation


Dockerfile defines frozzen, stateless environment where our application will run. 
Here you define OS, packages/libraries, drivers, file system structure. 

**Note:** Each time you run new contaner instance it will run from its initial state, no files/configuration changes will be persisted in container file system.


<pre class="file" data-filename="Dockerfile" data-target="replace">
FROM bash:5.0
COPY ./script.sh .
RUN chmod +x ./script.sh && mkdir /out/ 
CMD ["bash", "./script.sh"]
</pre>


Application code

<pre class="file" data-filename="script.sh" data-target="replace">
touch /out/counter.txt
declare -i var=$(cat /out/counter.txt)
for (( ; ; ))
do
   cat /out/counter.txt
   var=$((var + 1))
   echo $var >/out/counter.txt
   sleep 1s
done
</pre>