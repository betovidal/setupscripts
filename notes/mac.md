# Common caveats

- Make sure to point to $(brew --prefix) for anything involving binaries packages in general, installed by brew as they have (and probably will) change over time.
- Use brew to install bash and change the shell to use it (e.g. $(brew --prefix)/bin/bash), then add the output of the previous command to /etc/shells. Finally, update the shell used by your used by running

    $chsh -s $(brew --prefix)/bin/bash) your_username
