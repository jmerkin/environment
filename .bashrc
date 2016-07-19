eval `dircolors`

# Source global definitions
if [ -f /etc/bashrc ]; then
	#. /etc/bashrc
	echo "" > /dev/null
fi

if [ -f /etc/profile ]; then
    #. /etc/profile
	echo "" > /dev/null
fi

#export PERL5LIB=$PERL5LIB:$HOME/software/BioPerl-1.6.1/
#export PERL5LIB=$PERL5LIB:$HOME/software/hlaforest/scripts/

#export DRGAPPATH=/home/merkija1/software/drgap.0.1.0/

#export PATH=$HOME/software/CORTEX_release_v1.0.5.21/scripts/analyse_variants/needleman_wunsch/:$PATH
export PATH=$HOME/software/vawk/:$PATH
#export PATH=$HOME/software/phylip-3.696/exe/:$PATH
#export PATH=$PATH:$HOME/software/STAR-STAR_2.4.0j/bin/Linux_x86_64_static/
#export PATH=$HOME/software/STAR-2.5.1b/bin/Linux_x86_64_static/:$PATH

if [ -f $HOME/.inputrc ]; then
	export INPUTRC=$HOME/.inputrc
fi

set completion-ignore-case on
set -o noclobber #check when overwriting

set -o vi #vi mode
set editing-mode vi
set keymap vi

shopt -s expand_aliases
shopt -s cdspell #correct minor spelling errors in a cd command
shopt -s histappend #make bash append rather than overrite histories
shopt -s histverify
shopt -s checkwinsize #check win size after command
shopt -s dotglob # files beginning with . to be returned in path-name expansion

if [ "$PROMPT_COMMAND" = "" ]; then
	PROMPT_COMMAND="history -a; history -n"; 
else
	PROMPT_COMMAND="$PROMPT_COMMAND;history -a; history -n" ; #make bash append after each newline
fi

complete -cf sudo #tab complete for sudo

export LD_LIBRARY_PATH=$HOME/lib:$LD_LIBRARY_PATH:$HOME/lib64 #:/usr/prog/compilers/intel/fort/11.1.069/lib
export LD_LIBRARY_PRELOAD=$HOME/lib:$LD_LIBRARY_PATH:$HOME/lib64
#export CPLUS_INCLUDE_PATH=/home/merkija1/software/gsl-1.16/:$CPLUS_INCLUDE_PATH
export LS_OPTIONS='-F --group-directories-first --color=auto'
export LS_OPTIONS='-F --color=auto'
export IGNOREEOF=1 #so a single ctrl+d doesn't exit bash
export BROWSER='firefox'
export EDITOR=vim
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:rm"
export HISTSIZE=10000000
export HISTFILESIZE=100000000
#export XAUTHORITY=$HOME/.Xauthority
#export TERM="screen"

alias tmux='tmux -2'
#alias sh='/home/merkija1/bin/bash'
alias python2.7='python'
alias ssh='ssh -CY'
alias wget='wget --no-check-certificate'
alias epdf='epdfview'
#alias jstat='qstat | grep jmerkin'
#alias qstat='qstat -aln'
alias cstat='qstat | grep "jmerkin" | wc -l'
alias qstatl='qstat | less'
alias astat='qstat -u "*"'
alias qstatf='qstat -r | grep Full | cut -d " " -f 14'
alias astatl='qstat -u "*" | less'
alias ls='ls $LS_OPTIONS'
alias mkdir='mkdir -p'
alias ll='ls -lhF --color=auto'
alias la='ls -lahf --color=auto'
alias lsgrep='\ls | grep'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias v='vim'
alias cp='cp -i' # -i asks before doing more than 3 operations at once
alias mkdir='mkdir -p -v' #makes parents and confirms directory
alias mv='mv -i'
alias rm='rm -i'
alias grep='grep --color=auto'
alias ping='ping -c 5'
alias express='express --no-update-check'
alias qsubil='qsub -I -q long'
alias softenv=/usr/prog/softenv/1.6.2/bin/softenv
alias pyclone='PyClone'
alias transpose='awk -f /home/jmerkin/old_code/general/transpose.awk '

export PYTHONPATH=$PYTHONPATH':'$HOME'/old_code/from_mit:'$HOME'/src'
#export PYTHONPATH=$PYTHONPATH':'$HOME'/software/PyClone-0.12.7/lib/'

#export PATH=$HOME/software/bowtie-1.0.1:$PATH

###prompting
if [ ${UID} -eq 0 ]; then
	PROMPT_HOST_COLOR='1;31m'
	PROMPT_DIR_COLOR='1;31m'
else
	PROMPT_HOST_COLOR='1;32m'
	PROMPT_DIR_COLOR='1;36m'
fi
#                color  date time   deprecated?                                 user host                         cwd                        hist_n
export PS1="\[\e[${PROMPT_HOST_COLOR}\][\d|\A][${debian_chroot:+($debian_chroot)}\u@\h:\[\e[${PROMPT_DIR_COLOR}\]\\w\[\e[${PROMPT_HOST_COLOR}\]|\#]$"


jstat () {
    qstat -j $1 | less
}

ex () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1		;;
			*.tar.gz)	tar xzf $1		;;
			*.bz2)		bunzip2 $1		;;
			*.rar)		rar x $1		;;
			*.gz)		gunzip $1		;;
			*.tar)		tar xf $1		;;
			*.tbz2)		tar xjf $1		;;
			*.tgz)		tar xzf $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
			*)	echo "'$1' cannot be extracted via extract()"	;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

#delatex () {
	## this converts tex input to pdf, doc, odt, and dvi
	## maybe overkill, but useful
	#for item in "$@" ; do
		#input=`echo "$item" | sed 's/\.tex$//'`
		#latex $input.tex ;
		#dvipdf $input.dvi ; 
		#pandoc -s $input.tex -o $input.doc ; 
		#pandoc -s $input.tex -o $input.odt ; 
	#done
#}

grab() {
sudo chown -R ${USER} ${1:-.}
}

psgrep() {
	if [ ! -z $1 ] ; then
		echo "Grepping for processes matching $1..."
		ps aux | grep $1 | grep -v grep
	else
		echo 					"!! Need name to grep for"
	fi
}

grepink() {
	ff=`/bin/ls | grep $1` 
	if [ $ff ] ; 
	then 
		inkscape $ff ; 
	else 
		echo "not found" ; 
	fi
}

sus(){ sort | uniq -c | sort $@; }

# added by Anaconda 1.9.2 installer
export PATH="$HOME/anaconda2/bin:$PATH"

# MUMmer
#export PATH="$HOME/software/MUMmer3.23:$PATH"

# vcf perl
#export PERL5LIB=$PERL5LIB:$HOME/software/vcftools_0.1.12b/perl/
#export PERL5LIB=$PERL5LIB:$HOME/software/CORTEX_release_v1.0.5.21/scripts/analyse_variants/bioinf-perl/lib/
#export PERL5LIB=$PERL5LIB:$HOME/software/CORTEX_release_v1.0.5.21//scripts/calling/

# for tmux. because they keep dumping the tmp dir and losing my socket
export TMPDIR=$HOME/

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/lib/pkgconfig

export R_LIBS=$HOME/R/

export ANT_OPTS=
export http_proxy=
export ftp_proxy=
export https_proxy=

# added by Anaconda3 4.0.0 installer
export PATH="$PATH:/home/jmerkin/anaconda3/bin"
