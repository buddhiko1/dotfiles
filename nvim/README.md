## Prepare
1. Run checkhealth.
2. Install luarocks,php,composer and julia.
3. Config command path in constants.lua.
4. Install telescope dependencies: ripgrep and fd.
5. Install debugger.
    - `vscode-node-debug2`
    - `vscode-chrome-debug` (add "185.199.108.133 raw.githubusercontent.com" to /etc/hosts).
6. Add .rgignore for live grep ignore.

## note
- clear shada: `cat /dev/null > .local/state/nvim/shada/main.shada`
