import 'dart:async';
import 'dart:io';

import 'package:ems/employee.dart';

import 'global.dart';

void addEmployee(Employee emp) {
  if (emps.isEmpty) {
    emp.id = 1;
  } else {
    emp.id = emps.last.id + 1;
    emps.add(emp);
    print("add was seccuss");
    emp.printEmployeeInfo();
  }
}

getEmployee(int id) {
  for (Employee emp in emps) {
    emp.printEmployeeInfo();
    if (emp.id == id) {
      return emp;
    }
  }
  return false;
}

void printAllEmployees() {
  for (var emp in emps) {
    print("* " * 12);
    emp.printEmployeeInfo();
  }
}

void editEmployee(int id) {
  for (var emp in emps) {
    if (emp.id == id) {
      emp = edit(emp);
    }
  }
}

void allEmployees() {
  for (Employee emp in emps) {
    emp.printEmployeeInfo();
  }
}

Employee edit(Employee emp) {
  print("1- name 2- edit job description 3- salary 4- permissions");
  var eidtOption = stdin.readLineSync()!;
  switch (eidtOption) {
    //change name
    case == "1":
      print("input name");
      String name = stdin.readLineSync()!;
      emp.name = name;
      return emp;
    //change description
    case == "2":
      print("input job description");
      String jobDescriptions = stdin.readLineSync()!;
      emp.jobDescriptions = jobDescriptions;
      return emp;
    //change salary
    case == "3":
      print("input salary");
      double salary = double.parse(stdin.readLineSync()!);
      emp.salary = salary;
      return emp;
    //chage permission
    case == "4":
      print("select on of these permission");
      print("1- admin 2- dev 3- it");
      String permission = getPermission(stdin.readLineSync()!);
      emp.permission = permission;
      return emp;
  }
  return emp;
}

String getPermission(var permission) {
  switch (permission) {
    case == "1":
      return PermissionLevel.admin.toString().split(".").last;
    case == "2":
      return PermissionLevel.dev.toString().split(".").last;
    case == "3":
      return PermissionLevel.it.toString().split(".").last;
  }
  return PermissionLevel.it.toString().split(".").last;
}
