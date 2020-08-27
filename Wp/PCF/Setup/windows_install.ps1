# Install Chocolatey
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Create ~/workspace
New-Item -ItemType Directory -Path "$HOME" -Name 'workspace' -Force

# Install dependencies
choco install -y visualstudio2019community --limit-output --no-progress --version 16.0.3.0
choco install -y cloudfoundry-cli          --limit-output --no-progress --version 6.44.1
choco install -y curl                      --limit-output --no-progress --version 7.64.1
choco install -y mysql                     --limit-output --no-progress --version 8.0.15
choco install -y mysql-cli                 --limit-output --no-progress --version 8.0.11
choco install -y mysql.workbench           --limit-output --no-progress --version 8.0.15.20190204
choco install -y postman                   --limit-output --no-progress --version 7.0.6
choco install -y adoptopenjdk8             --limit-output --no-progress --version 8.212.1
choco install -y jq                        --limit-output --no-progress --version 1.5
choco install -y dotnetcore-sdk            --limit-output --no-progress --version 2.2.105
choco install -y flyway.commandline        --limit-output --no-progress --version 5.2.4
choco install -y git                       --limit-output --no-progress --version 2.21.0
choco install -y erlang                    --limit-output --no-progress --version 20.2
choco install -y rabbitmq                  --limit-output --no-progress --version 3.7.3

# Copy Erlang to enable the RabbitMQ CLI
# https://www.rabbitmq.com/cli.html
Copy-Item -Force -Path C:\Windows\System32\config\systemprofile\.erlang.cookie -Destination $Env:UserProfile

# Add spring.cloud.hystrix.stream vhost, permissions
$rabbit_path="$Env:ProgramFiles\RabbitMQ Server\rabbitmq_server*\sbin"
& "$rabbit_path\rabbitmqctl.bat" add_vhost spring.cloud.hystrix.stream
& "$rabbit_path\rabbitmqctl.bat" set_permissions -p spring.cloud.hystrix.stream guest ".*" ".*" ".*"
