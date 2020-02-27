all:
	echo "Pick a target ..."
apt:
	echo "./apt-common.sh"
apt-work:
	echo "./apt-other.sh"
fzf:
	./install.py -t fzf | tee -a install.log
	./lib/fzf.sh
git:
	./lib/git.sh
shell:
	./install.py -t shell | tee -a install.log
	./lib/shell.sh
spotify:
	echo "./apt-spotify.sh"
tmux:
	./install.py -t tmux | tee -a install.log
	./lib/tmux.sh
usr-dirs:
usr:
	./install.py -t usr | tee -a install.log
	./lib/usr.sh	
vim:
	./install.py -t vim | tee -a install.log
	./lib/vim.sh
