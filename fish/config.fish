if status is-interactive
    # Commands to run in interactive sessions can go here
end

# default editor
set -gx EDITOR "hx"
set -gx VISUAL "hx"
# default editor end

# load env
function load_env -d "Load variables in a .env file"
    for i in (cat ~/.env)
        set arr (echo $i |tr = \n)
        set -gx $arr[1] $arr[2]
    end
end
# load_env
# load env end 

# pnpm
# set -gx PNPM_HOME "/home/shun/.local/share/pnpm"
# if not string match -q -- $PNPM_HOME $PATH
#   set -gx PATH "$PNPM_HOME" $PATH
# end
# pnpm end
