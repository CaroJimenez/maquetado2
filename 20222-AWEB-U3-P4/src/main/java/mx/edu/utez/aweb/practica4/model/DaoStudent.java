package mx.edu.utez.aweb.practica4.model;
import mx.edu.utez.aweb.practica4.utils.MySQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoStudent {
    public List<BeanStudent> studentList() {
        List<BeanStudent> studentList = new ArrayList<>();
        try {
            Connection connection = MySQLConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from estudiante");

            while (rs.next()) {
                BeanStudent student = new BeanStudent();
                student.setMatricula(rs.getString("matricula"));
                student.setNombre(rs.getString("nombre"));
                student.setApellido1(rs.getString("apellido1"));
                student.setApellido2(rs.getString("apellido2"));
                student.setCorreo(rs.getString("correo"));
                student.setCurp(rs.getString("curp"));
                student.setContrasenia(rs.getString("contrasenia"));
                studentList.add(student);
            }
            rs.close();
            statement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;
    }
public boolean saveStudent (BeanStudent student){
        boolean result = false;
        try (Connection con = MySQLConnection.getConnection();
             PreparedStatement pstm = con.prepareStatement("insert into estudiante (matricula, nombre, apellido1, apellido2, curp,correo,contrasenia) values (?,?,?,?,?,?,?);");

        ){
            pstm.setString(1, student.getMatricula());
            pstm.setString(2, student.getNombre());
            pstm.setString(3, student.getApellido1());
            pstm.setString(4, student.getApellido2());
            pstm.setString(5, student.getCorreo());
            pstm.setString(6, student.getCurp());
            pstm.setString(7, student.getContrasenia());
            result = pstm.executeUpdate()==1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}
