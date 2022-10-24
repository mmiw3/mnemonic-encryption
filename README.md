# 助记词加密解密工具

助记词明文保存可能出现泄露情况, 因此可以对明文助记词进行对称加密保存, 然后将加密之后的助记词和对称密钥分别记录在不同的地方, 以避免泄露.


## 原理
使用`openssl enc`命令进行加密解密.


## 使用方式

### 镜像
1. 从docker hub拉取镜像: `docker pull mmiw3/mnemonic-encription`
2. 可以自行构建镜像: `docker build -t mmiw3/mnemonic-encription .`


### 命令
1. 加密. 使用对称密钥对明文助记词进行加密: `enc "x1 x2 x3 ... x12" "123"`, 其中`x1 x2 x3 ... x12`替换为自己的助记词, `123`替换为自己的对称密钥. 执行之后得到的是密文助记词, 需将密文助记词和密钥保存好.
2. 解密: 使用对称密钥对密文助记词进行解密: `dec "xxxx" "123"`, 其中`xxxx`替换为自己的密文助记词, `123`替换为自己的对称密钥. 执行之后得到的是明文助记词.
3. 命令帮助: `h` 或 `help`

**注意: 命令中的双引号不可省略**

### 运行
1. 如果不想在本地环境留下明文历史记录, 则可以进入容器之后使用以上命令.[**推荐**]
  > `docker run --rm -it mmiw3/mnemonic-encription`

  > `encrypt.sh enc "x1 x2 x3 ... x12" "123"`

以上命令执行完, 退出之后容器即会销毁, 需及时保存密文助记词及对称密钥

2. 也可以使用一行命令完成`docker run --rm -it mmiw3/mnemonic-encription enc "x1 x2 x3 ... x12" "123"`. **注意:** 该方式会在客户端留下明文记录, 如果是公共电脑,请不要使用该方式.

3. 查看帮助`docker run --rm -it mmiw3/mnemonic-encription help`


