# log-archive-tool

## Table of Contents

- [About](#about)
- [Features](#features)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Installation & Usage](#installation--usage)
- [Example Output](#example-output)
- [How It Works](#how-it-works)
- [Error Handling](#error-handling)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)

## About

`log-archive-tool` is my fourth Linux/Bash project in my DevOps learning journey. It is a simple command-line script for packaging a single log directory into a compressed archive. It prints a short banner, validates the input, creates a timestamped archive name, and saves the archive in the local `archives/` directory.

**Project Reference:** [roadmap.sh/projects/log-archive-tool](https://roadmap.sh/projects/log-archive-tool)

## Features

- Accepts exactly one directory path as input.
- Verifies that the provided path exists and is a directory.
- Creates timestamped archives in the format `logs_archive_YYYYMMDD_HHMMSS.tar.gz`.
- Automatically creates the `archives/` directory if it does not exist.
- Uses `tar -czf` to compress the directory into a `.tar.gz` file.

## Project Structure

```text
log-archive-tool/
├── log-archive.sh
├── README.md
└── archives/
```

- `log-archive.sh`: main Bash script.
- `archives/`: output folder for generated archives.
- `README.md`: documentation of the project.

## Requirements

- Bash
- `tar`
- Standard Unix utilities such as `date`, `mkdir`.

The script is intended to run on Linux or any Unix-like environment with these tools available.

## Installation & Usage

### 1. Clone or Download

Option A - Clone with Git:

```bash
git clone https://github.com/JescAude18/log-archive-tool.git
cd log-archive-tool
```

Option B - Download ZIP from GitHub:

1. Open the repository page: `https://github.com/JescAude18/log-archive-tool`
2. Click `Code` -> `Download ZIP`
3. Extract the archive and move into the project folder:

```bash
cd log-archive-tool
```

### 2. Make Executable

```bash
chmod +x log-archive.sh
```

### 3. Run the Script with a log directory

```bash
./log-archive.sh <log-directory>
```

## Example Output

```text
=========================== LOG ARCHIVE TOOL ===========================
=                   Welcome to the log-archive tool !                  =
========================================================================
Archiving logs from: /var/log
Archive name: logs_archive_20260421_142530.tar.gz
Archive 'logs_archive_20260421_142530.tar.gz' created successfully in ./archives directory !
```

## How It Works

The script follows this flow:

1. Prints a banner.
2. Checks that exactly one argument is provided.
3. Validates that the argument points to an existing directory.
4. Builds a timestamp using `date "+%Y%m%d_%H%M%S"`.
5. Creates `./archives` if necessary.
6. Runs `tar -czf` to compress the directory.
7. Stores the resulting archive in `./archives`.

The archive name includes the current date and time so each run produces a unique file.

## Error Handling

The script handles the following cases:

- No argument or more than one argument: the script exits with an error message.
- Invalid path: the script reports that the directory does not exist and exits with status `1`.
- Missing `archives/` directory: the script creates it automatically.

Note: when archiving an absolute path such as `/var/log`, `tar` may display a message like `Removing leading '/' from member names`. This is normal behavior and does not indicate failure.

## Roadmap

- Add support for multiple input directories.
- Allow custom archive output paths.
- Add optional cleanup of old archives.

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Make your changes
4. Commit with clear messages (`git commit -m "Add feature description"`)
5. Push to the branch
6. Open a Pull Request

## Author

**Created by**: Jessica MOUSSOUGAN

**Email**: [jessicamoussougan@gmail.com](mailto:jessicamoussougan@gmail.com)

**GitHub**: [@JescAude18](https://github.com/JescAude18)

## License

No license yet.

This project is currently for personal training and learning.
