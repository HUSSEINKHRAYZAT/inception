all:
	docker compose -f srcs/docker-compose.yml up --build -d

down:
	docker compose -f srcs/docker-compose.yml down

fclean: down
	sudo rm -rf /home/$(USER)/data

re: fclean all
