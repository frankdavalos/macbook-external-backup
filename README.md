# macbook-external-backup

A simple, automated solution to back up data from a primary external drive to a secondary external drive using rsync and launchd on macOS.

## Features
- Reliable backups using 'rsync'
- Automatic execution via 'launchd'
- Conflict-free mechanism to prevent simultaneous runs
- Detailed logs for tracking backup success or failures

## Getting Started
- Follow the [User Guide](docs/user_guide.md) to use this solution.
- For setup instructions, refer to the [Admin Guide](docs/admin_guide.md).
- See [Troubleshooting](docs/troubleshooting.md) for common issues and resolutions.

## Project Structure

macbook-external-backup
├── backup-script
│   ├── backup_script.sh
│   └── com.user.backupscript.plist
├── docs
│   ├── admin_guide.md
│   ├── troubleshooting.md
│   └── user_guide.md
├── examples
│   ├── example_log.txt
│   └── plist_template.plist
└── tests
    ├── test_backup.sh
    └── test_environment.md
