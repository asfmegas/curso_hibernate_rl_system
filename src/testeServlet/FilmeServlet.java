package testeServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import teste.DependenciaDAO;
import teste.Filme;
import teste.FilmeDAO;

@WebServlet("/filmeservlet")
public class FilmeServlet extends HttpServlet {

    public FilmeServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String originalTitle = request.getParameter("txtOriTitle");
		String ptTitle = request.getParameter("txtPtTitle");
		int dep = Integer.parseInt(request.getParameter("optDep"));
		
		DependenciaDAO daoDep = new DependenciaDAO();
		
		Filme filme = new Filme();
		filme.setOriginalTitle(originalTitle);
		filme.setPtTitle(ptTitle);
		filme.setDep(daoDep.getById(dep));
		
		FilmeDAO dao = new FilmeDAO();
		dao.salvar(filme);
		response.sendRedirect("listarfilmes.jsp");
		
	}

}
