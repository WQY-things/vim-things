- 先执行install.sh
- 查看是否安装Vundle, 若无则安装

  `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

- 安装ctags

  `sudo apt install ctags`

- 安装oh-my-zsh

  1. 先安装先决条件，由于curl/wget、git已安装，只需安装zsh

     - http://www.zsh.org/pub上下载源码包zsh-5.4.2.tar.gz
     - 解压安装包，`cd zsh-5.4.2.tar.gz`，执行以下命令:
       - `./configure --prefix=$HOME`：安装到$HOME目录
         - 报错configure: error: "No terminal handling library was found on your system. This is probably a library called 'curses' or 'ncurses'. You may need to install a package called 'curses-devel' or 'ncurses-devel' on your system."，执行`sudo apt install libncurses5-dev`后重新执行上述命令
     - `sudo ln -sf ``which zsh`` /bin/zsh`, 修改/etc/passwd中的登录用户的启动shell为zsh

  2. 安装ohmyzsh

     `sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`

     - 若出现错误：curl: (7) Failed to connect to raw.githubusercontent.com port 443: Connection refused,  在/etc/hosts中添加：185.199.108.133 raw.githubusercontent.com

  3. 安装powerlevel10k(见github)

     - `git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
     - Set `ZSH_THEME="powerlevel10k/powerlevel10k"` in `~/.zshrc`

  4. 安装zsh-autosuggestions(见github)

     - `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

     - Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):

       ```
       plugins=( 
           # other plugins...
           zsh-autosuggestions
       )
       ```

  5. 安装zsh-syntax-highlighting(见github)

     - `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

     - Activate the plugin in `~/.zshrc`:

       ```
       plugins=( [plugins...] zsh-syntax-highlighting)
       ```

  6. windows安装以下字体后，在crt里Font中选择MesloLGS NF字体：

     ```
     MesloLGS NF Bold Italic.ttf
     MesloLGS NF Bold.ttf
     MesloLGS NF Italic.ttf
     MesloLGS NF Regular.ttf
     ```

  7. 安装neofetch(见github)

     - 从github上下载最新的源码包，将源码包里的可执行程序neofetch拷贝到$HOME/bin目录下

- 安装onefetch，使用cargo(见github)

  ```
  curl https://sh.rustup.rs -sSf | sh -s
  cargo install onefetch
  ```

  - 若报错提示未安装cmake，则执行`sudo apt install cmake`

- 在~/.zshrc中添加：

  ```
  PATH="$HOME/bin:$HOME/.local/bin:$PATH"
  umask 0077
  ```

