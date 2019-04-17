#!/bin/sh

# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#无论脚本从哪里调用，怎么调用，上面代码都是非常有用的获得脚本存储位置绝对路径的一行代码

echo "请选择：
0001. 白马汇
"


push_git() { #函数

target_path=/Users/$USER/Desktop/FuYouZhiFuProject
echo "目标路径：$target_path"

read -p "请输入序列号:" num0
#  *量词，其前一个字符匹配≥0次 匹配0次时表示任意字符都ok
#  .除了换行符以外的任意一个字符
#  ^匹配行首
#  $匹配行尾
#  []   匹配中括号中的任意一个字符
#  [^]	匹配除中括号内字符以外的任意一个字符
#  \	转义符
#  {n}	其前的字符出现n次
#  \{n,\}	其前的字符出现≥n次
#  \{n,m\}	其前的字符出现≥n次，且≤m次

if [[ $num0 =~ [0-9]{4} ]]; then
	
  # -e filename 如果 filename存在，则为真 
# -d filename 如果 filename为目录，则为真 
# -f filename 如果 filename为常规文件，则为真 
# -L filename 如果 filename为符号链接，则为真 
# -r filename 如果 filename可读，则为真 
# -w filename 如果 filename可写，则为真 
# -x filename 如果 filename可执行，则为真 
# -s filename 如果文件长度不为0，则为真 
# -h filename 如果文件是软链接，则为真
	#具体项目文件夹
	project_folder_path=$(find ${target_path} -mount -xdev -type d -name "*${num0}*")
	echo "具体项目文件夹："$project_folder_path""
    if test -f $dir; then #检测文件是否是目录
    	#statements
       echo ""$num0" 对应的文件夹是："$project_folder_path""
       cd ${project_folder_path}/DaiKuan
       # echo "当前项目目录：$(pwd)"
       echo "$(git status)" #查看当前git状态
       
       #用于校验的字符串
       check_string_1=""
       check_string_2="Changes to be committed:"
       check_string_2_2="Changes not staged for commit:"
       check_string_3="use "git push""
       check_result_1=`git status | grep "${check_string_1}"`
       check_result_2=`git status | grep "${check_string_2}" || "${check_string_2_2}"`
       check_result_3=`git status | grep "${check_result_3}"`

       if [[ $check_result_1 =~ "${check_string_1}" ]]; then
         #statements
         echo "没有新的内容更新，无需提交"
       elif [[ $check_result_2 =~ "${check_string_2}" || "${check_string_2_2}" ]]; then
         #statements
         git add .
         read -p "请输入备注信息:" des
         #获取当前日期时间
         current_date=`date +"%Y.%m.%d %H:%M:%S"`
         echo "当前日期时间：${current_date}"
         git commit -m "${current_date} lxl ${des}"
         git pull
         
         #有冲突时,控制台输出信息
         ckeck_pull_string=""
         check_pull_result=`git pull | grep "${check_pull_result}"`
         if [[ $check_pull_result =~ "${check_pull_string}" ]]; then
           #statements
           echo "请先解决冲突之后再手动提交!!!"
         else
          git push origin master
          echo "${num0} 提交成功"
         fi
       elif [[ $check_result_3 =~ "${check_string_3}" ]]; then
         #statements
         git push origin master
         echo "${num0} 提交成功"
       fi




       # read -p "请输入指令(1继续提交 2:继续下一个提交 0:退出)" num1
       # if [[ $num1 == 1 ]]; then
       #     #提交代码操作
       #     
      	#    git pull
           
       #     read -p "请输入指令(1继续提交 2:继续下一个提交 0:退出)" num2
       #     if [[ $num2 == 1 ]]; then
       #          $(git push origin master)
       #          echo "${num0}推送成功"
       #     elif [[ $num2 == 2 ]]; then
       #     	#statements
       #     	    push_git
       #     else
       #     		exit
       #     fi

       # elif [[ $num1 == 2 ]]; then
       #     	#statements
       #      push_git
       # else
       #      exit
           
       # fi
    else
    	echo "未找到序列号对应的文件夹"
    fi
elif [[ $num0 == 0000 ]]; then
	#statements
    echo "全部"
else
	if [[ ${#num0} < 4 ]]; then
		#statements
	echo "请输入4位序列号!!" >&2
	# exit 1
	push_git
    else
    	echo "莫名其妙的错误!"
    fi
fi
}


  push_git





