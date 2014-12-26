package teste;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

public class DependenciaDAO extends DAO {
	public void salvar(Dependencia dep){
		EntityManager em = getEntityManager();
		
		try{
			em.getTransaction().begin();
			em.persist(dep);
			em.getTransaction().commit();
		}catch(Exception e){
			em.getTransaction().rollback();
		}
	}
	
	public List<Dependencia> getListaDep(){
		EntityManager em = getEntityManager();
		
		try{
			Query q = em.createQuery("select object(d) from Dependencia as d");
			return q.getResultList();
		}finally{
			em.close();
		}
	}
	
	public Dependencia getById(int id){
		EntityManager em = getEntityManager();
		return em.find(Dependencia.class, id);
	}
}
