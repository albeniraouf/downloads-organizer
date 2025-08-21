# Downloads Organizer

A Bash script to automatically organize files in your `~/Downloads` folder by grouping them into meaningful categories based on file extensions (e.g., Images, Videos, Documents). This tool helps keep your Downloads folder tidy and is perfect for anyone who wants a cleaner file system.

## Features
- Organizes files into intuitive categories like `Images`, `Videos`, `Archives`, `Documents`, `Code`, and more.
- Moves files without extensions to an `Others` folder.
- Skips temporary download files (e.g., `.crdownload`, `.part`) to avoid interrupting active downloads.
- Creates category folders only when needed.
- Provides feedback on moved files and created directories.
- Supports a wide range of file extensions for comprehensive organization.

## Installation
1. Clone or download this repository:
   ```bash
   git clone https://github.com/albeniraouf/downloads-organizer.git
   ```
2. Navigate to the project directory:
   ```bash
   cd downloads-organizer
   ```
3. Make the script executable:
   ```bash
   chmod +x organize_downloads.sh
   ```

## Usage
1. Run the script:
   ```bash
   ./organize_downloads.sh
   ```
2. The script will:
   - Check if the `~/Downloads` folder exists.
   - Organize files into category folders (e.g., `Images`, `Videos`, `Documents`).
   - Skip temporary download files.
   - Display progress (e.g., "Moved photo.jpg to Images/", "Created directory: Videos").

### Example
Before:
```
~/Downloads/
├── photo.jpg
├── video.mp4
├── document.pdf
├── script.py
├── archive.zip
├── file.crdownload
├── README
```

After:
```
~/Downloads/
├── Images/
│   └── photo.jpg
├── Videos/
│   └── video.mp4
├── Documents/
│   └── document.pdf
├── Code/
│   └── script.py
├── Archives/
│   └── archive.zip
├── Others/
│   └── README
├── file.crdownload (remains untouched)
```

## Temporary Download Files
To avoid interrupting active downloads, the script skips files with extensions commonly associated with in-progress downloads. These files remain in the `~/Downloads` folder until their download completes, after which they can be organized on the next run.

| Ignored Extension | Description |
|-------------------|-------------|
| `.crdownload`     | Chrome's temporary download file extension |
| `.part`           | Firefox's temporary download file extension |
| `.download`       | Generic temporary download extension |
| `.tmpdownload`    | Temporary download extension for some browsers |
| `.partial`        | Temporary download extension for some download managers |

## Requirements
- **Operating System**: Linux, macOS, or Windows (via WSL or Git Bash).
- **Bash**: Version 4.0 or higher (for associative array support).
- **Permissions**: Write access to the `~/Downloads` folder.

## Contributing
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Make your changes (e.g., add new extensions, improve error handling, or add a config file).
4. Test your changes thoroughly.
5. Submit a pull request with a clear description of your changes.

Please follow the [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/).

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Future Improvements
- Add a configuration file to customize extension mappings and ignored extensions.
- Implement a dry-run mode to preview moves without modifying files.
- Add logging to track file movements.
- Support organizing files in subfolders.

## Contact
For questions or suggestions, open an issue.

Happy organizing!