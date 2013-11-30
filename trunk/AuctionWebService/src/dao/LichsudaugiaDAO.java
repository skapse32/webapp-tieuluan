package dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Level;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 	* A data access object (DAO) providing persistence and search support for Lichsudaugia entities.
 	 		* Transaction control of the save(), update() and delete() operations must be handled externally by senders of these methods 
 		  or must be manually added to each of these methods for data to be persisted to the JPA datastore.	
 	 * @see dao.Lichsudaugia
  * @author MyEclipse Persistence Tools 
 */

public class LichsudaugiaDAO  implements ILichsudaugiaDAO{
	//property constants
	public static final String NGUOIDAT = "nguoidat";
	public static final String GIADAT = "giadat";





	private EntityManager getEntityManager() {
		return EntityManagerHelper.getEntityManager();
	}	
	
		/**
	 Perform an initial save of a previously unsaved Lichsudaugia entity. 
	 All subsequent persist actions of this entity should use the #update() method.
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#persist(Object) EntityManager#persist} operation.
	 	 
	 * <pre> 
	 *   EntityManagerHelper.beginTransaction();
	 *   LichsudaugiaDAO.save(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Lichsudaugia entity to persist
	  @throws RuntimeException when the operation fails
	 */
    public void save(Lichsudaugia entity) {
    				EntityManagerHelper.log("saving Lichsudaugia instance", Level.INFO, null);
	        try {
            getEntityManager().persist(entity);
            			EntityManagerHelper.log("save successful", Level.INFO, null);
	        } catch (RuntimeException re) {
        				EntityManagerHelper.log("save failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    /**
	 Delete a persistent Lichsudaugia entity.
	  This operation must be performed 
	 within the a database transaction context for the entity's data to be
	 permanently deleted from the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#remove(Object) EntityManager#delete} operation.
	 	  
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   LichsudaugiaDAO.delete(entity);
	 *   EntityManagerHelper.commit();
	 *   entity = null;
	 * </pre>
	   @param entity Lichsudaugia entity to delete
	 @throws RuntimeException when the operation fails
	 */
    public void delete(Lichsudaugia entity) {
    				EntityManagerHelper.log("deleting Lichsudaugia instance", Level.INFO, null);
	        try {
        	entity = getEntityManager().getReference(Lichsudaugia.class, entity.getId());
            getEntityManager().remove(entity);
            			EntityManagerHelper.log("delete successful", Level.INFO, null);
	        } catch (RuntimeException re) {
        				EntityManagerHelper.log("delete failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    /**
	 Persist a previously saved Lichsudaugia entity and return it or a copy of it to the sender. 
	 A copy of the Lichsudaugia entity parameter is returned when the JPA persistence mechanism has not previously been tracking the updated entity. 
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence
	 store, i.e., database. This method uses the {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge} operation.
	 	 
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   entity = LichsudaugiaDAO.update(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Lichsudaugia entity to update
	 @return Lichsudaugia the persisted Lichsudaugia entity instance, may not be the same
	 @throws RuntimeException if the operation fails
	 */
    public Lichsudaugia update(Lichsudaugia entity) {
    				EntityManagerHelper.log("updating Lichsudaugia instance", Level.INFO, null);
	        try {
            Lichsudaugia result = getEntityManager().merge(entity);
            			EntityManagerHelper.log("update successful", Level.INFO, null);
	            return result;
        } catch (RuntimeException re) {
        				EntityManagerHelper.log("update failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    public Lichsudaugia findById( Long id) {
    				EntityManagerHelper.log("finding Lichsudaugia instance with id: " + id, Level.INFO, null);
	        try {
            Lichsudaugia instance = getEntityManager().find(Lichsudaugia.class, id);
            return instance;
        } catch (RuntimeException re) {
        				EntityManagerHelper.log("find failed", Level.SEVERE, re);
	            throw re;
        }
    }    
    

/**
	 * Find all Lichsudaugia entities with a specific property value.  
	 
	  @param propertyName the name of the Lichsudaugia property to query
	  @param value the property value to match
	  	  @return List<Lichsudaugia> found by query
	 */
    @SuppressWarnings("unchecked")
    public List<Lichsudaugia> findByProperty(String propertyName, final Object value
        ) {
    				EntityManagerHelper.log("finding Lichsudaugia instance with property: " + propertyName + ", value: " + value, Level.INFO, null);
			try {
				getEntityManager().clear();
			final String queryString = "select model from Lichsudaugia model where model." 
					+ propertyName + "= :propertyValue "+"ORDER BY model.giadat DESC ";
								Query query = getEntityManager().createQuery(queryString);
					query.setParameter("propertyValue", value);
					return query.getResultList();
		} catch (RuntimeException re) {
						EntityManagerHelper.log("find by property name failed", Level.SEVERE, re);
				throw re;
		}
	}			
	public List<Lichsudaugia> findByNguoidat(Object nguoidat
	) {
		return findByProperty(NGUOIDAT, nguoidat
		);
	}
	
	public List<Lichsudaugia> findByGiadat(Object giadat
	) {
		return findByProperty(GIADAT, giadat
		);
	}
	
	
	/**
	 * Find all Lichsudaugia entities.
	  	  @return List<Lichsudaugia> all Lichsudaugia entities
	 */
	@SuppressWarnings("unchecked")
	public List<Lichsudaugia> findAll(
		) {
					EntityManagerHelper.log("finding all Lichsudaugia instances", Level.INFO, null);
			try {
			final String queryString = "select model from Lichsudaugia model";
								Query query = getEntityManager().createQuery(queryString);
					return query.getResultList();
		} catch (RuntimeException re) {
						EntityManagerHelper.log("find all failed", Level.SEVERE, re);
				throw re;
		}
	}
	
}