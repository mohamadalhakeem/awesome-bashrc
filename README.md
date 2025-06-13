# Awesome Bashrc 🐚✨

![Awesome Bashrc](https://img.shields.io/badge/Download%20Now-Release-blue.svg)

Welcome to **Awesome Bashrc**, an optimized `.bashrc` template designed for High Performance Computing (HPC) users. This repository aims to enhance your command line experience with features tailored for environments like TACC Lonestar 6 and UCAR HPC. 

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

The `.bashrc` file is a script that runs every time you open a new terminal session in a Unix-like operating system. For HPC users, having a well-configured `.bashrc` can significantly improve productivity. This repository provides a comprehensive template that includes module management, auto-backup, useful aliases, and environment redirection.

You can download the latest release [here](https://github.com/mohamadalhakeem/awesome-bashrc/releases). Please download the file and execute it to start using the template.

## Features

### Module Management

- Automatically load necessary modules for your HPC environment.
- Easy switching between different module versions.
- Customizable module paths.

### Auto-Backup

- Automatically backs up your current `.bashrc` before applying any changes.
- Keeps previous versions for easy recovery.

### Useful Aliases

- Shortcuts for frequently used commands.
- Customizable to fit your workflow.

### Environment Redirection

- Redirect output to log files for easier debugging.
- Set environment variables for better session management.

## Installation

To install the Awesome Bashrc template, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/mohamadalhakeem/awesome-bashrc.git
   ```
2. Navigate to the directory:
   ```bash
   cd awesome-bashrc
   ```
3. Run the installation script:
   ```bash
   ./install.sh
   ```
4. Source your new `.bashrc`:
   ```bash
   source ~/.bashrc
   ```

You can also download the latest release [here](https://github.com/mohamadalhakeem/awesome-bashrc/releases). Please download the file and execute it to start using the template.

## Usage

Once you have installed the template, you can start using the features right away. Here are some examples:

### Module Management

Load a module:
```bash
module load <module_name>
```

Switch between module versions:
```bash
module switch <old_module_name> <new_module_name>
```

### Aliases

Use your aliases for quicker command execution. For example:
```bash
alias ll='ls -la'
```

### Environment Redirection

Redirect output:
```bash
your_command > output.log 2>&1
```

## Customization

The `.bashrc` file is highly customizable. You can add your own aliases, modify module paths, or change environment variables. Here’s how to customize it:

1. Open the `.bashrc` file:
   ```bash
   nano ~/.bashrc
   ```
2. Add or modify the lines according to your needs.
3. Save and exit.
4. Source the file again:
   ```bash
   source ~/.bashrc
   ```

## Contributing

Contributions are welcome! If you have suggestions or improvements, please fork the repository and submit a pull request. 

### Steps to Contribute

1. Fork the repository.
2. Create a new branch:
   ```bash
   git checkout -b feature/YourFeature
   ```
3. Make your changes and commit:
   ```bash
   git commit -m "Add your feature"
   ```
4. Push to your branch:
   ```bash
   git push origin feature/YourFeature
   ```
5. Open a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact

For questions or suggestions, feel free to reach out:

- GitHub: [mohamadalhakeem](https://github.com/mohamadalhakeem)
- Email: mohamadalhakeem@example.com

Thank you for using Awesome Bashrc! We hope it enhances your HPC experience. Don't forget to check the "Releases" section for updates and new features.