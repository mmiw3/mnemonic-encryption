#!/bin/sh

action=$1
data=$2
pwd=$3

encryption(){
  echo -n "$data" | openssl enc -aes-128-ecb -a -e -pass pass:"$pwd" -nosalt -pbkdf2 -A
}

decryption(){
  echo "$data" | openssl enc -aes-128-ecb -a -d -pass pass:"$pwd" -nosalt -pbkdf2 -A
}

help(){
  echo 如何使用:
  echo 加密助记词: enc "助记词(明文)" "助记词密码" = "助记词(密文)"
  echo 例如 enc "x1 x2 x3 x4 ... x12" "123"
  echo 解密助记词: dec "助记词(密文)" "助记词密码" = "助记词(明文)"
  echo 例如 dec "xxxx" "123"
  echo 仓库地址: https://github.com/mmiw3/mnemonic-encryption
}

if [ "$#" == "0" ]; then
  /bin/sh
  return
fi

if [ "$action" == "help" ] || [ "$action" == "h" ]; then
  help
  return
fi

if [ "$data" == "" ] || [ "$pwd" == "" ]; then
  echo "明/密文助记词或对称密钥不能为空!"
  return
fi

if [ "$action" == "enc"  ]; then
  encryption
elif [ "$action" == "dec" ]; then
  decryption
fi

echo

