sudo reflector --verbose --country 'United States' --latest 200 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
