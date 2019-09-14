using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UCRMS.Gateway;
using UCRMS.Models;

namespace UCRMS.Manager
{
    public class StudentManager
    {
        StudentGateway studentGateway = new StudentGateway();
        DepartmentGateway departmentGateway = new DepartmentGateway();
        public bool SaveStudent(Student student)
        {
            string regNo = "";
            int counter = 0;
            string year = "" + Convert.ToDateTime(student.Date).Year;

            string departmentName = departmentGateway.ShowDepartmentCode(student.DepartmentId);

            regNo = studentGateway.GetRegNo(student, year);
            if (regNo.Equals("0"))
            {
                counter++;
                string count = counter.ToString("D3");
                regNo = departmentName + "-" + year + "-" + count;
            }
            else
            {
                string[] tokens = regNo.Split('-');
                string depName = tokens[0];
                string year1 = tokens[1];
                counter = int.Parse(tokens[2]);

                if (depName.Equals(departmentName))
                {
                    if (year.Equals(year1))
                    {
                        counter++;
                        string count = counter.ToString("D3");
                        regNo = departmentName + "-" + year + "-" + count;
                    }
                    else
                    {
                        regNo = departmentName + "-" + year + "-" + "001";
                    }
                }
                else
                {
                    counter++;
                    string count = counter.ToString("D3");
                    regNo = departmentName + "-" + year + "-" + count;
                }
            }

            student.RegNo = regNo;
            return studentGateway.SaveStudent(student) > 0;

        }

        public ViewStudentWithDEpartment GetStudent()
        {
            return studentGateway.GetStudent();
        }

        public List<ViewStudentWithDEpartment> GetStudentRegNoId()
        {
            return studentGateway.GetStudentRegNoId();
        }

        public ViewStudentWithDEpartment GetStudentByRegNo(int id)
        {
            return studentGateway.GetStudentByRegNo(id);
        }

        public bool AssignCourseToStudent(CourseAssignStudent courseAssignStudent)
        {
            return studentGateway.AssignCourseToStudent(courseAssignStudent) > 0;
        }

        //public string IsEmailExists(string email)
        //{
        //    if (studentGateway.IsEmailExists(email))
        //    {
        //        return "Email Already Exists.Try Your Own Email";
        //    }
        //    else
        //    {
        //        return;
        //    }

        //}

        public bool IsEmailExist(string Email)
        {
            return studentGateway.IsEmailExists(Email);
        }

        public List<Student> GetEnrolledStudentRegNo()
        {
            return studentGateway.GetEnrolledStudentRegNo();
        }

        public bool SaveStudentWithResult(StudentResult studentResult)
        {
            return studentGateway.SaveStudentWithResult(studentResult) > 0;
        }

        public List<ResultView> GetResultViews(int id)
        {
            return studentGateway.GetResultViews(id);
        }
    }
}