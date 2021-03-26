# Create docker file
Lets create long running docker job that each second will write increasing number to file simulating data generation

Dockerfile defines frozzen, stateless environment where our application will run. It defines OS, packages/libraries file system structure

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