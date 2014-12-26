package teste;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.hibernate.Session;
import org.hibernate.ejb.EntityManagerImpl;

public class DAO {
	private EntityManagerFactory emf;
	
	public EntityManager getEntityManager(){
		return emf.createEntityManager();
	}
	
	public DAO() {
		emf = Persistence.createEntityManagerFactory("arcevo");
	}
	
	public Session getSession(){
		Session session = null;
		if(getEntityManager().getDelegate() instanceof EntityManagerImpl){
			EntityManagerImpl e = (EntityManagerImpl) getEntityManager().getDelegate();
			return e.getSession();
		} else{
			return (Session) getEntityManager().getDelegate();
		}
		
	}
}
