package Config;

import java.io.IOException;
//import java.io.OutputStream;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.Document;

@WebServlet(name = "pdf", urlPatterns = {"/pdf"})
public class pdf extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
//        OutputStream out = response.getOutputStream();
//        try{
//            Class.forName("com.mysql.jdbc.Driver");
//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/aseguradora","root","");
//            PreparedStatement p = con.PreparedStatement("SELECT v.id, c.nombre, s.nombre FROM venta v INNER Join cliente c on c.rut = v.rut INNER JOIN seguro s on s.id = v.seguro;");
//            ResultSet rset = p.executeQuery();
//            Document document = new Document();
//            PdfWriter.getInstance(document,out);
//            document.open();
//            
//            document.add(new Paragraph("LISTA DE VENTAS"));
//            document.add(new Paragraph(" "));
//            document.add(new Paragraph("ID      NOMBRE          SEGURO"));
//            while (rset.next()){
//                document.add(new Paragraph("rset.getInt(1)+"   "+rset.getInt(2)+"  " rset.getInt(3)+"));
//            }
//            document.close();
//            
//        }catch(Exception ex){
//            ex.getMessage();
//        }finally{
            
//          }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
