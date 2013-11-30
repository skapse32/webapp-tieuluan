package dao;

import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 	* A data access object (DAO) providing persistence and search support for Hinhthucthanhtoan entities.
 	 		* Transaction control of the save(), update() and delete() operations must be handled externally by senders of these methods 
 		  or must be manually added to each of these methods for data to be persisted to the JPA datastore.	
 	 * @see dao.Hinhthucthanhtoan
  * @author MyEclipse Persistence Tools 
 */

public class HinhthucthanhtoanDAO  implements IHinhthucthanhtoanDAO{
	//property constants
	public static final String TENHTTT = "tenhttt";
	public static final String MOTA = "mota";





	private EntityManager getEntityManager() {
		return EntityManagerHelper.getEntityManager();
	}	
	
		/**
	 Perform an initial save of a previously unsaved Hinhthucthanhtoan entity. 
	 All subsequent persist actions of this entity should use the #update() method.
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#persist(Object) EntityManager#persist} operation.
	 	 
	 * <pre> 
	 *   EntityManagerHelper.beginTransaction();
	 *   HinhthucthanhtoanDAO.save(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Hinhthucthanhtoan entity to persist
	  @throws RuntimeException when the operation fails
	 */
    public void save(Hinhthucthanhtoan entity) {
    				EntityManagerHelper.log("saving Hinhthucthanhtoan instance", Level.INFO, null);
	        try {
            getEntityManager().persist(entity);
            			EntityManagerHelper.log("save successful", Level.INFO, null);
	        } catch (RuntimeException re) {
        				EntityManagerHelper.log("save failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    /**
	 Delete a persistent Hinhthucthanhtoan entity.
	  This operation must be performed 
	 within the a database transaction context for the entity's data to be
	 permanently deleted from the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#remove(Object) EntityManager#delete} operation.
	 	  
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   HinhthucthanhtoanDAO.delete(entity);
	 *   EntityManagerHelper.commit();
	 *   entity = null;
	 * </pre>
	   @param entity Hinhthucthanhtoan entity to delete
	 @throws RuntimeException when the operation fails
	 */
    public void delete(Hinhthucthanhtoan entity) {
    				EntityManagerHelper.log("deleting Hinhthucthanhtoan instance", Level.INFO, null);
	        try {
        	entity = getEntityManager().getReference(Hinhthucthanhtoan.class, entity.getMahttt());
            getEntityManager().remove(entity);
            			EntityManagerHelper.log("delete successful", Level.INFO, null);
	        } catch (RuntimeException re) {
        				EntityManagerHelper.log("delete failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    /**
	 Persist a previously saved Hinhthucthanhtoan entity and return it or a copy of it to the sender. 
	 A copy of the Hinhthucthanhtoan entity parameter is returned when the JPA persistence mechanism has not previously been tracking the updated entity. 
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence
	 store, i.e., database. This method uses the {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge} operation.
	 	 
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   entity = HinhthucthanhtoanDAO.update(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Hinhthucthanhtoan entity to update
	 @return Hinhthucthanhtoan the persisted Hinhthucthanhtoan entity instance, may not be the same
	 @throws RuntimeException if the operation fails
	 */
    public Hinhthucthanhtoan update(Hinhthucthanhtoan entity) {
    				EntityManagerHelper.log("updating Hinhthucthanhtoan instance", Level.INFO, null);
	        try {
            Hinhthucthanhtoan result = getEntityManager().merge(entity);
            			EntityManagerHelper.log("update successful", Level.INFO, null);
	            return result;
        } catch (RuntimeException re) {
        				EntityManagerHelper.log("update failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    public Hinhthucthanhtoan findById( Long id) {
    				EntityManagerHelper.log("finding Hinhthucthanhtoan instance with id: " + id, Level.INFO, null);
	        try {
            Hinhthucthanhtoan instance = getEntityManager().find(Hinhthucthanhtoan.class, id);
            return instance;
        } catch (RuntimeException re) {
        				EntityManagerHelper.log("find failed", Level.SEVERE, re);
	            throw re;
        }
    }    
    

/**
	 * Find all Hinhthucthanhtoan entities with a specific property value.  
	 
	  @param propertyName the name of the Hinhthucthanhtoan property to query
	  @param value the property value to match
	  	  @return List<Hinhthucthanhtoan> found by query
	 */
    @SuppressWarnings("unchecked")
    public List<Hinhthucthanhtoan> findByProperty(String propertyName, final Object value
        ) {
    				EntityManagerHelper.log("finding Hinhthucthanhtoan instance with property: " + propertyName + ", value: " + value, Level.INFO, null);
			try {
			final String queryString = "select model from Hinhthucthanhtoan model where model." 
			 						+ propertyName + "= :propertyValue";
								Query query = getEntityManager().createQuery(queryString);
					query.setParameter("propertyValue", value);
					return query.getResultList();
		} catch (RuntimeException re) {
						EntityManagerHelper.log("find by property name failed", Level.SEVERE, re);
				throw re;
		}
	}			
	public List<Hinhthucthanhtoan> findByTenhttt(Object tenhttt
	) {
		return findByProperty(TENHTTT, tenhttt
		);
	}
	
	public List<Hinhthucthanhtoan> findByMota(Object mota
	) {
		return findByProperty(MOTA, mota
		);
	}
	
	
	/**
	 * Find all Hinhthucthanhtoan entities.
	  	  @return List<Hinhthucthanhtoan> all Hinhthucthanhtoan entities
	 */
	@SuppressWarnings("unchecked")
	public List<Hinhthucthanhtoan> findAll(
		) {
					EntityManagerHelper.log("finding all Hinhthucthanhtoan instances", Level.INFO, null);
			try {
			final String queryString = "select model from Hinhthucthanhtoan model";
								Query query = getEntityManager().createQuery(queryString);
					return query.getResultList();
		} catch (RuntimeException re) {
						EntityManagerHelper.log("find all failed", Level.SEVERE, re);
				throw re;
		}
	}
	
}