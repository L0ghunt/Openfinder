#!/bin/bash

#
read -p "SEU ALVO: " target
#
echo "$target" | subfinder | alterx -enrich | dnsx | waybackurls | httpx -silent -mc 302 | grep -a -i \=http | qsreplace 'http://evil.com' | while read host
do
    curl -s -L $host -I | grep "evil.com" && echo -e "\033[1;31m$host is Vulnerable\033[0m"
done
