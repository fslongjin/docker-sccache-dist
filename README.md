# Docker Sccache Dist
------
Deploy sccache distribute compile service with docker.


## Usage

### 1. Build Image

```bash
bash build.sh
```

### 2. Deploy a scheduler

#### 2.1 Configure

Set `SCHEDULER_URL` and `SCHEDULER_PORT` in `config.sh`. For security, you can set `SERVER_TOKEN` and `CLIENT_TOKEN` to a random string.

#### 2.2 Deploy!

```bash
bash deploy.sh
```

Then choice `Create scheduler container`.

### 3. Deploy a worker

#### 3.1 Configure

In addition to the above requirements, you also need to set the `BUILD_SERVER_PUBLIC_IP` and `BUILD_SERVER_PUBLIC_PORT` fields according to the worker's address so that other machines within the local network can connect to it.

#### 3.2 Deploy!

```bash
bash deploy.sh
```

Then choice `Create build-server container`.

### 4. Cofigure your local sccache

Please refer to [sccache-doc](https://github.com/mozilla/sccache/blob/main/docs/DistributedQuickstart.md#configure-a-client) to configure your local sccache.

### 5. Enjoy!

Now you can use sccache to compile your project with distributed compilation.
