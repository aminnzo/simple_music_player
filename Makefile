repair:
	flutter pub pub cache repair

update-icon:
	flutter packages pub run flutter_launcher_icons:main

run-all:
	flutter run -d all

kill-all:
	killall -9 dart