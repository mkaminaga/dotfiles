#!/bin/bash
cd /usr/local/etc

echo curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh  -o git-prompt.sh
sudo curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh  -o git-prompt.sh
if [[ ${?} -eq 0 ]]; then
  echo success
else
  echo failure
fi

echo curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh  -o git-prompt.sh
sudo curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o git-completion.bash
if [[ ${?} -eq 0 ]]; then
  echo success
else
  echo failure
fi

