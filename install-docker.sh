echo "I did not create this. this is just a continueation of the DesktopOnCodespaces mollomm1 thanks to him for creating this. -------> installation continuing in 10 seconds"
sleep 10
apt install docker.io podman sudo python3 pip python-is-python3 -y
pip install textual
sleep 2
python3 installer.py
docker build -t desktoponcodespaces . --no-cache
cd ..

sudo apt update
sudo apt install -y jq

mkdir Save
cp -r DesktopOnCodespaces/root/config/* Save

json_file="DesktopOnCodespaces/options.json"
if jq ".enablekvm" "$json_file" | grep -q true; then
    docker run --privileged -duit --name=DesktopOnCodespaces -e PUID=1000 -e PGID=1000 --device=/dev/kvm --security-opt seccomp=unconfined -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE=GamingOnCodespaces -p 3000:3000 --shm-size="2gb" -v $(pwd)/Save:/config -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /run:/run -v /etc/machine-id:/etc/machine-id:ro -v /run/systemd/system:/run/systemd/system -v /bin/systemctl:/bin/systemctl --restart unless-stopped -v /var/run/podman/podman.sock:/var/run/podman/podman.sock -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket -v /var/run/docker.sock:/var/run/docker.sock desktoponcodespaces
else
    docker run --privileged -d --name=DesktopOnCodespaces -e PUID=1000 -e PGID=1000 --security-opt seccomp=unconfined -e TZ=Etc/UTC -e SUBFOLDER=/ -e TITLE=GamingOnCodespaces -p 3000:3000 --shm-size="2gb" -v $(pwd)/Save:/config -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /run:/run -v /etc/machine-id:/etc/machine-id:ro -v /run/systemd/system:/run/systemd/system -v /bin/systemctl:/bin/systemctl --restart unless-stopped -v /var/run/podman/podman.sock:/var/run/podman/podman.sock -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket -v /var/run/docker.sock:/var/run/docker.sock desktoponcodespaces
fi
clear
echo "INSTALL FINISHED! it is on port 3000"
