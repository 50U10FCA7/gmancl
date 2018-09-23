# gmancl
Client for manage gmod addons using git

# Usage
```sh
gman [lib name] [script name] [args]
```

 - configurating
```sh
gman repository set-ip			[remote host ip]		#set remote host ip for all repositories(addons)
gman repository set-port		[remote host port]		#set remote host port for all repositories(addons)
gman repository set-repositories-local	[local repositories path]	#set local repositories path for all repositories(addons)
gman repository set-repositories-remote	[remote host repositories path]	#set remote host repositories path for all repositories(addons)
gman repository set-user		[remote host user name]		#set remote host user name for all repositories(addons)
```

 - repository(addon) managment
```sh
gman repository create		[repository(addon) name]	#create repository(addon)
gman repository remove		[repository(addon) name]	#remove repository(addon)
gman repository fetch		[repository(addon) name]	#fetch repository(addon)
gman repository list						#print list of repositories
gman repository set-ip		[remote host ip]		#set remote host ip
gman repository set-port	[remote host port]		#set remote host port
gman repository set-remote	[remote host repositories path]	#set remote host repositories path
gman repository set-user	[remote host user name]		#set remote host user name
```