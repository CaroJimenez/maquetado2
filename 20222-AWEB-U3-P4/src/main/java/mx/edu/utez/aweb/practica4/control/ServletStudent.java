package mx.edu.utez.aweb.practica4.control;

import mx.edu.utez.aweb.practica4.model.BeanPerson;
import mx.edu.utez.aweb.practica4.model.BeanStudent;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletStudent",
            urlPatterns = {
                "/save" //Post

            }
)
public class ServletStudent extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/registration-student.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String matricula = request.getParameter("matricula");
            String nombre = request.getParameter("name");
            String apellido1 = request.getParameter("apellido1");
            String apellido2 = request.getParameter("apellido2");
            String correo = request.getParameter("correo");
            String curp = request.getParameter("curp");
            String contrasenia = request.getParameter("contrasenia");


            ServiceStudent serviceStudent = new ServiceStudent();
            BeanStudent student = new BeanStudent();
            student.setMatricula(matricula);
            student.setNombre(nombre);
            student.setApellido1(apellido1);
            student.setApellido2(apellido2);
            student.setCorreo(correo);
            student.setCurp(curp);
            student.setContrasenia(contrasenia);
            boolean result = serviceStudent.saveStudent(student);
            response.sendRedirect("index?result-save=" + (result ? "ok" : "error"));
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index");
        }
    }
}
