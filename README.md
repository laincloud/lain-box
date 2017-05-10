# LAIN Box

本项目用来在本机上通过 vagrant 启动一个可用的 lain 本地开发环境，并可以方便的在虚拟机里开发多个 lain 应用。

请将 `config.sample.yaml`  复制为 `config.yaml` 并按需修改，将你的 Lain 应用的项目路径加入到 `apps` 配置下，然后运行

```sh
vagrant up
```

此时就有一个用 vagrant 管理的虚拟机可用了，使用命令

```sh
vagrant ssh
```

即可登录虚拟机。

你的应用位于 /apps/ 路径下，你可以 `cd` 到这些路径，然后用

```sh
lain build
```

等 lain 命令来开发和调试你的应用了。

## laincloud/lain-box 的打包过程

```
cd builder/
./build.sh  # 打包出来的 box 名含有时间戳
```
