#!/bin/bash
echo "\n|========= NodeJS Installation =========|\n"
echo "\n1.Download and install nvm:\n-------------\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

echo "\n2. Download and install Node.js (LTS)\n-------------\n"
nvm install --lts
nvm alias default lts/*

echo "\n3. Verify the Node.js version\n-------------"
node -v # Should print "v22.14.0".
nvm current # Should print "v22.14.0".

echo "\nVerify npm version\n-------------"
npm -v # Should print "10.9.2".

echo "Done!"
