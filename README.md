# Ansible Example Script

Fetch module examples.

## Usage

```shell
$ ae systemd


  ## Examples

    - name: Make sure a service unit is running
      ansible.builtin.systemd:
        state: started
        name: httpd

    - name: Stop service cron on debian, if running
      ansible.builtin.systemd:
        name: cron
        state: stopped

    - name: Restart service cron on centos, in all cases, also issue daemon-reload to pick up
  config changes
      ansible.builtin.systemd:
        state: restarted
        daemon_reload: yes
        name: crond

    - name: Reload service httpd, in all cases
      ansible.builtin.systemd:
        name: httpd.service
        state: reloaded
```

## Installation

1. Install `html-xml-utils` and `glow`:

  ```shell
  paru -S html-xml-utils
  sudo pacman -S glow
  ```

2. Install `html2md`:
  Use bundled `html2md` or build from sources (rust required):

  ```
  git clone https://gitlab.com/Kanedias/html2md.git
  cargo build --release
  ```

3. Install ansible example script:

  Copy `ae.sh` in `~/bin` and append this path to `$PATH`.

  ```shell
  sudo cp html2md /usr/local/bin/
  ```

  Create alias in `~/.bashrc`:

  ```bash
  alias ae="~/bin/ae.sh"
  ```

## How it works

1. Check if module page present in file cache
2. If not present - download into file
3. Read html, normalize code, select 'Examples' section
4. Convert html to markdown and create file cache
5. Render markdown with [glow](https://github.com/charmbracelet/glow)

## Thanks

- [Kanedias](https://gitlab.com/Kanedias) for [html2md](https://gitlab.com/Kanedias/html2md)
- [Charm](https://github.com/charmbracelet) for [glow](https://github.com/charmbracelet/glow)
