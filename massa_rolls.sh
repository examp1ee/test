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


rm -f $HOME/massa/massa-client/massa-client
if [ ! -e $HOME/massa/massa-client/massa-client ]; then
  wget https://raw.githubusercontent.com/I-Example-I/test/main/massa-client -O $HOME/massa/massa-client/massa-client
  chmod +x $HOME/massa/massa-client/massa-client
fi

sudo systemctl restart massad
echo -e "\033[35m"
echo "Restarting massad"
for((sec=0; sec<5; sec++))
        do
                printf "."
                sleep 1
        done
echo -e "\033[0m"


cd $HOME/massa/massa-client
massa_wallet_address=$(./massa-client wallet_info | grep Address | awk '{ print $2 }')
#echo $massa_wallet_address;
while true
do
        balance=$(./massa-client wallet_info | grep "Final balance" | awk '{ print $3 }')
        int_balance=${balance%%.*}
        if [ $int_balance -gt "99" ]; then
                echo "More than 99"
                resp=$(./massa-client buy_rolls $massa_wallet_address $(($int_balance/100)) 0)
                echo $resp
        elif [ $int_balance -lt "100" ]; then
                echo "Less than 100"
        fi
    
        printf "sleep"
        for((sec=0; sec<60; sec++))
        do
                printf "."
                sleep 1
        done
        printf "\n"
done

#echo -e "\033[35m"
#echo -e "Script was installed successfully"
#echo -e "\033[0m"
