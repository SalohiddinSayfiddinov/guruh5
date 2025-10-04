# Excel Feature

This feature allows users to create Excel files with sample data and download them to their mobile device.

## Features

- ✅ Create Excel files with formatted data
- ✅ Sample employee data with Name, Age, Email, Department, and Salary
- ✅ Beautiful UI with gradient background
- ✅ File download to device storage
- ✅ Permission handling for file storage
- ✅ Error handling and user feedback

## Files Structure

```
lib/features/excel/
├── models/
│   └── excel_data.dart          # Data model for Excel content
├── services/
│   └── excel_service.dart       # Excel creation and file handling
├── pages/
│   └── excel_page.dart          # Main UI page
├── excel_feature.dart           # Export file
└── README.md                    # This documentation
```

## Usage

1. **Navigate to Excel Page**: The app opens directly to the Excel page
2. **Preview Data**: View the sample employee data in the preview section
3. **Create Excel**: Tap the "Create Excel" button to generate the file
4. **Download**: Tap the "Download" button to save the file to device storage

## Dependencies

The following packages are required:

- `excel: ^4.0.2` - For Excel file creation and manipulation
- `path_provider: ^2.1.4` - For accessing device directories
- `permission_handler: ^11.3.1` - For requesting storage permissions

## Permissions

The following Android permissions are required:

- `WRITE_EXTERNAL_STORAGE`
- `READ_EXTERNAL_STORAGE`
- `MANAGE_EXTERNAL_STORAGE`

## File Location

Excel files are saved to:
- **Android**: `/storage/emulated/0/Android/data/[package_name]/files/Download/`
- **iOS**: App Documents directory

## Sample Data

The feature includes sample employee data with the following structure:

| Name | Age | Email | Department | Salary |
|------|-----|-------|------------|--------|
| John Doe | 28 | john.doe@company.com | Engineering | $75,000 |
| Jane Smith | 32 | jane.smith@company.com | Marketing | $68,000 |
| Mike Johnson | 25 | mike.johnson@company.com | Sales | $55,000 |
| Sarah Wilson | 29 | sarah.wilson@company.com | HR | $62,000 |
| David Brown | 35 | david.brown@company.com | Engineering | $85,000 |

## Customization

To modify the data or add new fields:

1. Update the `ExcelData` model in `models/excel_data.dart`
2. Modify the `getSampleData()` method to include your data
3. Update the Excel service headers and column mapping in `services/excel_service.dart`

## Error Handling

The feature includes comprehensive error handling for:
- Permission denial
- File creation failures
- Storage access issues
- Network connectivity problems

All errors are displayed to the user via SnackBar messages.
