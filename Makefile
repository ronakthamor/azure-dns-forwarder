gitpush: ## Push to github, USE: make gitpush M="commit msg"
	@git add . && git commit -m "${M}" && git push origin master