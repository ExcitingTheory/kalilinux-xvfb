# kalilinux-xvfb

These allow us to use Kali Linux in Docker networks with a GUI/SSH/VNC Server. The containers are all published in Docker Hub as part of GitHub Actions in this repo, and the Dockerfiles are included here in the hopes other security researchers will find them useful. 

The idea was to bring all the goodness of Kali Linux to a headless environment. The images are based on the official Kali Linux docker images. The images are intended to be used as a base image for other images, or as a standalone image.

## Base image

The base image is a headless kali linux with a virtual frame buffer and a VNC server. It is intended to be used as a base image for other images, or as a standalone image for headless use. The VNC server is exposed on port `5901`.

## TorBrowser image

The TorBrowser image is a headless kali linux with a virtual frame buffer, a VNC server, and TorBrowser. It is intended to be used as an image for a selenium runner heavily customized firefox profile to support TOR. See the TorDriver project for more information.

## TorBrowser-root image

The same as the TorBrowser image, but with root access.

## Building the images

Use docker to build locally
```
docker build . -t excitingtheory/kalilinux-xvfb 
```

Use docker to run, doesn't need to be built locally
```
docker run -it -p 5901:5901 excitingtheory/kalilinux-xvfb /bin/bash
```

### Building the other images

Use docker to build locally

```
docker build . -f ./TorBrowser.Dockerfile -t excitingtheory/kalilinux-xvfb:torbrowser
docker build . -f ./TorBrowser-root.Dockerfile -t excitingtheory/kalilinux-xvfb:torbrowser-root
```

## Using VNC

This image comes with a vnc user

### Start the VNC server

Start the container with the following command.

```
docker run -it -p 5901:5901 excitingtheory/kalilinux-xvfb:torbrowser
```


Run `/opt/start-vnc-server.sh `.

You will be prompted to set a password. The password is `guestpas` in the examples below.

``` bash
/opt/start-vnc-server.sh 

# You will require a password to access your desktops.

# Password: 
# Verify:   
# Would you like to enter a view-only password (y/n)? n
# xauth:  file /home/username/.Xauthority does not exist

# New 'X' desktop is 466129c49ea6:1

# Creating default startup script /home/username/.vnc/xstartup
# Starting applications specified in /home/username/.vnc/xstartup
# Log file is /home/username/.vnc/466129c49ea6:1.log
```


### On macOS

With Finder open as the main app. Press `cmd-k` the "Connect to Server Dialog" will open. Enter `vnc://localhost:5901` and the password `guestpas` when prompted.

Dialog can also be found in the finder menu: Go -> Connect to Server

### On Windows

Download and install a vnc client like [TightVNC](https://www.tightvnc.com/download.php) and connect to `localhost:5901` and the password `guestpas` when prompted.


# Contributing

Contributions are welcome. Please open an issue or submit a pull request.

# License

MIT License, see [LICENSE.txt](LICENSE.txt) for details.
