package mx.edu.utez.aweb.practica4.control;

import mx.edu.utez.aweb.practica4.model.BeanStudent;
import mx.edu.utez.aweb.practica4.model.DaoPerson;
import mx.edu.utez.aweb.practica4.model.DaoStudent;

import java.util.List;

public class ServiceStudent {
    public List<BeanStudent>studentList() {
        DaoStudent daoStudent=new DaoStudent();
        List<BeanStudent> studentList= daoStudent.studentList();

        return studentList();
    }
   public boolean saveStudent (BeanStudent student){
        DaoStudent daoStudent = new DaoStudent();
        boolean result = daoStudent.saveStudent(student);
        return result;
   }

}
