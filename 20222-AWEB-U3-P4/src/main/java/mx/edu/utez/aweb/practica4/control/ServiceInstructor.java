package mx.edu.utez.aweb.practica4.control;

import mx.edu.utez.aweb.practica4.model.BeanInstructor;
import mx.edu.utez.aweb.practica4.model.DaoInstructor;

import java.util.List;

public class ServiceInstructor {
public List<BeanInstructor>ListInstructor(){
    DaoInstructor daoInstructor = new DaoInstructor();
    List<BeanInstructor> ListInstructor=daoInstructor.listInstructor();
    return ListInstructor;
}
    public boolean updateInstructor(BeanInstructor instructor){
        DaoInstructor daoInstructor = new DaoInstructor();
        boolean result = daoInstructor.updateInstructor(instructor);

        return result;
    }

public  boolean deletePerson(int idInstructor ){
    DaoInstructor daoInstructor = new DaoInstructor();
    boolean instructor = daoInstructor.getInstructor(idInstructor);
    return instructor;
}
    public BeanInstructor getInstructor (int id){
    DaoInstructor daoInstructor = new DaoInstructor();
    BeanInstructor instructor = daoInstructor.getInstructor(id);
    return  instructor;
    }
    public boolean saveInstructor (BeanInstructor instructor){
        DaoInstructor daoInstructor = new DaoInstructor();
        boolean result = daoInstructor.saveInstructor(instructor);
        return result;
    }
}
