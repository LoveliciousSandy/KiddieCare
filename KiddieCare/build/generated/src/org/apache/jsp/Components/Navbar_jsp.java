package org.apache.jsp.Components;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Navbar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write(" ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Links/Links.jsp", out, false);
      out.write("\n");
      out.write(" <style>\n");
      out.write("     a{color: white}\n");
      out.write("     .navbar{\n");
      out.write("         background-color: blueviolet;\n");
      out.write("     }\n");
      out.write(" </style>\n");
      out.write("<body>\n");
      out.write("<div class=\"bs-example\">\n");
      out.write("    <nav class=\"navbar navbar-expand-md  \">\n");
      out.write("        <a href=\"#\" class=\"navbar-brand\">Brand</a>\n");
      out.write("        <button type=\"button\" class=\"navbar-toggler\" data-toggle=\"collapse\" data-target=\"#navbarCollapse\">\n");
      out.write("            <span style=\"color: black\" class=\"navbar-toggler-icon\"></span>\n");
      out.write("        </button>\n");
      out.write("\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"navbarCollapse\">\n");
      out.write("            <div class=\"navbar-nav\">\n");
      out.write("                <a href=\"#\" class=\"nav-item nav-link active\">Home</a>\n");
      out.write("                <a href=\"#\" class=\"nav-item nav-link\">Profile</a>\n");
      out.write("                <a href=\"#\" class=\"nav-item nav-link\">Messages</a>\n");
      out.write("                <a href=\"#\" class=\"nav-item nav-link disabled\" tabindex=\"-1\">Reports</a>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"navbar-nav ml-auto\">\n");
      out.write("                <a href=\"#\" class=\"nav-item nav-link\">Login</a>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </nav>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
