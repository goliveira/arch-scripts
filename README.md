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

## Verify the ISO File (Optional)

This is step is optional (but recommended). We will verify if the ISO file is not damaged and was not modified. To do this, we will use `sq`, a command-line frontend for Sequoia, an implementation of OpenPGP. To install it run:

On Arch Linux:

    sudo pacman -S sequoia-sq

On Ubuntu:

    sudo apt install sq

We will also use `b2sum`, but this program should already be installed on your Linux because it is part of the core utilities.

The following commands check the b2sum, download the release signing key, and verify the signature of the ISO files:

    b2sum -c b2sums.txt
    sq wkd get pierre@archlinux.de > release-key.pgp
    sq verify --signer-cert release-key.pgp --detached archlinux-x86_64.iso.sig archlinux-x86_64.iso

We will get an error message corresponding to files that we did not download. Ignore these messages. The relevant output lines are following:

    archlinux-x86_64.iso: OK
    1 good signature.

### Script

We saved the above commands in the file `verify_iso.sh`. You can execute it with

    chmod +x verify_iso.sh
    ./verify_iso.sh

or

    bash verify_iso.sh

### References

- <https://wiki.archlinux.org/title/Installation_guide#Verify_signature>
- <https://docs.sequoia-pgp.org/sq/>
- <https://man.archlinux.org/man/b2sum.1>