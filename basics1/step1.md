# Create docker file
Lets create long running docker job

Dockerfile

<pre class="file" data-filename="Dockerfile" data-target="replace">
FROM bash:5.0
COPY ./script.sh .
RUN chmod +x ./script.sh
CMD ["bash", "./script.sh"]
</pre>


<pre class="file" data-filename="script.sh" data-target="replace">
touch counter.txt
declare -i var=$(cat counter.txt)
for (( ; ; ))
do
   cat counter.txt
   var=$((var + 1))
   echo $var >counter.txt
   sleep 1s
done
</pre>