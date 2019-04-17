#!/bin/bash   #


# #echo后面使用-n选项是为了删除输出结果末尾的换行符,让提示文字和输入文字在一行 -->好像没有用
# echo -n "请输入一个数字->"

# #read 从标准输入读取数值
# #语法：
# #     read [-options] [variable]
# # options是可以跟的参数(一个或多个),
# # variable是用来存储输入数值的变量名(一个或多个),如果没有提供变量名,shell系统变量REPLY会包含数据行
# read num  
# if [[ $num =~ ^-?[0-9]+$ ]]; then
# 	echo "$num 是数字"
# else
# 	echo "$num 不是数字"
# fi


# read -p "请输入一个或多个值："  #read 后面使用-p为输入显示提示信息
# echo "REPLY = $REPLY"


# if read -t 10 -sp "请在10秒内输入内容> " secret_pass; then
# 	echo -e "\nSecret pass phrase = '$secret_pass'"
# else
# 	echo -e "\n 输入超时!" >&2
# 	exit 1
# fi

#菜单交互
echo "请选择:
1. 显示系统信息
2. 显示磁盘空间
3. 显示空间利用率
0. 退出"


read -p "请输入选项[0-3]：" num

if [[ $num =~ [0-3]$ ]]; then
	if [[ $num == 0 ]]; then
		echo "程序已终止!"
		exit;
	fi

	if [[ $num == 1 ]]; then
		echo "主机名：$HOSTNAME"
		uptime
		exit
	fi

	if [[ $num == 2 ]]; then
		df -h 
		exit;
	fi

	if [[ $num == 3 ]]; then
		if [[ $(id -u) -eq 0 ]]; then
			echo "磁盘空间利用率(All Users)"
			echo "计算中请稍等..."
			du -sh /home/*
		else
			echo "磁盘空间利用率($USER)"
			echo "计算中请稍等..."
			du -sh $HOME
		fi
	fi
else
	echo "无效的选项" >&2 # >表示重定向 &表示等同于, 2标准错误输出 >&2把结果输出到和标准错误一样 
	exit 1
fi















