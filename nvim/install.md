## Prepare
1. Run checkhealth.
2. Install luarocks,php,composer and julia.
3. `pnpm add -g alacritty-themes eslint prettier cspell`.
4. Config command path in constants.lua.
5. Install telescope dependencies: ripgrep and fd.
6. Install debugger.
    - `vscode-node-debug2`
    - `vscode-chrome-debug` (add "185.199.108.133 raw.githubusercontent.com" to /etc/hosts).
7. Install dependence of markdown preview.
    - `sudo npm install -g @compodoc/live-server`
8. Add .rgignore for live grep ignore.

## linux
- clear shada: `cat /dev/null > .local/state/nvim/shada/main.shada`

## Windows
1. Install dependencies:
   - `install JetBrainMono font`
   - `choco install mingw` (run as administrator)
   - `choco install ripgrep fd` (run as administrator)
   - `winget install alacritty`
2. Change start path appropriately in start.vbs.
3. Send nvim.vbs to desktop.
4. Create shortcut for nvim.vbs's shortcut.
5. Change icon of shortcut.
