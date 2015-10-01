#!/bin/bash
#
# bash completion file for otto (https://ottoproject.io 
#
# To enable the completions either:
#  - place this file in /etc/bash_completion.d
#  or
#  - copy this file to e.g. ~/.otto-completion.sh and add the line
#    below to your .bashrc after bash completion features are loaded
#    . ~/.otto-completion.sh
#


_otto_compile() {
        COMPREPLY=( $( compgen -o default -W "${subcommands[*]}" -- "$cur" ) )
}

_otto_deploy() {
        local subcommands=(
                info
                destroy
                help
        )

        # only one subcommand
        for subcom in ${subcommands[*]}; do
                if [ "$prev" == "destroy" ]; then
                        subcommands=("-force")
                elif [ "$prev" == "$subcom" ]; then
                        return
                fi
        done

        COMPREPLY=( $( compgen -W "${subcommands[*]}" -- "$cur" ) )
}



_otto_dev() {
        local subcommands=(
                ssh
                address
                destroy
                vagrant
                help
        )

        # only one subcommand
        for subcom in ${subcommands[*]}; do
                if [ "$prev" == "$subcom" ]; then
                        return
                fi
        done

        COMPREPLY=( $( compgen -W "${subcommands[*]}" -- "$cur" ) )
}


_otto_infra() {
        local subcommands=(
                help
                info
                destroy
        )

        # only one subcommand
        for subcom in ${subcommands[*]}; do
                if [ "$prev" == "destroy" ]; then
                        subcommands=("-force")
                elif [ "$prev" == "$subcom" ]; then
                        return
                fi
        done

        COMPREPLY=( $( compgen -W "${subcommands[*]}" -- "$cur" ) )
}

_otto() {
	local commands=(
                build
                compile
                deploy
                dev
                infra
                status
                version
	)


        COMPREPLY=()
        local cur
        local prev
        local first="${COMP_WORDS[0]}"
        local second="${COMP_WORDS[1]}"
        _get_comp_words_by_ref -n : cur prev 

        if [ "$prev" == "$first" ]; then
                COMPREPLY=( $( compgen -W "${commands[*]}" -- "$cur" ) )
        else
                for option in ${commands[*]}; do
                        if [ "$second" == "$option" ]; then
                                declare -F _otto_$option >/dev/null || return
                                _otto_$option
                        fi
                done
        fi

        return
}

complete -F _otto otto
