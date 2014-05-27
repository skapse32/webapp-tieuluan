package dto;

import java.util.List;
import java.util.logging.Level;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import dao.EntityManagerHelper;
import dao.IHangxeDAO;
import domain.Hangxe;

public class HangxeDTO implements IHangxeDAO {

	private EntityManager getEntityManager() {
		return EntityManagerHelper.getEntityManager();
	}

	@Override
	public void save(Hangxe entity) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Hangxe entity) {
		// TODO Auto-generated method stub

	}

	@Override
	public Hangxe update(Hangxe entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Hangxe findById(int id) {
		// TODO Auto-generated method stub
		EntityManagerHelper.log("finding Hangxe instance with id: " + id,
				Level.INFO, null);
		try {
			Hangxe instance = getEntityManager().find(Hangxe.class, id);
			return instance;
		} catch (RuntimeException re) {
			EntityManagerHelper.log("find failed", Level.SEVERE, re);
			throw re;
		}
	}

	@Override
	public List<Hangxe> findByProperty(String propertyName, Object value) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Hangxe> findAll() {
		// TODO Auto-generated method stub
		{
			EntityManagerHelper.log("finding all HangXe instances", Level.INFO,
					null);
			try {
				final String queryString = "select model from Hangxe model";
				Query query = getEntityManager().createQuery(queryString);
				return query.getResultList();
			} catch (RuntimeException re) {
				EntityManagerHelper.log("find all failed", Level.SEVERE, re);
				throw re;
			}
		}
	}

}
