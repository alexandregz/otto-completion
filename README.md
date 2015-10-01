otto-completion.bash
====================

Simple bash completion for ottoi (https://ottoproject.io)


Usage
-----

- Clone repo

```bash
alex@vostok:/Volumes/HD/Development$ git clone https://github.com/alexandregz/otto-completion
alex@vostok:/Volumes/HD/Development$ cd otto-completion/
```

- Copy/move/link otto-completion file to your completion files dir:

For example, with [Homebrew](https://github.com/homebrew/homebrew) bash-completion:
```
alex@vostok:/Volumes/HD/Development/otto-completion(master)$ ln -s $(pwd)/otto-completion.bash  /usr/local/etc/bash_completion.d/otto
```

- Reload your shell: `source ~/.bash_profile`
