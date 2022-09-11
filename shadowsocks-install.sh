#!/bin/bash
echo "Welcome to my shadowsocks-install shell"
input = 1
while (true)
do
	echo "please input your choose"
	echo "1.安装 2.查看状态 3.编辑ss配置文件 4.重启 5.查看日志"
	echo "防火墙设置"
	echo "11.查看状态 12.开放端口 13.拒绝端口 14.删除规则 15.关闭防火墙 16.启动防火墙"
	echo "0.exit"
	read input
	case $input in
		0)exit
		;;
		1)
			apt install shadowsocks-libev
			apt install shadowsocks-v2ray-plugin
			echo "请自行修改配置文件"
			;;
		2)systemctl status shadowsocks-libev.service
		;;
		3)vim /etc/shadowsocks-libev/config.json
		;;
		4)systemctl restart shadowsocks-libev.service
		;;
		5)journalctl -u shadowsocks-libev.service -f
		;;
		11)ufw status
		;;
		12)
			echo "输入你要开放的端口号"
			read open_number
			ufw allow $open_numbernumber
			;;
		13)
			echo "输入你要关闭的端口号"
			read close_number
			ufw deny  $close_numbernumber
			;;
		14)
			echo "输入你要删除的开放端口号"
			read delete_number
			ufw delete allow $delete_number
			;;
		15)ufw disable
		;;
		16)ufw enable
		;;
	esac
done	
