# Don't read the stupid french translations.
export LANG=en_US.UTF-8

#Some programs use that env variable to choose default editor.
export EDITOR=vim

#Allow cores.
ulimit -c unlimited

#Use liquidprompt, because it roxes, thanks nojhan.
source ~/liquidprompt/liquidprompt

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

#Use colout for some pretty printing.

function jsonpp()
{
    echo "$*" | python -mjson.tool | colout -t json;
}
export -f jsonpp

function xmlpp()
{
    echo "$*" | perl -p -e "s/\n//g" | xmlstarlet fo -s 4 | colout "<\s*([^=/]*)\s*>" blue | colout "<\s*([/])\s*([^=/]*)\s*>" yellow,blue | colout "<\s*([^=/]*\s*/)\s*>" yellow | colout ">\s*([^<]*)\s*<" red | colout "<([^> ]*)" blue | colout "([/])\s*>" yellow | colout "(\S*)\s*=\s*\"([^\"]*)\"" blue,red | colout \" cyan normal | less -r;
}
export -f xmlpp
