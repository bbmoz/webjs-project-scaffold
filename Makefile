.DEFAULT_GOAL := start

##################
# Variables
##################

nodes = 1
NO_COLOR = \033[0m
OK_COLOR = \033[32;01m
INFO_COLOR = \033[33;01m
WARN_COLOR = \033[31;01m

##################
# Logging
##################

pre-task-msg:
	@printf "\n$(INFO_COLOR)$(name) $(OK_COLOR)[STARTED]$(NO_COLOR)\n\n"

post-task-msg:
	@printf "\n$(INFO_COLOR)$(name) $(OK_COLOR)[FINISHED]$(NO_COLOR)\n\n"

no-program-msg:
	@printf "\n$(INFO_COLOR)$(name) $(WARN_COLOR)[NOT RUNNING]$(NO_COLOR)\n\n"
	exit 1

##################
# Tasks
##################

deps:
	type docker >/dev/null 2>&1 || $(MAKE) no-program-msg name=docker

start: deps
	$(MAKE) pre-task-msg name=$@
	-docker stop selenium-hub
	-docker rm selenium-hub
	docker-compose up -d
	docker ps
	$(MAKE) post-task-msg name=$@

scale: deps
	$(MAKE) pre-task-msg name=$@
	docker-compose scale selenium-chrome=$(nodes)
	docker-compose scale selenium-firefox=$(nodes)
	docker ps
	$(MAKE) post-task-msg name=$@

