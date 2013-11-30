package dao;

import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 	* A data access object (DAO) providing persistence and search support for Hoadon entities.
 	 		* Transaction control of the save(), update() and delete() operations must be handled externally by senders of these methods 
 		  or must be manually added to each of these methods for data to be persisted to the JPA datastore.	
 	 * @see dao.Hoadon
  * @author MyEclipse Persistence Tools 
 */

public class HoadonDAO  implements IHoadonDAO{
	//property constants
	public static final String DONGIA = "dongia";
	public static final String NGUOIDANG = "nguoidang";
	public static final String NGUOIMUA = "nguoimua";





	private EntityManager getEntityManager() {
		return EntityManagerHelper.getEntityManager();
	}	
	
		/**
	 Perform an initial save of a previously unsaved Hoadon entity. 
	 All subsequent persist actions of this entity should use the #update() method.
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#persist(Object) EntityManager#persist} operation.
	 	 
	 * <pre> 
	 *   EntityManagerHelper.beginTransaction();
	 *   HoadonDAO.save(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Hoadon entity to persist
	  @throws RuntimeException when the operation fails
	 */
    public void save(Hoadon entity) {
    				EntityManagerHelper.log("saving Hoadon instance", Level.INFO, null);
	        try {
            getEntityManager().persist(entity);
            			EntityManagerHelper.log("save successful", Level.INFO, null);
	        } catch (RuntimeException re) {
        				EntityManagerHelper.log("save failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    /**
	 Delete a persistent Hoadon entity.
	  This operation must be performed 
	 within the a database transaction context for the entity's data to be
	 permanently deleted from the persistence store, i.e., database. 
	 This method uses the {@link javax.persistence.EntityManager#remove(Object) EntityManager#delete} operation.
	 	  
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   HoadonDAO.delete(entity);
	 *   EntityManagerHelper.commit();
	 *   entity = null;
	 * </pre>
	   @param entity Hoadon entity to delete
	 @throws RuntimeException when the operation fails
	 */
    public void delete(Hoadon entity) {
    				EntityManagerHelper.log("deleting Hoadon instance", Level.INFO, null);
	        try {
        	entity = getEntityManager().getReference(Hoadon.class, entity.getMahoadon());
            getEntityManager().remove(entity);
            			EntityManagerHelper.log("delete successful", Level.INFO, null);
	        } catch (RuntimeException re) {
        				EntityManagerHelper.log("delete failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    /**
	 Persist a previously saved Hoadon entity and return it or a copy of it to the sender. 
	 A copy of the Hoadon entity parameter is returned when the JPA persistence mechanism has not previously been tracking the updated entity. 
	 This operation must be performed within the a database transaction context for the entity's data to be permanently saved to the persistence
	 store, i.e., database. This method uses the {@link javax.persistence.EntityManager#merge(Object) EntityManager#merge} operation.
	 	 
	 * <pre>
	 *   EntityManagerHelper.beginTransaction();
	 *   entity = HoadonDAO.update(entity);
	 *   EntityManagerHelper.commit();
	 * </pre>
	   @param entity Hoadon entity to update
	 @return Hoadon the persisted Hoadon entity instance, may not be the same
	 @throws RuntimeException if the operation fails
	 */
    public Hoadon update(Hoadon entity) {
    				EntityManagerHelper.log("updating Hoadon instance", Level.INFO, null);
	        try {
            Hoadon result = getEntityManager().merge(entity);
            			EntityManagerHelper.log("update successful", Level.INFO, null);
	            return result;
        } catch (RuntimeException re) {
        				EntityManagerHelper.log("update failed", Level.SEVERE, re);
	            throw re;
        }
    }
    
    public Hoadon findById( Long id) {
    				EntityManagerHelper.log("finding Hoadon instance with id: " + id, Level.INFO, null);
	        try {
            Hoadon instance = getEntityManager().find(Hoadon.class, id);
            return instance;
        } catch (RuntimeException re) {
        				EntityManagerHelper.log("find failed", Level.SEVERE, re);
	            throw re;
        }
    }    
    

/**
	 * Find all Hoadon entities with a specific property value.  
	 
	  @param propertyName the name of the Hoadon property to query
	  @param value the property value to match
	  	  @return List<Hoadon> found by query
	 */
    @SuppressWarnings("unchecked")
    public List<Hoadon> findByProperty(String propertyName, final Object value
        ) {
    				EntityManagerHelper.log("finding Hoadon instance with property: " + propertyName + ", value: " + value, Level.INFO, null);
			try {
			final String queryString = "select model from Hoadon model where model." 
			 						+ propertyName + "= :propertyValue";
								Query query = getEntityManager().createQuery(queryString);
					query.setParameter("propertyValue", value);
					return query.getResultList();
		} catch (RuntimeException re) {
						EntityManagerHelper.log("find by property name failed", Level.SEVERE, re);
				throw re;
		}
	}			
	public List<Hoadon> findByDongia(Object dongia
	) {
		return findByProperty(DONGIA, dongia
		);
	}
	
	public List<Hoadon> findByNguoidang(Object nguoidang
	) {
		return findByProperty(NGUOIDANG, nguoidang
		);
	}
	
	public List<Hoadon> findByNguoimua(Object nguoimua
	) {
		return findByProperty(NGUOIMUA, nguoimua
		);
	}
	
	
	/**
	 * Find all Hoadon entities.
	  	  @return List<Hoadon> all Hoadon entities
	 */
	@SuppressWarnings("unchecked")
	public List<Hoadon> findAll(
		) {
					EntityManagerHelper.log("finding all Hoadon instances", Level.INFO, null);
			try {
			final String queryString = "select model from Hoadon model";
								Query query = getEntityManager().createQuery(queryString);
					return query.getResultList();
		} catch (RuntimeException re) {
						EntityManagerHelper.log("find all failed", Level.SEVERE, re);
				throw re;
		}
	}
	
}