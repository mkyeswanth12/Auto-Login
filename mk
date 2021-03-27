
#!/usr/bin/env bash
in=$(whoami)
echo usr-$in
figlet -c MK . YES
echo
read -p "1)Connect 2)Reconnect 3)Add-User :" rr
case $rr in
1)
   echo
   echo "----------------------------------"USERS-LIST"-------------------------------------"
   cat /home/mkyes/xyz/bash/ion/user.list
   echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"Select-One"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
   read on
   a=1
   sum=$(($on+$a))
   exut=$(cat /home/mkyes/xyz/bash/ion/userconnect.list | awk NR==$sum)
   echo "---"User $exut Selected....!
   echo "---"Connecting $exut.......!
   reconnect=$(cat /home/mkyes/xyz/bash/ion/$exut.sh | awk NR==8)
   echo $reconnect >/home/mkyes/xyz/bash/ion/reconnect.sh
   sh /home/mkyes/xyz/bash/ion/$exut.sh
   ;;
   2) sudo service network-manager restart
      for i in 11 10 9 8 7 6 5 4 3 2 1
      do
      echo "Redirecting to wifi.dvois.com in $i seconds"
      printf '\033[A'
      sleep 1s
      done
      sh /home/mkyes/xyz/bash/ion/reconnect.sh
   ;;
   3) read -p "Enter UserName :" un
      read -p "Enter Password :" pp
      read -p "Enter MAC       " mac
      read -s -p "Enter File Password To Run script : " ps
      if [ "$ps" == 123 ]
      then
   usrlst=$(wc -l < /home/mkyes/xyz/bash/ion/user.list)
   echo "$usrlst)$un " >> /home/mkyes/xyz/bash/ion/user.list
   echo $un >> /home/mkyes/xyz/bash/ion/userconnect.list
   touch /home/mkyes/xyz/bash/ion/$un.sh
   echo "sudo ifconfig wlan0 down" >> /home/mkyes/xyz/bash/ion/$un.sh
   echo "sudo macchanger --mac=$mac wlan0" >> /home/mkyes/xyz/bash/ion/$un.sh
   echo "sudo ifconfig wlan0 up" >> /home/mkyes/xyz/bash/ion/$un.sh
   echo "sudo service network-manager restart" >> /home/mkyes/xyz/bash/ion/$un.sh
   echo "for i in 11 10 9 8 7 6 5 4 3 2 1;do ">> /home/mkyes/xyz/bash/ion/$un.sh
   echo 'echo "Redirecting to wifi.dvois.com in $i seconds" '>> /home/mkyes/xyz/bash/ion/$un.sh
   echo "printf '\033[A'; sleep 1s;done">>/home/mkyes/xyz/bash/ion/$un.sh
   echo "google-chrome --no-sandbox 'wifi.dvois.com/login?username=$un&password=$pp' ">> /home/mkyes/xyz/bash/ion/$un.sh
   chmod +x /home/mkyes/xyz/bash/ion/$un.sh
   echo Adding...User
   echo "Successfully...$un Added"
   read -p "Do you wanna connect Now(y/n:)-" jjj
   if [ $jjj == y ]
   then
     reconnect=$(cat /home/mkyes/xyz/bash/ion/$un.sh | awk NR==8)
     echo $reconnect >/home/mkyes/xyz/bash/ion/reconnect.sh
     sh /home/mkyes/xyz/bash/ion/$un.sh
   elif [ $jjj == n ]
   then
     echo Exiting......!
      exit
    fi
  else
    echo Authentication failure
    exit
  fi;;
*) exit
esac
