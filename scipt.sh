#!/bin/bash
function press_enter {
	printf "\n"
	printf "Press Enter to continue..."
	read
	clear
}

selection=
until [ "$selection" = "0" ]; do
	printf "\nSelect from the menu: \n\n" 
	printf " Test 1) VM Connection Test\n"
	printf " Test 2) List all Containers\n"
	printf " Test 3) List Running Containers\n"
	printf " Test 4) Inspect a Container\n"
	printf " Test 5) Delete a Container\n"
	printf " Test 6) Delete all Containers\n"
	printf " Test 7) Create a Container from an Image\n"
	printf " Test 8) Restart a Container\n"
	printf " Test 9) Stop a Container\n"
	printf " Test 10) Show Logs from a Container\n"
	printf " Test 11) List all Images\n"
	printf " Test 12) Delete an Image\n"
	printf " Test 13) Delete all Images\n"
	printf " Test 14) TAG an Image\n"
	printf " Test 15) Create Docker Images from Local Dockerfile\n"
	printf " \n 99) Exit\n"

	printf "\nSelection: "
	read selection

	case $selection in
		1  ) 	http://ec2-52-30-47-247.eu-west-1.compute.amazonaws.com 
			press_enter
			;;
		2  )   	curl -s -X GET -H 'Accept: application/json' http://localhost:8080/containers | python -mjson.tool
			press_enter
			;;
		3  ) 	curl -s -X GET -H 'Accept: application/json' http://localhost:8080/containers?state=running | python -mjson.tool
			press_enter
			;;
		4  ) 	curl -s -X GET -H 'Accept: application/json' http://localhost:8080/containers/bfe2305d5b31 | python -mjson.tool
			press_enter
			;;
		5  ) 	curl -s -X DELETE -H 'Accept: application/json' http://localhost:8080/containers/bfe2305d5b31 | python -mjson.tool
			press_enter
			;;
		6  ) 	curl -s -X DELETE -H 'Accept: application/json' http://localhost:8080/containersDel | python -mjson.tool
			press_enter
			;;
		7  ) 	curl -X POST -H 'Content-Type: application/json' http://localhost:8080/containers -d '{"image": "49b7d316bf66"}' | python -mjson.tool
			press_enter
			;;
		8  )	curl -X PATCH -H 'Content-Type: application/json' http://localhost:8080/containers/bfe2305d5b31 -d '{"state": "running"}'
			press_enter
			;;
		9  ) 	curl -X PATCH -H 'Content-Type: application/json' http://localhost:8080/containers/bfe2305d5b31 -d '{"state": "stopped"}'
			press_enter
			;;
		10 )	curl -s -X GET -H 'Accept: application/json' http://localhost:8080/containers/bfe2305d5b31/logs | python -mjson.tool 
			press_enter
			;;
		11 )	curl -s -X GET -H 'Accept: application/json' http://localhost:8080/images | python -mjson.tool
			press_enter
			;;
		12 )	curl -s -X DELETE -H 'Accept: application/json' http://localhost:8080/images/imgID | python -mjson.tool
			press_enter
			;;
		13 )	curl -s -X DELETE -H 'Accept: application/json' http://localhost:8080/containersDel | python -mjson.tool
			press_enter
			;;
		14 )	curl -s -X PATCH -H 'Content-Type: application/json' http://localhost:8080/images/id -d '{"tag": "test:1.0"}'
			press_enter
			;;
		15 )	curl -H 'Accept: application/json' -F file=@Dockerfile http://localhost:8080/images | python -mjson.tool
			press_enter
			;;
		99) exit
			;;
		* ) printf "You did not choose a valid option!\n"
	esac
done

printf "\n"
