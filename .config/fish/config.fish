if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Start X at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx &> /dev/null
    end
end

. ~/.config/fish/functions/rprompt.fish

alias vim='nvim'
alias vi='nvim'
alias ls='exa -F --group-directories-first'


fish_add_path '/home/jack/.local/share/gem/ruby/3.0.0/bin'

starship init fish | source
