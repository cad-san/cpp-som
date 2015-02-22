#!/bin/bash

config=".uncrustify.cfg"

function exec_uncrustify()
{
	local tgtdir=$1
	local otion="-l CPP -q"

	find ${tgtdir} -name "*.h" -o -name "*.c" -o -name "*.cpp" |

	while read filename; do
		uncrustify -c ${config} ${otion} ${filename}

		# 差分チェック
		result=`diff ${filename} ${filename}.uncrustify`
		if [ -z "$result" ];then
			rm ${filename}.uncrustify
		else
			echo "M ${filename}"
		fi
	done
}

while (( $# > 0 ))
do
	case "$1" in
		-*)
			if [[ "$1" =~ 'f' ]]; then
				config=$2 # 次の引数は設定ファイル名
				shift
			fi
			;;
        *)
			exec_uncrustify "$1"
			;;
    esac

	shift
done
