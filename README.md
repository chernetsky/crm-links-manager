# clm

_your application description_

## Commands
* `make dep` - Installs dependencies to ./.rocks folder
* `make run` - Runs Tarantool instance locally inside the ./.tnt/init folder.
* `make test` - Runs tests from ./t folder

## Deploy
To deploy application the recommended directory structure is the following:
```
/
├── etc
│   └── clm
│       └── conf.lua
└── usr
    └── share
        └── clm
            ├── init.lua
            ├── app/
            └── .rocks/
```
You need to put a symlink `/etc/tarantool/instances.enabled/clm.lua -> /usr/share/clm/init.lua
` and you are ready to start your application by either `tarantoolctl start clm` or, if you're using systemd - `systemctl start tarantool@clm`
