# JP dotfiles

My dotfiles. To be managed using GNU/Stow. To deploy it we need git and stow.
In a debian based system install with:

```bash
sudo apt install stow git
```

To download and deploy:

```bash
git clone https://github.com/jpssrocha/dotfiles.git

cd dotfiles

stow */
```

Done. Now these dotfiles are deployed on the machine.
