[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias ew='cd ~/development/Etsyweb/'
alias ship='cd ~/development/Etsyweb/htdocs/assets/js/MissionControl/SubApps/ShippingAndOrders'
alias yk='php bin/shipping/labels/yakit/util/merchant.php'
alias storybook="cd ~/development/Etsyweb/storybook/; yarnpkg run storybook"
alias fixmyvm="sudo systemctl stop mysqld.service"
alias letsgocypress="sudo buildapack stop; cd ~/development/Etsyweb/node_modules/buildapack; env NODE_OPTIONS=--max-old-space_size=8192 ./bin/build-production --version-assets --output-dir=htdocs/assets/dist/js --no-compress --no-minify --locales=en-US --regions-disabled=atlas-legacy,atlas-legacy-react,atlas-modern-preact,legacy,legacy-shop,support,internal-tools --variant evergreen"

alias myprs="gh pr list -A jraubenheimer -s all -L 80"

function lazypush() {
    git add .
    git commit --amend --no-edit
    git push --force-with-lease
}

export DEBUG_PRINT_LIMIT=1000000;
export PATH=${HOME}/google-cloud-sdk/bin:$PATH
. "$HOME/.cargo/env"

alias tail_php='tail -f /var/log/httpd/php.log'
