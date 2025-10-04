import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../models/excel_data.dart';

class ExcelService {
  static Future<String?> createAndSaveExcel(List<ExcelData> data) async {
    try {
      // Create a new Excel file
      var excel = Excel.createExcel();

      // Get the default sheet
      Sheet sheetObject = excel['Sheet1'];

      // Set headers
      List<String> headers = ['Name', 'Age', 'Email', 'Department', 'Salary'];
      for (int i = 0; i < headers.length; i++) {
        var cell = sheetObject.cell(
          CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0),
        );
        cell.value = TextCellValue(headers[i]);
        cell.cellStyle = CellStyle(
          bold: true,
          backgroundColorHex: ExcelColor.blue,
          fontColorHex: ExcelColor.white,
        );
      }

      // Add data rows
      for (int i = 0; i < data.length; i++) {
        var rowData = data[i];
        var map = rowData.toMap();

        sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 1))
            .value = TextCellValue(map['Name']);
        sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 1))
            .value = IntCellValue(map['Age']);
        sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 1))
            .value = TextCellValue(map['Email']);
        sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 1))
            .value = TextCellValue(map['Department']);
        sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 1))
            .value = DoubleCellValue(map['Salary']);
      }

      // Auto-fit columns
      sheetObject.setColumnWidth(0, 20);
      sheetObject.setColumnWidth(1, 10);
      sheetObject.setColumnWidth(2, 30);
      sheetObject.setColumnWidth(3, 15);
      sheetObject.setColumnWidth(4, 12);

      // Save the file
      var fileBytes = excel.save();
      if (fileBytes != null) {
        return await saveExcelFile(fileBytes);
      }

      return null;
    } catch (e) {
      print('Error creating Excel file: $e');
      return null;
    }
  }

  static Future<String?> saveExcelFile(List<int> bytes) async {
    try {
      // Request storage permission
      var status = await Permission.storage.request();
      if (!status.isGranted) {
        // Android 11+ may need manageExternalStorage
        status = await Permission.manageExternalStorage.request();
      }

      if (!status.isGranted) {
        print('Storage permission not granted');
        return null;
      }

      Directory? directory;
      if (Platform.isAndroid) {
        // Get the base external storage dir
        Directory? extDir = await getExternalStorageDirectory();
        String newPath = "";
        List<String> folders = extDir!.path.split("/");

        for (int x = 1; x < folders.length; x++) {
          String folder = folders[x];
          if (folder == "Android") break; // stop at Android/
          newPath += "/$folder";
        }
        newPath = "$newPath/Download"; // go to real Downloads
        directory = Directory(newPath);
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }

      // Create filename with timestamp
      String fileName =
          'employee_data_${DateTime.now().millisecondsSinceEpoch}.xlsx';
      String filePath = '${directory.path}/$fileName';

      File file = File(filePath);
      await file.writeAsBytes(bytes, flush: true);

      print('Excel file saved at: $filePath');
      return filePath;
    } catch (e) {
      print('Error saving Excel file: $e');
      return null;
    }
  }

  static Future<bool> downloadFile(String filePath) async {
    try {
      File file = File(filePath);
      if (await file.exists()) {
        // For demonstration, we'll just show the file path
        // In a real app, you might want to use a package like flutter_file_manager
        // or share_plus to open the file with system apps
        print('File is ready for download at: $filePath');
        return true;
      }
      return false;
    } catch (e) {
      print('Error downloading file: $e');
      return false;
    }
  }
}
