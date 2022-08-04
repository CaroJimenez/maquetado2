package mx.edu.utez.aweb.practica4.control;
import mx.edu.utez.aweb.practica4.model.BeanPerson;
import mx.edu.utez.aweb.practica4.model.DaoPerson;
import mx.edu.utez.aweb.practica4.utils.MySQLConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ServicePerson {
    public List<BeanPerson> ListPersons(){
        DaoPerson daoPerson=new DaoPerson();
        List<BeanPerson> ListPersons=daoPerson.listPersons();
        return ListPersons;
    }

    public boolean updatePerson(BeanPerson person){
        DaoPerson daoPerson = new DaoPerson();
        boolean result = daoPerson.updatePerson(person);

        return result;
    }

    public boolean deletePerson(int idPerson){
        DaoPerson daoPerson= new DaoPerson();
        boolean person = daoPerson.deletePerson(idPerson);
        return person;
    }

    public BeanPerson getPerson(int id){
        DaoPerson daoPerson = new DaoPerson();
        BeanPerson person = daoPerson.getPerson(id);
        return person;
    }
    public boolean savePerson (BeanPerson person){
        DaoPerson daoPerson = new DaoPerson();
        boolean result = daoPerson.savePerson(person);
        return result;
    }
}
