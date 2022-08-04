package mx.edu.utez.aweb.practica4.model;

import mx.edu.utez.aweb.practica4.utils.MySQLConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoInstructor {
    public List<BeanInstructor> listInstructor(){
        List<BeanInstructor> listInstructor = new ArrayList<>();
        try {
            Connection connection = MySQLConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from  instructor");
            while (rs.next()){
                BeanInstructor instructor = new BeanInstructor();
                instructor.setId(rs.getInt("idinstructor"));
                instructor.setNombre(rs.getString("nombre"));
                instructor.setApellido1(rs.getString("apellido1"));
                instructor.setApellido2(rs.getString("apellido2"));
                instructor.setFecNac(rs.getDate("fechaNac"));
                instructor.setCurp(rs.getString("curp"));
                instructor.setCorreo(rs.getString("correo"));
                instructor.setNumEmpleado(rs.getString("numempleado"));
                listInstructor.add(instructor);
            }
            rs.close();
            statement.close();
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }


        return  listInstructor;
    }
    public  boolean saveInstructor(BeanInstructor instructor){
        boolean result = false;
        try  (Connection con = MySQLConnection.getConnection();
                  PreparedStatement pstm = con.prepareStatement
                          ("insert  into instructor (nombre,apellido1,apellido2,curp,correo,numempleado) " +
                          "values (?,?,?,?,?,?);");

        ) {
            pstm.setString(1, instructor.getNombre());
            pstm.setString(2, instructor.getApellido1());
            pstm.setString(3, instructor.getApellido2());
            pstm.setString(4, instructor.getCurp());
            pstm.setString(5, instructor.getCorreo());
            pstm.setString(6, instructor.getNumEmpleado());
            result = pstm.executeUpdate() == 1;

        }catch (Exception e){
            e.printStackTrace();
        }
        return  result;
    }
    public  BeanInstructor getInstructor(int id) {
        BeanInstructor instructor = new BeanInstructor();
        try (
                Connection con = MySQLConnection.getConnection();
                PreparedStatement pstm = con.prepareStatement("Select * from instructor where idinstructor = ?;");
        ) {
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                instructor.setId(rs.getInt("idinstructor"));
                instructor.setNombre(rs.getString("nombre"));
                instructor.setApellido1(rs.getString("apellido1"));
                instructor.setApellido2(rs.getString("apellido2"));
                instructor.setFecNac(rs.getDate("fechaNac"));
                instructor.setCurp(rs.getString("curp"));
                instructor.setCorreo(rs.getString("correo"));
                instructor.setNumEmpleado(rs.getString("numempleado"));
            }
        }catch (Exception e) {
        }
            return instructor;

        }
    public boolean deleteInstructor(int idInstructor) {
        boolean result = false;
        try (Connection con = MySQLConnection.getConnection();
             PreparedStatement pstm = con.prepareStatement("delate from instructor where idinstructor=?;");
        ) {
            pstm.setInt(1,idInstructor);
            result = pstm.executeUpdate()==1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
    public  boolean updateInstructor(BeanInstructor instructor) {
        boolean result = false;
        try (Connection con = MySQLConnection.getConnection();
             PreparedStatement pstm = con.prepareStatement("update instructor set nombre= ?, apellido1 = ?,apellido2 = ?, curp = ?,correo = ?, numempleado = ? where idinstructor=?;");
        ) {
            pstm.setString(1, instructor.getNombre());
            pstm.setString(2, instructor.getApellido1());
            pstm.setString(3, instructor.getApellido2());
            pstm.setString(4, instructor.getCurp());
            pstm.setString(5, instructor.getCorreo());
            pstm.setString(6, instructor.getNumEmpleado());
            pstm.setLong(7, instructor.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    }



