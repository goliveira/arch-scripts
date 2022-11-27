# Gustavo's Arch Linux

## Acquire an installation image

The first step is downloading the ISO file:

1. Visit the web page <https://archlinux.org/download/>.
2. Choose a mirror.
3. Download the file `archlinux-x86_64.iso`.
4. (Optional) Download the files `archlinux-x86_64.iso.sig` and `b2sums.txt`.

On Linux, we can download the files on the command line using `wget`. To install it run:

On Arch Linux:

    sudo pacman -S wget

On Ubuntu:

    sudo apt install wget

Then edit the variable `MIRROR` accordingly and execute:

    MIRROR="http://linorg.usp.br/archlinux/iso/latest"
    wget $MIRROR/archlinux-x86_64.iso -O archlinux-x86_64.iso
    wget $MIRROR/archlinux-x86_64.iso.sig -O archlinux-x86_64.iso.sig
    wget $MIRROR/b2sums.txt -O b2sums.txt

(The `-O` option is necessary to overwrite older versions of the files if they already exist.)

### Script

We saved the above commands in the file `acquire_iso.sh`. You can execute it with

    bash acquire_iso.sh

Alternatively, make the script executable and run it:

    chmod +x acquire_iso.sh
    ./acquire_iso.sh

### References

- <https://wiki.archlinux.org/title/Installation_guide#Acquire_an_installation_image>
- <https://man.archlinux.org/man/wget.1>