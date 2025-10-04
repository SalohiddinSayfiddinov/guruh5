class ExcelData {
  final String name;
  final int age;
  final String email;
  final String department;
  final double salary;

  ExcelData({
    required this.name,
    required this.age,
    required this.email,
    required this.department,
    required this.salary,
  });

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Age': age,
      'Email': email,
      'Department': department,
      'Salary': salary,
    };
  }

  static List<ExcelData> getSampleData() {
    return [
      ExcelData(
        name: 'John Doe',
        age: 28,
        email: 'john.doe@company.com',
        department: 'Engineering',
        salary: 75000.0,
      ),
      ExcelData(
        name: 'Jane Smith',
        age: 32,
        email: 'jane.smith@company.com',
        department: 'Marketing',
        salary: 68000.0,
      ),
      ExcelData(
        name: 'Mike Johnson',
        age: 25,
        email: 'mike.johnson@company.com',
        department: 'Sales',
        salary: 55000.0,
      ),
      ExcelData(
        name: 'Sarah Wilson',
        age: 29,
        email: 'sarah.wilson@company.com',
        department: 'HR',
        salary: 62000.0,
      ),
      ExcelData(
        name: 'David Brown',
        age: 35,
        email: 'david.brown@company.com',
        department: 'Engineering',
        salary: 85000.0,
      ),
    ];
  }
}
