# Options
#. <(wget -qO- https://raw.githubusercontent.com/Kallen-c/utils/main/colors.sh) --
option_value(){ echo "$1" | sed -e 's%^--[^=]*=%%g; s%^-[^=]*=%%g'; }
while test $# -gt 0; do
	case "$1" in
	-h|--help)
		. <(wget -qO- https://raw.githubusercontent.com/Kallen-c/utils/main/logo.sh)
		echo
		echo -e "${C_LGn}Functionality${RES}: the script installs an Aleo client or miner node"
		echo
		echo -e "${C_LGn}Usage${RES}: script ${C_LGn}[OPTIONS]${RES}"
		echo
		echo -e "${C_LGn}Options${RES}:"
		echo -e "  -h, --help       show the help page"
		echo -e "  -n, --node PORT  assign the specified port to use RPC (default is ${C_LGn}${node}${RES})"
		echo -e "  -r, --rpc PORT   assign the specified port to use RPC (default is ${C_LGn}${rpc}${RES})"
		echo -e "  -u, --update     update the node"
		echo
		echo
	esac
done
