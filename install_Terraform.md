**1. Download the Terraform Binary:**

  * Visit the official Terraform downloads page: [https://www.terraform.io/downloads](https://www.google.com/url?sa=E&source=gmail&q=https://www.terraform.io/downloads)
  * Find the Linux section and locate the correct version for your system (likely 64-bit).  The filename will look something like `terraform_1.x.x_linux_amd64.zip` (replace `1.x.x` with the actual version number).
  * Download the zip file. You can do this through your browser or using the command line with `wget`:

<!-- end list -->

```bash
wget https://releases.hashicorp.com/terraform/1.x.x/terraform_1.x.x_linux_amd64.zip  # Replace with the actual URL
```

**2. Extract the Binary:**

  * Open a terminal.
  * Navigate to the directory where you downloaded the zip file (e.g., `Downloads`):

<!-- end list -->

```bash
cd Downloads
```

  * Unzip the file:

<!-- end list -->

```bash
unzip terraform_*.zip  # Use * to match the filename
```

This will extract the `terraform` executable file.

**3. Move the Binary to a Standard Location:**

  * It's best practice to place the `terraform` executable in a directory that's in your system's PATH.  `/usr/local/bin` is a common choice.

<!-- end list -->

```bash
sudo mv terraform /usr/local/bin/
```

**4. Verify the Installation:**

  * Check if Terraform is installed correctly by running:

<!-- end list -->

```bash
terraform --version
```

You should see the Terraform version number printed in the terminal. If you don't, double-check the previous steps, especially the `mv` command and make sure the path `/usr/local/bin` is in your `$PATH` environment variable.

**5. (Optional) Add Tab Completion (for Bash/Zsh):**

  * Terraform provides tab completion scripts for Bash and Zsh. This makes working with Terraform much easier.
  * Download the appropriate completion script. For Bash:

<!-- end list -->

```bash
wget https://raw.githubusercontent.com/hashicorp/terraform/main/scripts/terraform-completion.bash
```

  * For Zsh:

<!-- end list -->

```bash
wget https://raw.githubusercontent.com/hashicorp/terraform/main/scripts/terraform-completion.zsh
```

  * Place the completion script in the appropriate location. For Bash, this is usually `/etc/bash_completion.d/`:

<!-- end list -->

```bash
sudo mv terraform-completion.bash /etc/bash_completion.d/
```

  * For Zsh, it's typically `~/.zshrc` or `$ZSH_CUSTOM/plugins`:

<!-- end list -->

```bash
sudo mv terraform-completion.zsh ~/.zshrc # Or your zsh config location
```

  * Source the file (for Zsh):

<!-- end list -->

```bash
source ~/.zshrc
```

  * For Bash, you might need to restart your terminal or source the file.  Usually, new shells will pick up the completion automatically after placing it in `/etc/bash_completion.d/`.