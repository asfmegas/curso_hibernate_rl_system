package teste;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.sun.security.ntlm.Client;

import teste.Filme;

public class FilmeDAO extends DAO{
	
	public void salvar(Filme filme){
		EntityManager em = getEntityManager();
		
		try{
			em.getTransaction().begin();
			em.persist(filme);
			em.getTransaction().commit();
		}catch(Exception e){
			em.getTransaction().rollback();
		}
	}
	
	public List<Filme> getListaFilmes(){
		EntityManager em = getEntityManager();
		
		try{
			Query q = em.createQuery("select object(f) from Filme as f");
			return q.getResultList();
		}finally{
			em.close();
		}
	}
	
	public List<Filme> getListaFilmes2(){
		EntityManager em = getEntityManager();
		Criteria cri = getSession().createCriteria(Filme.class);
		cri.add(Restrictions.eq("originalTitle", "Edge of Tomorrow"));
		return cri.list();
	}
}
