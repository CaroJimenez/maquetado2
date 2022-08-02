package utez.edu.mx.maqueteado1.control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletUser", value = "/ServletUser",
        urlPatterns = {
            "/save-student",
                "/save-instructor"

        }

)
public class ServletUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getServletPath();
        switch (option){
            case "/save-student":
                try{
                    String matricula = request.getParameter("matricula");
                    String nombre = request.getParameter("nombre");
                    String apellido1 = request.getParameter("apellido1");
                    String apellido2= request.getParameter("apellido2");
                    String curp = request.getParameter("curp");
                    String correo = request.getParameter("correo");

                    ServicePerson servicePerson = new ServicePerson();
                    BeanPerson person = new BeanPerson();
                    person.set(name);
                    person.setAge(age);

                    boolean result = servicePerson.savePerson(person);
                }catch
                response.sendRedirect("registration.jsp");
                break;

            case "/save-instructor":
                break;
        }
    }
}
