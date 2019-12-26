#!/bin/bash

counter=0

while [ $counter -lt 50 ] ; do
  (( counter=counter+1 ));

  name=$(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $1}')
  lastName=$(nl people.txt | grep -w $counter | awk '{print $2}' | awk -F ',' '{print $2}')
  age=$(shuf -i 20-60 -n 1)

  mysql -u root -p1234 people -e "insert into register values ($counter, '$name', '$lastName', $age)"
  echo "$counter, $name, $lastName, $age was correctly imported"
done