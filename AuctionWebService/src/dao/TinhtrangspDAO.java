package dao;

import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 	* A data access object (DAO) providing persistence and search support for Tinhtrangsp entities.
 	 		* Transaction control of the save(), update() and delete() operations must be handled externally by senders of these methods 
 		  or must be manually added to each of these methods for data to be persisted to the JPA datastore.	
 	 * @see dao.Tinhtrangsp
  * @author MyEclipse Persistence Tools 
 */

public class TinhtrangspDAO  implements ITinhtrangspDAO{
	//property constants
	public static final String TENTINHTRANGSP = "tentinhtrangsp";
	public static final String MOTA = "mota";





	private EntityManager getEntityManager() {
		return EntityManagerHelper.getEntityManager();
	}	
	
		/**
	 Perform an initial save of a previously unsaved Tinhtrangsp entity. 
	 All subsequent persist actions of this entity should use the #update() method.
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#persist(Object) EntityManager#persist} operation.
	 	 
	 * <pre> 
	 *   EntityManagerHelper.beginTransaction();
	 *   TinhtrangspDAO.save(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Tinhtrangsp entity to persist
	  @throws RuntimeException when the operation fails
	 */
    public void save(Tinhtrangsp entity) {
    				EntityManagerHelper.log("saving Tinhtrangsp instance", Level.INFO, null);
	        try {
            getEntityManager().persist(entity);
            			EntityManagerHelper.log("save successful", Level.INFO, null);
	        } catch (RuntimeException re) {
        				EntityManagerHelper.log("save failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    /**
	 Delete a persistent Tinhtrangsp entity.
	  This operation must be performed 
	 within the a database transaction context for the entity's data to be
	 permanently deleted from the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#remove(Object) EntityManager#delete} operation.
	 	  
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   TinhtrangspDAO.delete(entity);
	 *   EntityManagerHelper.commit();
	 *   entity = null;
	 * </pre>
	   @param entity Tinhtrangsp entity to delete
	 @throws RuntimeException when the operation fails
	 */
    public void delete(Tinhtrangsp entity) {
    				EntityManagerHelper.log("deleting Tinhtrangsp instance", Level.INFO, null);
	        try {
        	entity = getEntityManager().getReference(Tinhtrangsp.class, entity.getMatinhtrangsp());
            getEntityManager().remove(entity);
            			EntityManagerHelper.log("delete successful", Level.INFO, null);
	        } catch (RuntimeException re) {
        				EntityManagerHelper.log("delete failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    /**
	 Persist a previously saved Tinhtrangsp entity and return it or a copy of it to the sender. 
	 A copy of the Tinhtrangsp entity parameter is returned when the JPA persistence mechanism has not previously been tracking the updated entity. 
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence
	 store, i.e., database. This method uses the {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge} operation.
	 	 
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   entity = TinhtrangspDAO.update(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Tinhtrangsp entity to update
	 @return Tinhtrangsp the persisted Tinhtrangsp entity instance, may not be the same
	 @throws RuntimeException if the operation fails
	 */
    public Tinhtrangsp update(Tinhtrangsp entity) {
    				EntityManagerHelper.log("updating Tinhtrangsp instance", Level.INFO, null);
	        try {
            Tinhtrangsp result = getEntityManager().merge(entity);
            			EntityManagerHelper.log("update successful", Level.INFO, null);
	            return result;
        } catch (RuntimeException re) {
        				EntityManagerHelper.log("update failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    public Tinhtrangsp findById( Long id) {
    				EntityManagerHelper.log("finding Tinhtrangsp instance with id: " + id, Level.INFO, null);
	        try {
            Tinhtrangsp instance = getEntityManager().find(Tinhtrangsp.class, id);
            return instance;
        } catch (RuntimeException re) {
        				EntityManagerHelper.log("find failed", Level.SEVERE, re);
	            throw re;
        }
    }    
    

/**
	 * Find all Tinhtrangsp entities with a specific property value.  
	 
	  @param propertyName the name of the Tinhtrangsp property to query
	  @param value the property value to match
	  	  @return List<Tinhtrangsp> found by query
	 */
    @SuppressWarnings("unchecked")
    public List<Tinhtrangsp> findByProperty(String propertyName, final Object value
        ) {
    				EntityManagerHelper.log("finding Tinhtrangsp instance with property: " + propertyName + ", value: " + value, Level.INFO, null);
			try {
			final String queryString = "select model from Tinhtrangsp model where model." 
			 						+ propertyName + "= :propertyValue";
								Query query = getEntityManager().createQuery(queryString);
					query.setParameter("propertyValue", value);
					return query.getResultList();
		} catch (RuntimeException re) {
						EntityManagerHelper.log("find by property name failed", Level.SEVERE, re);
				throw re;
		}
	}			
	public List<Tinhtrangsp> findByTentinhtrangsp(Object tentinhtrangsp
	) {
		return findByProperty(TENTINHTRANGSP, tentinhtrangsp
		);
	}
	
	public List<Tinhtrangsp> findByMota(Object mota
	) {
		return findByProperty(MOTA, mota
		);
	}
	
	
	/**
	 * Find all Tinhtrangsp entities.
	  	  @return List<Tinhtrangsp> all Tinhtrangsp entities
	 */
	@SuppressWarnings("unchecked")
	public List<Tinhtrangsp> findAll(
		) {
					EntityManagerHelper.log("finding all Tinhtrangsp instances", Level.INFO, null);
			try {
			final String queryString = "select model from Tinhtrangsp model";
								Query query = getEntityManager().createQuery(queryString);
					return query.getResultList();
		} catch (RuntimeException re) {
						EntityManagerHelper.log("find all failed", Level.SEVERE, re);
				throw re;
		}
	}
	
}