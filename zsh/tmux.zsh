# workspace for itowns
# https://github.com/iTowns/itowns
function tmux-itowns() {
	tmux new -s itowns -c $HOME/Workspace/itowns -n vim vim \; \
		neww -n ci \; \
		splitw -h -p 50 npm run debug \; \
		splitw -v -p 50 npm run test-unit -- -- --watch \; \
		selectp -t 0 \;
}
