echo -e "\033[35m"

echo -ne "\033[35m██████╗░░█████╗░  "
echo -e "\033[34m░█████╗░██████╗░██╗░░░██╗██████╗░████████╗░█████╗░"

echo -ne "\033[35m██╔══██╗██╔══██╗  "
echo -e "\033[34m██╔══██╗██╔══██╗╚██╗░██╔╝██╔══██╗╚══██╔══╝██╔══██╗"

echo -ne "\033[35m██████╔╝██║░░██║  "
echo -e "\033[34m██║░░╚═╝██████╔╝░╚████╔╝░██████╔╝░░░██║░░░██║░░██║"

echo -ne "\033[35m██╔══██╗██║░░██║  "
echo -e "\033[34m██║░░██╗██╔══██╗░░╚██╔╝░░██╔═══╝░░░░██║░░░██║░░██║"

echo -ne "\033[35m██║░░██║╚█████╔╝  "
echo -e "\033[34m╚█████╔╝██║░░██║░░░██║░░░██║░░░░░░░░██║░░░╚█████╔╝"

echo -ne "\033[35m╚═╝░░╚═╝░╚════╝░  "
echo -e "\033[34m░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░░░░░░░╚═╝░░░░╚════╝░"

echo -e "\033[35m"
echo -e "\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$"
echo -e "https://t.me/ro_cryptoo"
echo -e "https://t.me/whitelistx1000"
echo -e "Made with love by III_Example_III"
echo -e "\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$"
echo -e ""

echo -e "\033[0m"
#echo
#echo -e "${C_LGn}Usage${RES}: script ${C_LGn}[OPTIONS]${RES}"
#echo
#echo -e "${C_LGn}Options${RES}:"
#echo -e "  -h, --help       show the help page"
#echo -e "  -n, --node PORT  assign the specified port to use RPC (default is ${C_LGn}${node}${RES})"
#echo -e "  -r, --rpc PORT   assign the specified port to use RPC (default is ${C_LGn}${rpc}${RES})"
#echo -e "  -u, --update     update the node"
#echo
#echo

cd /root

sleep 5

sudo tee /root/rollsup.sh > /dev/null <<EOF 
cd /root/massa/massa-client

candidat=\$(./massa-client wallet_info |grep 'Candidate rolls'|awk '{print \$3}')
massa_wallet_address=\$(./massa-client wallet_info |grep 'Address'|awk '{print \$2}')
tmp_final_balans=\$(./massa-client wallet_info |grep 'Final balance'|awk '{print \$3}')
final_balans=\${tmp_final_balans%%.*}
averagetmp=\$(/usr/bin/cat /proc/loadavg | awk '{print \$1}')
kv=100
var=\$(echo "scale=0; \$averagetmp*\$kv" | bc)
var1=\${var%%.*}
if [ \$var1 -lt "20" ];then
echo \`/bin/date +"%b %d %H:%M"\` "(rollsup) Завантаження машини \$var1% Швидше за все нода зависла, rolls купуватися не буде" >> /root/rolls.log
elif [ -z "\$candidat" ];then
echo \`/bin/date +"%b %d %H:%M"\` "Зараз нода не в мережі" >> /root/rolls.log
elif [ \$candidat -gt "0" ];then
echo "Ok" > /dev/null
elif [ \$final_balans -gt "99" ]; then
echo \`/bin/date +"%b %d %H:%M"\` "Ролл злетів, перевіряємо кількість монеток і пробуємо купити" >> /root/rolls.log
else
echo \`/bin/date +"%b %d %H:%M"\` "Недостатньо монет для покупки ролла, у вас \$final_balans, необхідно мінімум 100" >> /root/rolls.log
fi
EOF

sleep 5

printf "SHELL=/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/3 * * * * root /bin/bash /root/rollsup.sh > /dev/null 2>&1
" > /etc/cron.d/massarolls

