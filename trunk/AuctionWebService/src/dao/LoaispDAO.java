package dao;

import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 	* A data access object (DAO) providing persistence and search support for Loaisp entities.
 	 		* Transaction control of the save(), update() and delete() operations must be handled externally by senders of these methods 
 		  or must be manually added to each of these methods for data to be persisted to the JPA datastore.	
 	 * @see dao.Loaisp
  * @author MyEclipse Persistence Tools 
 */

public class LoaispDAO  implements ILoaispDAO{
	//property constants
	public static final String TENLOAISP = "tenloaisp";
	public static final String MOTA = "mota";





	private EntityManager getEntityManager() {
		return EntityManagerHelper.getEntityManager();
	}	
	
		/**
	 Perform an initial save of a previously unsaved Loaisp entity. 
	 All subsequent persist actions of this entity should use the #update() method.
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#persist(Object) EntityManager#persist} operation.
	 	 
	 * <pre> 
	 *   EntityManagerHelper.beginTransaction();
	 *   LoaispDAO.save(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Loaisp entity to persist
	  @throws RuntimeException when the operation fails
	 */
    public void save(Loaisp entity) {
    				EntityManagerHelper.log("saving Loaisp instance", Level.INFO, null);
	        try {
            getEntityManager().persist(entity);
            			EntityManagerHelper.log("save successful", Level.INFO, null);
	        } catch (RuntimeException re) {
        				EntityManagerHelper.log("save failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    /**
	 Delete a persistent Loaisp entity.
	  This operation must be performed 
	 within the a database transaction context for the entity's data to be
	 permanently deleted from the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#remove(Object) EntityManager#delete} operation.
	 	  
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   LoaispDAO.delete(entity);
	 *   EntityManagerHelper.commit();
	 *   entity = null;
	 * </pre>
	   @param entity Loaisp entity to delete
	 @throws RuntimeException when the operation fails
	 */
    public void delete(Loaisp entity) {
    				EntityManagerHelper.log("deleting Loaisp instance", Level.INFO, null);
	        try {
        	entity = getEntityManager().getReference(Loaisp.class, entity.getMaloaisp());
            getEntityManager().remove(entity);
            			EntityManagerHelper.log("delete successful", Level.INFO, null);
	        } catch (RuntimeException re) {
        				EntityManagerHelper.log("delete failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    /**
	 Persist a previously saved Loaisp entity and return it or a copy of it to the sender. 
	 A copy of the Loaisp entity parameter is returned when the JPA persistence mechanism has not previously been tracking the updated entity. 
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence
	 store, i.e., database. This method uses the {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge} operation.
	 	 
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   entity = LoaispDAO.update(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Loaisp entity to update
	 @return Loaisp the persisted Loaisp entity instance, may not be the same
	 @throws RuntimeException if the operation fails
	 */
    public Loaisp update(Loaisp entity) {
    				EntityManagerHelper.log("updating Loaisp instance", Level.INFO, null);
	        try {
            Loaisp result = getEntityManager().merge(entity);
            			EntityManagerHelper.log("update successful", Level.INFO, null);
	            return result;
        } catch (RuntimeException re) {
        				EntityManagerHelper.log("update failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    public Loaisp findById( Long id) {
    				EntityManagerHelper.log("finding Loaisp instance with id: " + id, Level.INFO, null);
	        try {
            Loaisp instance = getEntityManager().find(Loaisp.class, id);
            return instance;
        } catch (RuntimeException re) {
        				EntityManagerHelper.log("find failed", Level.SEVERE, re);
	            throw re;
        }
    }    
    

/**
	 * Find all Loaisp entities with a specific property value.  
	 
	  @param propertyName the name of the Loaisp property to query
	  @param value the property value to match
	  	  @return List<Loaisp> found by query
	 */
    @SuppressWarnings("unchecked")
    public List<Loaisp> findByProperty(String propertyName, final Object value
        ) {
    				EntityManagerHelper.log("finding Loaisp instance with property: " + propertyName + ", value: " + value, Level.INFO, null);
			try {
			final String queryString = "select model from Loaisp model where model." 
			 						+ propertyName + "= :propertyValue";
								Query query = getEntityManager().createQuery(queryString);
					query.setParameter("propertyValue", value);
					return query.getResultList();
		} catch (RuntimeException re) {
						EntityManagerHelper.log("find by property name failed", Level.SEVERE, re);
				throw re;
		}
	}			
	public List<Loaisp> findByTenloaisp(Object tenloaisp
	) {
		return findByProperty(TENLOAISP, tenloaisp
		);
	}
	
	public List<Loaisp> findByMota(Object mota
	) {
		return findByProperty(MOTA, mota
		);
	}
	
	
	/**
	 * Find all Loaisp entities.
	  	  @return List<Loaisp> all Loaisp entities
	 */
	@SuppressWarnings("unchecked")
	public List<Loaisp> findAll(
		) {
					EntityManagerHelper.log("finding all Loaisp instances", Level.INFO, null);
			try {
			final String queryString = "select model from Loaisp model";
								Query query = getEntityManager().createQuery(queryString);
					return query.getResultList();
		} catch (RuntimeException re) {
						EntityManagerHelper.log("find all failed", Level.SEVERE, re);
				throw re;
		}
	}
	
}