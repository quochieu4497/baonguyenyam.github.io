#!/bin/bash
printf "\033[1;36m=====================================\033[0m\n"
printf "\033[1;36mWelcome to the BAONGUYEN-App. This is the products of Asian Mobile Ventures\033[0m\n"
printf "\033[1;36mCopyright 2016\033[0m\n"
printf "\033[1;36mBuild by BAONGUYEN Team\033[0m\n"
printf "\033[1;36m=====================================\033[0m\n"
printf "\033[0;33mAre You ready to install?!?\033[0m\n"
read -p "Press enter to continue..." nothing
file="install.lock"
if [ -f "$file" ]
then
	printf "\033[1;31mApp is ready in your system. To Re-Install, please remove the 'install.lock' file and run again! Thanks.\033[0m\n"
else
	printf "\033[0;33mInstall Global Modules...\033[0m\n"
	npm i node-gyp pug-cli tsd typings express strongloop typescript hexo-cli node-sass gulp gulp-cli bower protractor karma webpack-dev-server rimraf webpack -g
	printf "\033[0;33mUpdate Bower Components...\033[0m\n"
	bower update
	printf "\033[0;33mInstall Node Modules...\033[0m\n"
	npm install --only=dev
	npm install
	printf "\033[0;33mInstall TypeScripts...\033[0m\n"
	tsd install
	typings install
	(
	   printf 'v0.1.5\n'
	) > install.lock
	printf "\033[1;32m-----------------------------\033[0m\n"
    printf "\033[1;32mCongrats! Install Finished.\033[0m\n"
fi

choice=""

while [ "$choice" != "q" ]
do
        echo
        echo "Please choice a selection!"
        echo "1) Run App"
        echo "2) Exit Install"
        echo "3) View Docs"
        echo "q) Quit"
        echo

        read choice

        case $choice in
            '1') npm start;;
            '2') exit 0;;
            '3') npm run tool;;
            'q') ;;
            *)   printf "\033[0;33mMenu item is not available, try again!\033[0m\n";;
        esac
done

exit 0
